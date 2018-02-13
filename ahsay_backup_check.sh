#!/bin/bash


set -x
LC_ALL=C
STATE_OK=0
STATE_WARNING=1
STATE_CRITICAL=2

backup_date=`date -d "-1 day" +%Y-%m-%d`

parse_api_web_log_server01=$(wget -qO- "http://192.168.100.200/obs/api/ListBackupJobStatus.do?LoginName=user&SysPwd=password&SysUser=nagios&BackupDate=$backup_date" | grep -E -o ".{0,47}BACKUPSETID.{0,27}" | awk '{print $1}' | cut -d '=' -f2 | sed s/\"//g)
parse_api_web_log_server02=$(wget -qO- "http://192.168.100.200/obs/api/ListBackupJobStatus.do?LoginName=user&SysPwd=password&SysUser=nagios&BackupDate=$backup_date" | grep -E -o ".{0,47}BACKUPSETID.{0,27}" | awk '{print $1}' | cut -d '=' -f2 | sed s/\"//g)
parse_api_web_log_server03=$(wget -qO- "http://192.168.100.200/obs/api/ListBackupJobStatus.do?LoginName=user&SysPwd=password&SysUser=nagios&BackupDate=$backup_date" | grep -E -o ".{0,47}BACKUPSETID.{0,27}" | awk '{print $1}' | cut -d '=' -f2 | sed s/\"//g)
parse_api_web_log_server04=$(wget -qO- "http://192.168.100.200/obs/api/ListBackupJobStatus.do?LoginName=use1&SysPwd=password&SysUser=nagios&BackupDate=$backup_date" | grep -E -o ".{0,47}BACKUPSETID.{0,25}" | awk '{print $1}' | cut -d '=' -f2 | sed s/\"//g)
parse_api_web_log_server05=$(wget -qO- "http://192.168.100.200/obs/api/ListBackupJobStatus.do?LoginName=user&SysPwd=password&SysUser=nagios&BackupDate=$backup_date" | grep -E -o ".{0,47}BACKUPSETID.{0,27}" | awk '{print $1}' | cut -d '=' -f2 | sed s/\"//g)

####################

if [ "$server01" == "BS_STOP_SUCCESS" ] && [ "$server02" == "BS_STOP_SUCCESS" ] && [ "$server03" == "BS_STOP_SUCCESS" ] && [ "$server04" == "BS_STOP_SUCCESS" ] && [ "$server05" == "BS_STOP_SUCCESS" ]
then
echo "All Backups Completed Successfully"
exit $STATE_OK
else
echo "BACKUP FAILED: server01=$parse_api_web_log_server01 server02=$parse_api_web_log_server02 server03=$parse_api_web_log_server03 server04=$parse_api_web_log_server04 server05=$parse_api_web_log_server05"
exit $STATE_CRITICAL
fi



####################
###################
