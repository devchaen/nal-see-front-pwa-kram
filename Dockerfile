# Build stage
FROM node:20.11.0
WORKDIR /usr/src/app
COPY . .

RUN npm install -g serve
RUN npm i
RUN npm run build


EXPOSE 5173
CMD ["serve", "build"]
