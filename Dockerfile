# base image
FROM node:16

# create & set working directory
WORKDIR /app

# copy dependencies and install them
COPY package*.json ./
RUN npm install

# copy source files
COPY . .

#set port to open
EXPOSE 3000

#run npm according to env
CMD if [ "$NODE_ENV" = "production" ]; then \
  npm run build && npm start; \
else \
  npm run dev; \
fi