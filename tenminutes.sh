#!/bin/bash

 
#METHOS (1)
awk -v d1="$(date --date="-10 min" "+%d/%b/%Y:%H:%M:%S")" -v d2="$(date "+%d/%b/%Y:%H:%M:%S")" '($2 > d1 && $2 < d2 || $2 ~ d2)' access.log

#METHOD (2)

# awk \
# -v start="$(date "+%d/%b/%Y:%T" --date=@$(expr `date +%s` - 600))" \
# -v end="$(date "+%d/%b/%Y:%T")" \
# '$0 "^"start, $0 ~ end' \
# access.log

#METHOD (3)

#awk -v d1="$(date --date '-10 min' '+%d/%b/%Y:%T')" '{gsub(/^[\[\t]+/, "", $2);}; $2 > d1' access.log


#METHOD (4)

# lastline=$(tail -n1 access.log)
# last10=$(($(date -d "$lastline" +%s) - (10 * 60)))
# $ while read line; do
# [ $(date -d "${line:0:15}" +%s) -gt $last10 ] && printf "$line\n"
# done < access.log

