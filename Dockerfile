# Stage 1: Build
FROM node:14 AS builder
WORKDIR /app

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application source code
COPY . .

# Build the application
RUN npm run build

# Stage 2: Production
FROM node:14-alpine AS production
WORKDIR /app

# Copy package.json and only the production dependencies
COPY --from=builder /usr/src/app/package.json ./
COPY --from=builder /usr/src/app/node_modules ./node_modules

# Expose port 3000 important
EXPOSE 3000

# Specify the command to run your application
CMD ["node", "entrypoint.js"]
