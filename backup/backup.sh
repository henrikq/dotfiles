#!/bin/bash

BACKUP_FROM=/home/henqvi
BACKUP_MOUNT=/mnt/backup
BACKUP_TO=file://$BACKUP_MOUNT/$HOSTNAME
EXCLUDES_FILE=/home/henqvi/dotfiles/backup/backup-excludes
LOG_PATH=/var/log
EMAIL_PATH=/tmp
EMAIL=henqvi@kantega.no
PASSPHRASE=$(</home/henqvi/duplicity-passphrase)

if [ $? -ne 0 ]
then
  echo ERROR: passphrase file not readable
  exit
fi

# check if mounted
if ! findmnt -M $BACKUP_MOUNT > /dev/null
then
  echo ERROR: $BACKUP_MOUNT not mounted
  exit
fi

# setup logging
DATE=$(date --iso-8601=minutes)
LOG_FILE=$LOG_PATH/duplicity_$DATE
EMAIL_FILE=$EMAIL_PATH/duplicity_email_$DATE
echo "Subject: backup, duplicity, $DATE
" > $EMAIL_FILE

# settup backup commands
BACKUP_OPTIONS="--full-if-older-than 1M --log-file $LOG_FILE --exclude-filelist $EXCLUDES_FILE"
BACKUP_EXEC="duplicity $BACKUP_OPTIONS $BACKUP_FROM $BACKUP_TO"
BACKUP_CLEANUP_INCREMENTAL="duplicity remove-all-inc-of-but-n-full 1 --log-file $LOG_FILE $BACKUP_TO"
BACKUP_CLEANUP_FULL="duplicity remove-older-than 6M --log-file $LOG_FILE $BACKUP_TO"

function execute_backup {
  echo "$ $BACKUP_EXEC" | tee -a $LOG_FILE | tee -a $EMAIL_FILE
  $BACKUP_EXEC | tee -a $EMAIL_FILE

  if [ ${PIPESTATUS[0]} -eq 0 ]
  then
    echo -e "\n$ $BACKUP_CLEANUP_INCREMENTAL" | tee -a $LOG_FILE | tee -a $EMAIL_FILE
    $BACKUP_CLEANUP_INCREMENTAL | tee -a $EMAIL_FILE
  fi

  if [ ${PIPESTATUS[0]} -eq 0 ]
  then
    echo -e "\n$ $BACKUP_CLEANUP_FULL" | tee -a $LOG_FILE | tee -a $EMAIL_FILE
    $BACKUP_CLEANUP_FULL | tee -a $EMAIL_FILE
  fi
}

# execute
export PASSPHRASE
execute_backup
unset PASSPHRASE

/usr/sbin/sendmail $EMAIL < $EMAIL_FILE
