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

To access the data base from server use this command: sudo mysql -u root -D nginx_logs.
The parsed log can be displayed using this command: SELECT * FROM access_logs;

In the current directory contab.txt file contains the settings from crontab(script.sh is run periodically at every minute)