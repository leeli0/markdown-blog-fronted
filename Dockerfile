# Use a Node.js base image with yarn pre-installed
FROM node:alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and yarn.lock first for caching
COPY package.json yarn.lock ./

# Install project dependencies
RUN yarn install

# Copy the rest of the application code
COPY . .

# Build the React app for production
RUN yarn build

# Use a smaller image for the final production image
FROM nginx:alpine

# Copy the built React app from the builder stage
COPY --from=builder /app/build /usr/share/nginx/html

# Copy custom nginx config to expose port 3000
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80 (nginx default) which maps to 3000 inside the container
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]