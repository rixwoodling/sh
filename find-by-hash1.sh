#!/bin/bash

find /lib/firmware -type f -exec md5sum {} + | sort -k 2 # > /usr/local/opt/15049-lib_firmware_hashes.txt

