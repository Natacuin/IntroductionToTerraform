# Use the official Drupal base image
FROM drupal:latest

# Install additional dependencies
RUN apt-get update && apt-get install -y -f\
    curl \
    libpng-dev \
    libjpeg-dev \
    libpq-dev \
    unzip \
    vim \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Create a directory to save the downloaded file
RUN mkdir /downloads

# Download a file using wget
RUN wget -P /downloads http://mirrors.edge.kernel.org/ubuntu/pool/main/libf/libffi/libffi7_3.3-4_amd64.deb
RUN wget -P /downloads http://ftp.de.debian.org/debian/pool/main/o/openssl/libssl1.1_1.1.1n-0+deb11u4_amd64.deb

# Install the downloaded package using dpkg
RUN dpkg -i /downloads/libffi7_3.3-4_amd64.deb
RUN dpkg -i /downloads/libssl1.1_1.1.1n-0+deb11u4_amd64.deb

# Set the working directory to the Drupal web root
WORKDIR /var/www/html

# Copy Drupal files
COPY . /var/www/html

# Set environment variables
ENV MYSQL_HOST=drupal-qa-server.mysql.database.azure.com
ENV MYSQL_DATABASE=drupal
ENV MYSQL_USER=drupal
ENV MYSQL_PASSWORD=


# Create a mount point for the Azure File Share
RUN mkdir /mnt/azure


# Expose Drupal port
EXPOSE 8080

# Start the Drupal container with the mounted Azure File Share
CMD ["apache2-foreground"]
