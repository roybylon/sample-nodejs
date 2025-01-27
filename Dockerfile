# Stage 1: Build stage
FROM node:18-alpine AS build

# Set the working directory
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install --production

# Copy the application files
COPY . .

# Stage 2: Production stage
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy the built application files from the build stage
COPY --from=build /app /app

# Expose the necessary port (e.g., 3000)
EXPOSE 3000

# Run the Node.js application
CMD ["npm", "start"]
