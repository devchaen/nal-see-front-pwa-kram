# Build stage
FROM node:20.11.0
WORKDIR /usr/src/app
COPY . .
RUN npm ci
RUN npm run build
RUN npm install -g serve


EXPOSE 5173
CMD ["serve", "build"] 