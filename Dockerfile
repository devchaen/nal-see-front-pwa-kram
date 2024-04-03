# Build stage
FROM node:20
WORKDIR /usr/src/app
COPY . .

# 종속성 충돌을 무시하고 필요한 패키지를 설치
RUN npm install --legacy-peer-deps

RUN npm run build
RUN npm install -g serve

EXPOSE 5173
CMD ["serve", "build"]
