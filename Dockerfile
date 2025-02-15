# Use official Node.js image as a base
FROM node:18

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first for caching
COPY package*.json ./

# Install dependencies
RUN npm install --only=production

# Copy the rest of the application files
COPY . .

# Expose port 8080 for Cloud Run
EXPOSE 8080

# Start the application and ensure it listens on port 8080
CMD ["node", "src/index.js"]
