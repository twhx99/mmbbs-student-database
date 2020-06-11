# initdb informations

## English information

Fortunately, the mariadb docker image is designed to execute certain files located under /docker-entrypoint-initdb.d when the database is first started.

Files with following file extension are executed:
- .sh
- .sql
- .sql.gz

All files are executed in alphabetical order on the database defined with the environment variable "MYSQL_DATABASE".

## German Information

Das mariadb Docker Image ist glücklicherweise so aufgebaut, dass es beim ersten Start der Datenbank bestimmte Dateien ausführt, welche unter /docker-entrypoint-initdb.d liegen.

Ausgeführt werden Dateien mit der Dateiendung:
- .sh
- .sql
- .sql.gz

Alle Dateien werden in alphabetischer Reihenfolge auf der Datenbank ausgeführt, welche mit der Umgebungsvariable "MYSQL_DATABASE" definiert wurde.
