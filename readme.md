
gbk2utf8
``` bash
for i in *.srt; do iconv -f GBK -t UTF-8//TRANSLIT $i > $i.srt; done
```
