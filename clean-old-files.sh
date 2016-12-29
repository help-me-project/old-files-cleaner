#!/bin/sh

clean_file_mask=$1
clean_older=$2

if [ $# -ne 2 ];
then
    echo "=================================================================================="
    echo "= Utility for clean old files such as Tomcat Logs                                ="
    echo "= This utility is delete all files (by mask) older n-days                        ="
    echo "= web: http://help-me-24.com                                                     ="
    echo "=                                                                                ="
    echo "= Usage example: old_log_clean.sh \"/opt/apache-tomcat-8.0.32/logs/catalina*\" 2 ="
    echo "=================================================================================="
    exit 0
fi

delete_older=`date +%s -d "$2 day ago" `
find $1 -maxdepth 0 -type f | while read curent_file;
    do

        unix_time_last_mod=$(stat -c %Y "$curent_file")
        if [ "$delete_older" -gt "$unix_time_last_mod" ];
                then
                        rm -f "$curent_file"
                fi
    done