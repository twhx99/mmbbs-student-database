# Namens-Konventionen

Das Bauen und die Bereitstellung des Projekts wurden vollständig automatisiert. Daher ist es notwendig, bestimmte Namenskonventionen für Tags und Ordner einzuhalten.

## Tags

Durch Erstellen eines neuen Tags wird der DockerHub versuchen ein neues Image zu bauen. Auf Grundlage regulärer Ausdrücke findet er den zum Tag gehörenden Datenbankordner.

**RegEx:** ```^([a-z]+)-([0-9.]+)-([a-z]{2,3})$```

**Ergebnis:**
| GitHub Tag       | Docker Tag       | GitHub Folder | Dockerfile Location    |
|------------------|------------------|---------------|------------------------|
| mariadb-1.0.0-de | mariadb-1.0.0-de | mariadb_de    | mariadb_de/Dockerfile  |
| oracledb-1.0-en  | oracledb-1.0-en  | oracledb_en   | oracledb_en/Dockerfile |

**Folgendes sollte beachtet werden:**
- Der zum Tag gehörende GitHub-Ordner ist automatisch der Build-Context
- Für jede Version wird gleichzeitig ein 'latest' Bild erstellt (je nach Datenbank und Sprache)
  - ``mariadb-1.0.0-de`` erstellt also auch ``mariadb-latest-de`` usw...
- Tags, die nicht dem Regex entsprechen, werden nicht gebaut

## Ordner
Wie aus dem Bereich Tags zu entnehmen ist, müssen Ordner nach dem Schema ``%DATENBANK%_%SPRACHE%`` erstellt werden. Ordner außerhalb dieser Konvention werden beim bauen nicht beachtet.

## Tabellen
**Coming soon...**

## Spalten
**Coming soon...**

