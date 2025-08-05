FROM mysql:8.0.33
ENV MYSQL_ROOT_PASSWORD="beauty_pass123"
ENV MYSQL_DATABASE="beauty_store"
ADD db_backup.sql docker-entrypoint-initdb.d/db_backup.sql