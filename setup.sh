#!/usr/bin/bash

ln_opts='-s'
for arg in $@; do
    if [[ $arg == '-f' ]]; then
        ln_opts='-sf'
    fi
done

cur_dir=`readlink -f $0`
cur_dir=`dirname $cur_dir`
cd $cur_dir
ln $ln_opts `readlink -f bin` -t ~/
cd dot-conf
for f in `ls`; do
    ln $ln_opts `readlink -f $f` ~/.${f}
done
cd ..
