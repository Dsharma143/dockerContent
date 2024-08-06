# Use an appropriate base image
#FROM node:14

# Set the working directory
#WORKDIR /app

# Copy the package.json and install dependencies
# COPY package.json /app
#RUN npm install

# Copy the rest of the application code
#COPY . /app

# Expose the port the app runs on
#EXPOSE 3000

# Start the application
#CMD ["npm", "start"]
#
FROM httpd:latest
COPY https://github.com/edurekacontent/dockerContent.git /usr/local/apache2/htdocs/
