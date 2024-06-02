FROM wordpress:latest

RUN curl -o /tmp/pg4wp.tar.gz -SL https://downloads.wordpress.org/plugin/postgresql-for-wordpress.1.3.1.tar.gz \
    && tar -xzf /tmp/pg4wp.tar.gz -C /tmp \
    && mv /tmp/pg4wp /var/www/html/wp-content/plugins/pg4wp \
    && rm /tmp/pg4wp.tar.gz

COPY pg4wp/db.php /var/www/html/wp-content/db.php

ENV WORDPRESS_DB_HOST=dpg-cpe5ipn109ks73eq12h0-a.oregon-postgres.render.com
ENV WORDPRESS_DB_USER=tamilloggers
ENV WORDPRESS_DB_PASSWORD=wH5HZ627ED1lLpJL5XunItNFJo0t1xJN
ENV WORDPRESS_DB_NAME=tamilloggers

EXPOSE 80

CMD ["apache2-foreground"]
