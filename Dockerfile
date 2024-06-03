# Use the official WordPress image from the Docker Hub
FROM wordpress:latest

# Install required packages for debugging
RUN apt-get update && apt-get install -y curl

# 
RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pgsql pdo_pgsql

# Set up error handling
RUN set -e

# Download and extract PostgreSQL plugin for WordPress
RUN git clone https://github.com/kevinoid/postgresql-for-wordpress.git && \
    echo "Download successful" && \
    cp -rf postgresql-for-wordpress/pg4wp /tmp/pg4wp && \
    echo "Extraction successful" && \
    mv /tmp/pg4wp /var/www/html/wp-content/plugins/pg4wp && \
    echo "Move successful" && \
    echo "Cleanup successful"

# Copy the PostgreSQL configuration file
COPY postgresql-for-wordpress/pg4wp/db.php /var/www/html/wp-content/db.php

RUN cd /var/www/html/wp-content &&\
	cp -rp wp-config-sample.php wp-config.php
  
#ENV WORDPRESS_DB_HOST=dpg-cpe5ipn109ks73eq12h0-a.oregon-postgres.render.com
#ENV WORDPRESS_DB_USER=tamilloggers
#ENV WORDPRESS_DB_PASSWORD=wH5HZ627ED1lLpJL5XunItNFJo0t1xJN
#ENV WORDPRESS_DB_NAME=tamilloggers

EXPOSE 80

CMD ["apache2-foreground"]
