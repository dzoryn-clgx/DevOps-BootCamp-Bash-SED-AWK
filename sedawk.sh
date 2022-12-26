#!/bin/bash


cp ./passwd ./passwd_new
file="./passwd_new"
awk 'BEGIN{FS=":";OFS=":"} $1=="saned" {$NF="/bin/bash"}1' "${file}" > tmp && mv tmp "${file}"
sed -i '/avahi:/s@/usr/sbin/nologin@/bin/bash@' "${file}"
awk 'BEGIN{FS=":";OFS=":"} {print $1,$3,$5,$7 > ""${file}""}' "${file}"
sed -i '/daemon/d' "${file}"
awk 'BEGIN{FS=":";OFS=":"} $2%2==0 {$NF="/bin/zsh"}1' "${file}" > tmp && mv tmp "${file}"
