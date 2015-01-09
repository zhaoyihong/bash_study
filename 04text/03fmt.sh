#!/bin/bash
#fmt 能进行文本的分行和合并
# fmt -w n  将文本长的行切割或者短的行合并使每行为n字符宽
# -w 默认为75  , -s 只切割不合并行

sed -n -e '10000,10020p'  /usr/share/dict/american-english | fmt -w30
