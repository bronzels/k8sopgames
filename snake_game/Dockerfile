FROM bitnami/git:latest AS builder

WORKDIR /workspace
COPY src/snake_game /workspace/snake_game

FROM nginx:1.25.3
COPY --from=builder /workspace/snake_game/docs/* /usr/share/nginx/html/
