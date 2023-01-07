.sh             command
-               -
gbk2utf8        for i in *.srt; do iconv -f GBK -t UTF-8//TRANSLIT $i > $i.srt; done
mkv2mp4         for i in *.mkv; do ffmpeg -i $i -c:v copy -c:a aac -b:a 384k $i.mp4; done

