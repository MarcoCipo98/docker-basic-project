FROM node:20-alpine

WORKDIR /app

RUN apk add --no-cache wget


# App-Code kopieren
COPY app/server.js ./server.js
COPY app/package.json ./package.json

ENV NODE_ENV=production
ENV PORT=3000

EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://localhost:${PORT}/ || exit 1


CMD ["node", "server.js"]
