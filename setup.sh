#!/usr/bin/bash

CP_OVERWRTIE=false

for arg in $@; do
    if [[ $arg == '-f' ]]; then
        CP_OVERWRITE=true
    fi
done

cur_dir=`readlink -f $0`
cur_dir=`dirname $cur_dir`

cd $cur_dir
if [[ $CP_OVERWRITE == true ]]; then
    rm -rf ~/bin
fi
echo "Copying conf file \"bin\" to \"~/bin\""
cp -r bin ~/bin

cd dot-conf
for f in `ls`; do
    echo "Copying conf file \"$f\" to \"~/.$f\""
    if [[ $CP_OVERWRITE == true ]]; then
        rm -rf ~/.${f}
    fi
    cp -r $f ~/.${f}
done
cd ..
