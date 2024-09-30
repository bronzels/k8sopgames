PLATFORMS ?= linux/arm64,linux/amd64
BUILDER ?= builder
REPO ?= harbor.my.org:1080

##@ General
all: snake 2048 battle-city react-tetris super-mario

.PHONY: help
help: ## Display this help.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_0-9-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Environment

.PHONY: builder
builder: ## create builder
	- docker buildx create \
	  --use \
	  --driver=docker-container \
	  --name=$(BUILDER) \
	  --driver-opt=image=moby/buildkit:buildx-stable-1 \
	  --driver-opt=network=host \
	  --config=buildkit.toml
	- docker buildx use $(BUILDER)

.PHONY: rm-builder
rm-builder: ## remove builder
	docker buildx rm $(BUILDER)

##@ Build

.PHONY: snake
snake: builder ## 构建贪吃蛇镜像并推送到 docker hub
	docker build ./ --tag $(REPO)/webgamedevelop/snake:latest -f snake_game/Dockerfile
	docker push $(REPO)/webgamedevelop/snake:latest

.PHONY: 2048
2048: builder ## 构建 2048 镜像并推送到 docker hub
	docker build ./ \
	  --tag $(REPO)/webgamedevelop/2048:latest \
	  -f 2048/Dockerfile
	docker push $(REPO)/webgamedevelop/2048:latest

.PHONY: battle-city
battle-city: builder ## 构建坦克大战镜像并推送到 docker hub
	docker build ./ \
	  --tag $(REPO)/webgamedevelop/battle-city:latest \
	  -f battle-city/Dockerfile
	docker push $(REPO)/webgamedevelop/battle-city:latest

.PHONY: react-tetris
react-tetris: builder ## 构建俄罗斯方块镜像并推送到 docker hub
	docker build ./ \
	  --tag $(REPO)/webgamedevelop/react-tetris:latest \
	  -f react-tetris/Dockerfile
	docker push $(REPO)/webgamedevelop/react-tetris:latest

.PHONY: super-mario
super-mario: builder ## 构建超级马里奥镜像并推送到 docker hub
	docker build ./ \
	  --tag $(REPO)/webgamedevelop/super-mario:latest \
	  -f super-mario/Dockerfile
	docker push $(REPO)/webgamedevelop/super-mario:latest