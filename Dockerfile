# Stage 1: Build the React app
FROM node:18 AS builder

WORKDIR /app

# Copy package.json and install dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install

# Copy the source code and build
COPY . .
RUN npm run build

# Stage 2: Serve the app using a static server
FROM node:18-slim

# Install a simple static file server
RUN npm install -g serve

WORKDIR /app

# Copy built app from builder stage
COPY --from=builder /app/build ./build

# Expose the port the app runs on
EXPOSE 3000

# Run the app using serve
CMD ["serve", "-s", "build", "-l", "3000"]
