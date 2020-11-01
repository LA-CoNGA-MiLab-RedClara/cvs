FROM gitlab/gitlab-ce:latest

RUN mkdir -p /var/www/letsencrypt
RUN mkdir -p /var/www/pagessl

RUN apt-get update && apt-get upgrade -y
RUN apt-get install dirmngr --install-recommends -y
RUN apt-get install software-properties-common -y

RUN apt-get install snapd -y
RUN systemctl unmask snapd.service
RUN systemctl enable snapd.service
RUN systemctl restart snapd.service
RUN snap install core && snap refresh core

RUN snap install --classic certbot
RUN ln -s /snap/bin/certbot /usr/bin/certbot
RUN certbot --nginx

RUN gitlab-ctl reconfigure
RUN certbot certonly --webroot --webroot-path=/var/www/letsencrypt -d milabproy.redclara.net

COPY gitlab.rb /etc/gitlab