# initdb Informationen

Das mariadb Docker Image ist glücklicherweise so aufgebaut, dass es beim ersten Start der Datenbank bestimmte Dateien ausführt, welche unter /docker-entrypoint-initdb.d liegen.

Ausgeführt werden Dateien mit der Dateiendung:
- .sh
- .sql
- .sql.gz

Alle Dateien werden in alphabetischer Reihenfolge auf der Datenbank ausgeführt, welche mit der Umgebungsvariable "MYSQL_DATABASE" definiert wurde.
