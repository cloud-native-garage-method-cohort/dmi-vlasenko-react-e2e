FROM quay.io/upslopeio/node-alpine
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm test -- --watchAll=false
RUN npm run build
EXPOSE 3000
CMD ["npm", "start"]
