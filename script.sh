#!/bin/bash

# name of the MySQL database where we have the access_logs table to store log lines
db_name="nginx_logs"

# get the last line from the database (if it exists)
last_line=$(sudo mysql -u root -D $db_name -N -e "SELECT message FROM access_logs ORDER BY id DESC LIMIT 1")

# determine the number of lines in the database (if it exists)
num_lines=$(sudo mysql -u root -D $db_name -N -e "SELECT COUNT(*) FROM access_logs")

# get new lines from the log file
new_lines=$(sudo tail -n +$(($num_lines+1)) /var/log/nginx/access.log)

# iterate through each new line and add it to the database
while read -r line; do
    # extract the first column from a line from the nginx log file
    ip_address=$(echo $line | awk '{print $1}')
    # extract the date from a line from the nginx log file
    date=$(echo $line | awk '{print $4 " " $5}')
    # extract the message as everything that follows the date
    message=$(echo $line | cut -d "]" -f 2)
    if [ "$line" != "$last_line" ]; then
        # insert the line into the access_logs table
        sudo mysql -u root -D $db_name -e "INSERT INTO access_logs (ip_address, date, message) VALUES ('$ip_address', '$date', '$message')"
    fi
done <<< "$new_lines"
