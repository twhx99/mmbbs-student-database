# initdb informations

Fortunately, the mariadb docker image is designed to execute certain files located under /docker-entrypoint-initdb.d when the database is first started.

Files with following file extension are executed:
- .sh
- .sql
- .sql.gz

All files are executed in alphabetical order on the database defined with the environment variable "MYSQL_DATABASE".

