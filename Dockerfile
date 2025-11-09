FROM node:18-alpine
WORKDIR /app
RUN npm install -g npm@9

# Copy package files
COPY package*.json .

# Copy source code (required files that exist in repo)
COPY packages ./packages
COPY extensions ./extensions
COPY translations ./translations

# Create directories that may not exist in repo (created during setup)
# These are in .gitignore but needed at runtime - will be created during npm run setup
RUN mkdir -p themes public media config

# Copy all other files (excluding node_modules, dist, etc. via .dockerignore)
# Note: themes, public, config are in .gitignore so won't be copied (which is fine)
COPY . .

RUN npm install

# Compile TypeScript/SWC code before building
RUN npm run compile:db
RUN npm run compile

# Now run the build
RUN npm run build

EXPOSE 80
CMD ["npm", "run", "start"]
