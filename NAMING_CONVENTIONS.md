# Naming Conventions

The build and deploy of the project was fully automated. Therefore it is necessary to follow certain naming conventions for tags and folders.

## Tags

By creating a new tag the DockerHub will try to build a new image. Based on regular expressions, it will find the database folder belonging to the tag.

**RegEx:** ```^([a-z]+)-([0-9.]+)-([a-z]{2,3})$```

**Result:**
| GitHub Tag       | Docker Tag       | GitHub Folder | Dockerfile Location    |
|------------------|------------------|---------------|------------------------|
| mariadb-1.0.0-de | mariadb-1.0.0-de | mariadb_de    | mariadb_de/Dockerfile  |
| oracledb-1.0-en  | oracledb-1.0-en  | oracledb_en   | oracledb_en/Dockerfile |

**The following should be noted:**
- the GitHub folder belonging to the tag is automatically the build context
- for each version a 'latest' image is created (according to database and language)
  - ``mariadb-1.0.0-de`` also creates ``mariadb-latest-de`` and so on...
- Tags which do not match the regex are not built

## Folder
As can be seen from the Tags section, folders must be created according to the ``%DATABASE%_%LANGUAGE%`` scheme. Folders outside of this convention are ignored when building.

## Tables
**Coming soon...**

## Columns
**Coming soon...**

