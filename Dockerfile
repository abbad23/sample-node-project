# Use Amazon's public ECR image for Node.js
FROM public.ecr.aws/docker/library/node:14.17.5

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 3005

CMD [ "npm", "start" ]
