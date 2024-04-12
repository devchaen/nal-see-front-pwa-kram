# Build stage
FROM node:20.11.0 AS build
WORKDIR /usr/src/app
COPY . .
RUN npm ci
RUN npm run build

# Serve stage
FROM node:20.11.0-alpine
WORKDIR /app
COPY --from=build /usr/src/app/dist ./dist
RUN npm install -g serve
EXPOSE 5173
USER node
CMD ["serve", "-s", "dist", "-l", "5173"]