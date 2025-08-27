FROM registry.access.redhat.com/ubi9/nodejs-20-minimal:9.6-1755755732

ENV NODE_ENV=production
ENV VITE_API_URL=http://localhost:8080/api
ENV HOST=0.0.0.0

ARG maintainerEmail
ARG appVersion
ARG enviroment
ARG appName
ARG GIT_COMMIT=unknown
ARG BUILD_DATE=unknown

LABEL maintainer=${maintainerEmail} \
      version=${appVersion} \
      description="System Monitor - ${enviroment}" \
      org.opencontainers.image.title=${appName} \
      org.opencontainers.image.description="System Monitor - ${enviroment}" \
      org.opencontainers.image.version=${appVersion} \
      org.opencontainers.image.vendor="AllonsoHenzo" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.source="https://github.com/AllonsoHenzo/Lnfmonitor_dashboard" \
      org.opencontainers.image.revision="${GIT_COMMIT}" \
      org.opencontainers.image.created="${BUILD_DATE}" \
      k8s.deployment.name="${appName}" \
      k8s.container.port="8080"

USER root

RUN microdnf install -y \
    procps-ng \
    nginx \
    && microdnf clean all

WORKDIR /app

COPY ./backend ./
COPY ./frontend/dist /usr/share/nginx/html
COPY ./frontend/nginx/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /app/nginx/logs /app/nginx/run /app/nginx/cache && \
    chown -R 1001:0 /app && chmod -R g+rw /app && \
    chown -R 1001:0 /usr/share/nginx/html && chmod -R g+rw /usr/share/nginx/html && \
    chown -R 1001:0 /var/log/nginx && chmod -R g+rw /var/log/nginx

USER 1001

EXPOSE 8080
CMD ["bash", "-c", "node /app/server.js & nginx -g 'daemon off;'"]