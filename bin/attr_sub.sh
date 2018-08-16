# Change python class public members to private, except those in the array.
#!/usr/bin/bash
f=$1

sed -i 's/self\.\([a-zA-Z]\w\+\)/self._\1/g' $f
arr=( train predict score save load get_default_args get_framework_name get_model_name get_train_report )
for fun_name in ${arr[@]}; do
    sed -i 's/self\._${fun_name}(/self.${fun_name}(/g' $f
done

