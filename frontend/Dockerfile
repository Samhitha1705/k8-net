# Stage 1: Build React app
FROM node:18-alpine AS build

WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all source files
COPY . .

# Build the app
RUN npm run build

# Stage 2: Serve with Nginx
FROM nginx:alpine

# Copy build output to Nginx's html folder
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
