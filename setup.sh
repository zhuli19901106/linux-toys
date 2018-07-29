#!/usr/bin/bash

ln_opts='-s'
cp_opts='-rn'
for arg in $@; do
    if [[ $arg == '-f' ]]; then
        ln_opts='-sf'
        cp_opts='-rf'
    fi
done

cur_dir=`readlink -f $0`
cur_dir=`dirname $cur_dir`
cd $cur_dir
ln $ln_opts `readlink -f bin` -t ~/
cd dot-conf
for f in `ls`; do
    echo "Copying conf file \"$f\" to \"~/.$f\""
    cp $cp_opts $f ~/.${f}
done
cd ..
