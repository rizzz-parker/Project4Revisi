# Use the official Nginx image as the base image
FROM nginx:alpine

# Remove the default Nginx welcome page
RUN rm -rf /usr/share/nginx/html/*

# Copy the HTML file to the Nginx web server root
COPY . . /usr/share/nginx/html

# Expose the default Nginx port (80)
EXPOSE 80

# Command to start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
