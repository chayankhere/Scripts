#! /bin/bash

#TASK 1
echo "HIGHEST REQUESTED HOST"
awk '{print $15}' access.log |sort |uniq -c|sort -rn| head -1
echo 

echo "HIGHEST REQUESTED UPSTREAM:IP"
awk '{count[$10]++} END {for ( i in count ) print i, count[i] }' access.log | sort -n -r| head -1
echo

echo "MOST REQUESTED PATH"
awk '{print $5}' access.log |sort |uniq -c|sort -rn| head -1
echo 


#TASK 2

echo "TOTAL REQUESTS PER STATUS CODES"
echo
echo "No. of REQUESTS        STATUS CODE"
awk '{print "               " $7}' access.log | sort | uniq -c | sort -nr                                          
echo

#TASK 3
echo "TOP 5 MOST HOST"
awk '{print $15}' access.log |sort |uniq -c|sort -rn| head -5
echo 

echo "TOP 5 BODYBYTES"
awk '{count[$10]++} END {for ( i in count ) print i, count[i] }' access.log | sort -n -r| head -5
echo

echo "TOP 5 UPSTREAM IP: PORT"
awk '{count[$9]++} END {for ( i in count ) print i, count[i] }' access.log | sort -n -r| head -5
echo

echo "TOP 5 RESPONSE TIME"
awk '{count[$8]++} END {for ( i in count ) print i, count[i] }' access.log | sort -n -r| head -5
echo

echo "TOP 5 MOST REQUESTED PATH"
awk '{print $5}' access.log |sort |uniq -c|sort -rn| head -5
echo 



#TASK 4
echo "PRINT STATUS CODES RECEIVED BY EACH HOST"
awk '{ print $15 " " $7 }' access.log | sort | uniq
echo                    



#TASK  6
echo
echo "Response time greater than 10"
echo
awk '{if ( $8 >= 10 )print $8 " -> " $9 }' access.log | sort | uniq | sort  -rn 
echo
echo "Response time greater than 5"
echo
awk '{if ( $8 >= 5 && $8 <10 )print $8 " -> " $9 }' access.log | sort | uniq | sort  -rn
echo
echo "Response time greater than 2" 
echo
awk '{if ( $8 >= 2 && $8 < 5 )print $8 " -> " $9 }' access.log | sort | uniq | sort  -rn  
echo