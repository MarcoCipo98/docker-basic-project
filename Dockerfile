FROM node:20-alpine

WORKDIR /app

# App-Code kopieren
COPY app/server.js ./server.js
COPY app/package.json ./package.json

ENV NODE_ENV=production
ENV PORT=3000

EXPOSE 3000

CMD ["node", "server.js"]
