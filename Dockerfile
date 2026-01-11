FROM httpd:2.4-alpine

COPY conf/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY htdocs /usr/local/apache2/htdocs

RUN chmod +x /usr/local/apache2/htdocs/index.sh

EXPOSE 80