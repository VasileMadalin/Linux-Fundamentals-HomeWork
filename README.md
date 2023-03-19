# Linux-Fundamentals-HomeWork

script.sh is used to insert the lines from the nginx access log file into a MySQL database.

The table used is called "access_logs" and is part of the "nginx_logs" database.

These details can be seen in the following commands I executed:

CREATE DATABASE nginx_logs;
USE nginx_logs;
CREATE TABLE access_logs (
  id INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  ip_address VARCHAR(50) NOT NULL,
  date DATETIME NOT NULL,
  message TEXT
);


The output of the crontab -l command is:

ubuntu@labs-madalin-vasile:~/Linux-Fundamentals-HomeWork$ crontab -l
# Edit this file to introduce tasks to be run by cron.
#
# Each task to run has to be defined through a single line
# indicating with different fields when the task will be run
# and what command to run for the task
#
# To define the time you can provide concrete values for
# minute (m), hour (h), day of month (dom), month (mon),
# and day of week (dow) or use '*' in these fields (for 'any').
#
# Notice that tasks will be started based on the cron's system
# daemon's notion of time and timezones.
#
# Output of the crontab jobs (including errors) is sent through
# email to the user the crontab file belongs to (unless redirected).
#
# For example, you can run a backup of all your user accounts
# at 5 a.m every week with:
# 0 5 * * 1 tar -zcf /var/backups/home.tgz /home/
#
# For more information see the manual pages of crontab(5) and cron(8)
#
# m h  dom mon dow   command
*/1 * * * * /home/ubuntu/Linux-Fundamentals-HomeWork/script.sh