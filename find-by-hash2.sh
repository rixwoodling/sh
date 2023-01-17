#!/bin/bash

find -H /lib/firmware/* ! -type d -exec md5sum {} + | sort -k 2 | sed 's/  /,/' | tee /usr/local/opt/file.txt

