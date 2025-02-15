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

# Expose the port your app runs on
EXPOSE 3000

# Start the application
CMD ["node", "src/index.js"]
