#!/bin/bash

# a. Create copy of passwd file to passwd_new.
cp ./passwd ./passwd_new


# b. Change shell for user saned from /usr/sbin/nologin to /bin/bash using AWK
awk 'BEGIN{FS=":";OFS=":"} $1=="saned" {$NF="/bin/bash"}1' passwd_new > tmp && mv tmp passwd_new

# c. Change shell for user avahi from /usr/sbin/nologin to /bin/bash using SED
sed -i '/avahi:/s/\/usr\/sbin\/nologin/\/bin\/bash/' ./passwd_new

# d. Save only 1-st 3-th 5-th 7-th columns of each string based on : delimiter
awk 'BEGIN{FS=":";OFS=":"} {print $1,$3,$5,$7 > "passwd_new"}' passwd_new

# e. Remove all lines from file containing word daemon
sed -i '/daemon/d' ./passwd_new

# f. Change shell for all users with even UID to /bin/zsh
awk 'BEGIN{FS=":";OFS=":"} $2%2==0 {$NF="/bin/zsh"}1' passwd_new > tmp && mv tmp passwd_new
