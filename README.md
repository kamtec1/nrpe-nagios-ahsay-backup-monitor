# nrpe-nagios-ahsay-backup-monitor

NRPE check Ahsay backup status

Summary: This is a plugin (backup_ahsay_checker) that monitors ahsay backup sets .

Full Description: This is a basic plugin that monitors ahsay backup sets that was created in ahsayCBS panel. This plugin have 2 main options:

    Success status - all backups are ok
    Error status - backup have errors or warnings

and will be more :)

Installation instructions:

Edit file /etc/sudoers and add the following;

nrpe ALL=(root) NOPASSWD: /usr/lib64/nagios/plugins/backup_ahsay_checker.sh nagios ALL=(root) NOPASSWD: /usr/lib64/nagios/plugins/backup_ahsay_checker.sh Edit file /etc/nagios/nrpe.cfg and add the following;

command[check_backup]=/usr/bin/sudo /usr/lib64/nagios/plugins/backup_ahsay_checker.sh Copy backup_ahsay_checker.sh to /usr/lib64/nagios/plugins/ and give this script 777 or just execute :)

And the Final step is to define service/define command to specific servers in Nagios server.


P.S. Dont forget to change IP , backupset id and etc in parse_api_web_log_server0XX
