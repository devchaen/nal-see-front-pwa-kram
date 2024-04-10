# Build stage
FROM node:20.11.0 AS builder
WORKDIR /usr/src/app

# package.json과 package-lock.json을 먼저 복사
COPY package*.json ./

# 의존성 설치
RUN npm install

# 나머지 파일 복사
COPY . .

# 애플리케이션 빌드
RUN npm run build

# Serve stage
# 필요에 따라 경량 이미지 사용 가능
FROM node:20.11.0
WORKDIR /usr/src/app

# serve 설치
RUN npm install -g serve

# 빌드 스테이지에서 생성된 빌드 파일 복사
COPY --from=builder /usr/src/app/build ./build

EXPOSE 5173
CMD ["serve", "-s", "build"]
