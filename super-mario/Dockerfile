FROM bitnami/git:latest AS builder

WORKDIR /workspace
COPY src/backbone-game-engine /workspace/backbone-game-engine

FROM nginx:1.25.3
COPY --from=builder /workspace/backbone-game-engine/super-mario-bros /usr/share/nginx/html
COPY --from=builder /workspace/backbone-game-engine/3rd /usr/share/nginx/html/3rd
COPY --from=builder /workspace/backbone-game-engine/src /usr/share/nginx/html/src
