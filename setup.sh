#!/usr/bin/bash

cur_dir=`readlink -f $0`
cur_dir=`dirname $cur_dir`
cd $cur_dir
ln -s `readlink -f bin` -t ~/
cd dot-conf
for f in `ls`; do
    ln -s `readlink -f $f` ~/.${f}
done
cd ..
