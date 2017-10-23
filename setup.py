#!/usr/bin/python
"""Setup dotfiles."""

import argparse
import logging
import os



def _link_home_files(args):
    pass


def _setLogLevel(args):
    VERBOSE = logging.INFO - 1
    logging.addLevelName(VERBOSE, "INFO   ")
    logging.verbose = lambda m: logging.log(VERBOSE, m)
    log_format = {
        'format': '%(levelname)-7s: %(asctime)s - %(message)s',
        'datefmt': '%H:%M:%S'
    }
    if args.verbose:
        logging.basicConfig(level=VERBOSE, **log_format)
    else:
        logging.basicConfig(level=logging.INFO, **log_format)
    logging.verbose = lambda m: logging.log(VERBOSE, m)


def _main():
    parser = argparse.ArgumentParser(
        description='Setup dotfiles')
    parser.add_argument('-s', dest="dry", action='store_true', help='run dry')
    parser.add_argument('-v', dest='verbose', action='store_true',
                        help='verbose')
    args = parser.parse_args()

    _setLogLevel(args)
    _link_home_files(args)

if __name__ == "__main__":
    _main()
