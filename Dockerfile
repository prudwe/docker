From ubuntu:latest

RUN apt-get update && apt-get install -y nginx

RUN apt-get install -y php-8*

RUN apt-get clean && rm -rf /var/lib/apt/lists/* && mkdir -p /var/www/html/app

COPY nginix-site.conf /etc/nginx/sites-available/default  /etc/nginx/sites-enabled/default

RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

COPY index.html /var/www/html/app/index.html

CMD service php-8* start && nginix -g 'daemon off;'

EXPOSE 80
