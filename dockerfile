#choosing the base image:
FROM node:16-alpine 

#choosing working directory for the application:
WORKDIR /app

#copying the application code:
COPY . .

#installing the dependencies:
RUN npm install

#exposing the application:
EXPOSE 8080

#starting the application:
CMD [ "node", "app.js" ]
