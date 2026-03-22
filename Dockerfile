FROM node:lts-alpine  
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN apk add --no-cache curl
EXPOSE 8084 
CMD ["npm", "start"]
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8084/ || exit 1