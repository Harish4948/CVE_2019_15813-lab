service mysql restart && mysql -u$DATABASE_USERNAME -p$DATABASE_PASSWORD $DATABASE_NAME < /var/www/backup.sql
apache2 -DFOREGROUND | service mysql start
