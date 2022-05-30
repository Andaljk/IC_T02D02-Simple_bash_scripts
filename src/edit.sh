#!/bin/bash

read -p "Введите путь до файла: " filepath
read -p "Введите строку для замены: " s_string
read -p "Введите замену для строки: " r_string

cd ..

#Let's replace it

sed -i '' "s/$s_string/$r_string/g" $filepath


f_size="$(stat -f%z $filepath)"
f_time="$(stat -f "%Sm" -t "%Y-%m-%d %H:%M" $filepath)"
f_hash="$(shasum -a 256 $filepath |cut -d' ' -f1)"

echo ${filepath} - ${f_size} - ${f_time} - ${f_hash} - sha256 >> src/files.log
