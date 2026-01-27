FROM node:20-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# 🔥 THIS IS WHAT YOU WERE MISSING
RUN npm run build

EXPOSE 3000
CMD ["npm", "start"]
