#! /bin/bash

awk -vFPAT='([^" "]*)|("[^"]+")' -vOFS=" " '{if(count[$15]++ >= max) max = count[$15]} END {for ( i in count ) if(max == count[i]) print i, count[i] }' access.log | awk '{print $15}' access.log | head -10

