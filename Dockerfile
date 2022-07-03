FROM  wordpress:php7.4-fpm

RUN set -ex\
	&& apt update -y --allow-releaseinfo-change \
    && apt upgrade -y \
    && apt install -y wget procps nano net-tools \
    && apt install apache2 -y 

COPY conf/ /conf
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
CMD ["php-fpm"]