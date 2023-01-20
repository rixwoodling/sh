#!/bin/bash

# remux mkv to mp4, re-encode dts to aac
for i in *.mkv; do 
    ffmpeg -i $i -c:v copy -c:a aac -b:a 384k $i.mp4; 
done

