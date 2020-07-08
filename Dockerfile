FROM ubuntu
RUN apt-get update -y
# DATABASE CONFIG
ENV DATABASE_SERVER '127.0.0.1'
ENV DATABASE_USERNAME 'dev'
ENV DATABASE_PASSWORD 'VEV?FSN^*r63'
ENV DATABASE_NAME 'sentrifugo'
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get install apache2 -y && apt-get install php7.4 php7.4-gd php7.4-mysql sendmail libpng-dev -y && apt-get install mysql-server -y 
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_RUN_DIR /var/www/html/
COPY ./src_dock/Sentrifugo_3.2/ /var/www/html/
COPY ./scripts/ /var/www/
RUN bash /var/www/my_sql_secure.sh
RUN rm /var/www/my_sql_secure.sh
RUN rm /var/www/html/index.html
RUN chmod 755 /var/www/restoredb.sh
RUN chown -R www-data:www-data /var/www/html/ && chmod -R 755 /var/www/html/
ENTRYPOINT ["/bin/sh", "/var/www/restoredb.sh"]
EXPOSE 80
