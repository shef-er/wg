#!/usr/bin/env make
# Makefile readme (ru): <http://linux.yaroslavl.ru/docs/prog/gnu_make_3-79_russian_manual.html>
# Makefile readme (en): <https://www.gnu.org/software/make/manual/html_node/index.html#SEC_Contents>

.DEFAULT_GOAL: help

.PHONY: help
help: ## Show this help
	@printf "\033[33m%s:\033[0m\n" 'Available commands'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "  \033[32m%-24s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: up
up: ## Set up wireguard container
	@docker compose up --detach

.PHONY: down
down: ## Put down wireguard container
	@docker compose down

.PHONY: show-peer
show-peer: ## Show $(PEER) QR code
	@docker compose exec -T wireguard /app/show-peer $(PEER)
