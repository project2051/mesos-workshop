FROM nginx
MAINTAINER mbr@touk.pl

RUN apt-get update
RUN apt-get install -y dnsutils
RUN apt-get install -y procps

ADD . /etc/nginx/
RUN chmod a+x /etc/nginx/*.sh

WORKDIR /etc/nginx

EXPOSE 80

CMD ./start.sh
