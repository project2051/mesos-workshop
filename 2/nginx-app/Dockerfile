FROM debian

RUN apt-get update
RUN apt-get install -y wget unzip supervisor

ADD supervisor.conf /etc/supervisor/conf.d/supervisor.conf

RUN apt-get install -y nginx
ADD nginx.conf /etc/nginx/nginx.conf
ADD docker.png /usr/share/nginx/www/docker.png

EXPOSE 80

CMD echo "<html><body background='/docker.png'>It's me! Your favourite container - `hostname`!<br\></body></html>" > /usr/share/nginx/www/index.html && \
supervisord -n
