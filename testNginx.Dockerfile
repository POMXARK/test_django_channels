# Pull the minimal Ubuntu image
FROM ubuntu

# Install Nginx
RUN apt-get -y update && apt-get -y install nginx

# Copy the Nginx config
COPY default /etc/nginx/sites-available/default

# Expose the port for access
EXPOSE 80/tcp

# Run the Nginx server
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

#https://www.baeldung.com/linux/nginx-docker-container

# docker build . -t haidar/server
# docker run -d -p 8080:80 haidar/server

# http://0.0.0.0:8080/