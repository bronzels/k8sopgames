FROM node:16 AS builder

WORKDIR /workspace
COPY src/battle-city /workspace/battle-city
RUN cd battle-city && \
    rm -rvf yarn.lock .yarnrc && \
    npm config set registry https://registry.npmmirror.com && \
    yarn install && \
    yarn build

FROM nginx:1.25.3
COPY --from=builder /workspace/battle-city/dist /usr/share/nginx/html
