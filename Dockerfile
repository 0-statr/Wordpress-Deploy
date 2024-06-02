FROM wordpress:latest

RUN curl -o /tmp/pg4wp.tar.gz -SL https://downloads.wordpress.org/plugin/postgresql-for-wordpress.1.3.1.tar.gz \
    && tar -xzf /tmp/pg4wp.tar.gz -C /tmp \
    && mv /tmp/pg4wp /var/www/html/wp-content/plugins/pg4wp \
    && rm /tmp/pg4wp.tar.gz

COPY pg4wp/db.php /var/www/html/wp-content/db.php

ENV WORDPRESS_DB_HOST=your-database-host
ENV WORDPRESS_DB_USER=your-database-user
ENV WORDPRESS_DB_PASSWORD=your-database-password
ENV WORDPRESS_DB_NAME=your-database-name

EXPOSE 80

CMD ["apache2-foreground"]
