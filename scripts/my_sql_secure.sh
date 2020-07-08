#!/bin/bash
service mysql start
# Make sure that NOBODY can access the server without a password
mysql -e "UPDATE mysql.user SET Password = PASSWORD('VEV?FSN^*r63') WHERE User = 'root'" -u root
# Kill the anonymous users
mysql -e "DROP USER ''@'localhost'" -u root -p'VEV?FSN^*r63'
# Because our hostname varies we'll use some Bash magic here.
mysql -e "DROP USER ''@'$(hostname)'" -u root -p'VEV?FSN^*r63'
# Kill off the demo database
mysql -e "DROP DATABASE test" -u root -p'VEV?FSN^*r63'

mysql -e "CREATE USER 'dev'@'localhost'IDENTIFIED BY 'VEV?FSN^*r63'" -u root -p'VEV?FSN^*r63'

mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'dev'@'localhost'" -u root -p'VEV?FSN^*r63'
# Make our changes take effect
mysql -e "FLUSH PRIVILEGES" -u root -p'VEV?FSN^*r63'
mysql -e "CREATE DATABASE sentrifugo" -u root -p'VEV?FSN^*r63'

mysqldump -u dev -p'VEV?FSN^*r63' sentrifugo < /var/www/backup.sql
