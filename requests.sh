#! /bin/bash


# comparing time stamps

# READ THE FROM and TO TIME STAMPS

# read -p 'From TimeStamp' from
# echo
# read -p 'To Timestamp' to







# METHOd (i)

# if [ "$1" = "" ]; then
# 	echo "how long ago as starting time in minutes, i.e. 30 for 30 minutes"
# 	read PTIME
# else
# 	PTIME=$1
# fi
 
# # current time
# DNOW=`date +%d/%b/%Y:%H:%M:%S`
 
# # time formatted escaped sed ready
# ESCAPED_DNOW=`echo ${DNOW} | sed 's,/,\\\/,g' | sed 's,:,\\\:,g'`
 
# # previous time
# PDATE=`date +%d/%b/%Y:%H:%M:%S --date="${PTIME} minutes ago"`
 
# # time formatted escaped sed ready
# ESCAPED_PDATE=`echo ${PDATE} | sed 's,/,\\\/,g' | sed 's,:,\\\:,g'`
 
# # now we can simply echo the sed line
# echo "sed -n '/${ESCAPED_PDATE}/,/${ESCAPED_DNOW}/ p'"
 

 #METHOD (ii)

# sed -rne "/\$from/,/\$to/ p" access.log



# METHOS (iii)

#dategrep --start "12:00" --end "12:15" --format "%b %d %H:%M:%S" access.log


#METHOD (iv)

#awk -v var1 = "$from" -v var2 = "$to" 'BEGIN { if( $2 >= var1 && $2 <= var2 ) print $9 }' access.log


#METHOD (v)

sudo awk -v d1="$(date --date '-10 min' '+%d/%b/%Y:%T')" '{gsub(/^[\[\t]+/, "", $2);}; $2 > d1' access.log