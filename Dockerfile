FROM ubuntu
FROM node:16.13.2

WORKDIR /app

COPY . .

EXPOSE 3000

RUN ["npm", "install"]

CMD ["node", "factorial.js"]
