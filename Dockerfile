# Use the official WordPress image from the Docker Hub
FROM wordpress:latest

# Install required packages for debugging
RUN apt-get update && apt-get install -y curl

# Set up error handling
RUN set -e

# Download and extract PostgreSQL plugin for WordPress
RUN curl -o /tmp/pg4wp.tar.gz -SL https://downloads.wordpress.org/plugin/postgresql-for-wordpress.1.3.1.tar.gz && \
    echo "Download successful" && \
    tar -xzf /tmp/pg4wp.tar.gz -C /tmp && \
    echo "Extraction successful" && \
    mv /tmp/pg4wp /var/www/html/wp-content/plugins/pg4wp && \
    echo "Move successful" && \
    rm /tmp/pg4wp.tar.gz && \
    echo "Cleanup successful"

# Copy the PostgreSQL configuration file
COPY pg4wp/db.php /var/www/html/wp-content/db.php


ENV WORDPRESS_DB_HOST=dpg-cpe5ipn109ks73eq12h0-a.oregon-postgres.render.com
ENV WORDPRESS_DB_USER=tamilloggers
ENV WORDPRESS_DB_PASSWORD=wH5HZ627ED1lLpJL5XunItNFJo0t1xJN
ENV WORDPRESS_DB_NAME=tamilloggers

EXPOSE 80

CMD ["apache2-foreground"]
