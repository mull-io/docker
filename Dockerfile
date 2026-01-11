FROM httpd:2.4-alpine

COPY cgi-bin /usr/local/apache2/cgi-bin
COPY conf/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY htdocs /usr/local/apache2/htdocs

RUN chmod 777 /usr/local/apache2/cgi-bin/output.cgi

EXPOSE 80