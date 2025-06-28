#use node js image 
FROM node:18

#Set Working directory 
WORKDIR /app

#Copy package.json 
COPY package*.json ./

#Install dependencies
RUN npm install

#copy rest of the app
COPY . .

#expose port
EXPOSE 3000

#START THE APP
CMD ["node", "index.js"]

