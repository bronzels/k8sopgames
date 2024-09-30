FROM bitnami/git:latest AS builder

WORKDIR /workspace
COPY src/2048 /workspace/2048

FROM nginx:1.25.3
COPY --from=builder /workspace/2048/ /usr/share/nginx/html/
