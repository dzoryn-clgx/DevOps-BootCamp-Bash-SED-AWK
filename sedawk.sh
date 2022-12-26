#!/bin/bash
cp ./passwd ./passwd_new
awk 'BEGIN{FS=":";OFS=":"} $1=="saned" {$NF="/bin/bash"}1' passwd_new > tmp && mv tmp passwd_new
sed -i '/avahi:/s@/usr/sbin/nologin@/bin/bash@' passwd_new
awk -i inplace -F':' -v OFS=: '{print $1, $3, $5, $7}' passwd_new
sed -i '/daemon/d' passwd_new
awk 'BEGIN{FS=":";OFS=":"} $2%2==0 {$NF="/bin/zsh"}1' passwd_new > tmp && mv tmp passwd_new
