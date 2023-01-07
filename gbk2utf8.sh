#!/bin/bash

# convert GBK subs to UTF-8 encoding
for i in *.srt; do iconv -f GBK -t UTF-8//TRANSLIT $i > $i.srt; done

