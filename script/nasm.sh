#!/bin/bash
set -e
nasm -g -f elf64 $1
file_name=${1%.*}
ld ${file_name}.o
rm ${file_name}.o
