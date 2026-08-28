# 1. Start with a Node.js image (using the current LTS version)
FROM node:20-alpine

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy the package.json first (for better caching)
COPY package*.json ./

# 4. Install dependencies
RUN npm install

# 5. Copy the rest of your application code
COPY . .

# 6. Create a non-root user for security (Optional but recommended)
# USER node

# 7. Expose the port the app uses
EXPOSE 4173

# 8. The command to run your app
# Note: We changed --host localhost to 0.0.0.0 for network access
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0", "--port", "4173"]
