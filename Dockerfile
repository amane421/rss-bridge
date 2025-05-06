FROM php:8.1-cli

# Install required PHP extensions
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    && docker-php-ext-install sockets

# Set working directory
WORKDIR /app

# Clone RSS-Bridge
RUN git clone https://github.com/RSS-Bridge/rss-bridge.git .

# Make cache and whitelist folders writable
RUN chmod -R 777 ./cache ./whitelist.txt

# Expose port (Render uses PORT env var internally)
EXPOSE 80

# Start PHP's built-in server
CMD ["php", "-S", "0.0.0.0:80", "index.php"]
