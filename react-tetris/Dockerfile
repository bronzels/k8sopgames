FROM bitnami/git:latest AS builder

WORKDIR /workspace
COPY src/react-tetris /workspace/react-tetris

FROM nginx:1.25.3
COPY --from=builder /workspace/react-tetris/docs /usr/share/nginx/html
