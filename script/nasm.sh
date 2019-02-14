#!/bin/bash
nasm -f elf64 $1
file_name=${1%.*}
ld ${file_name}.o

