FROM mariadb:10.4

LABEL maintainer="Tobias Wiese [hello@twhx.de]"

ENV MYSQL_ROOT_PASSWORD=student_root
ENV MYSQL_USER=student
ENV MYSQL_PASSWORD=student
ENV MYSQL_DATABASE=student

ADD initdb/* /docker-entrypoint-initdb.d/
