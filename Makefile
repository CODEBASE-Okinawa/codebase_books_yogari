.DEFAULT_GOAL := help

build: ## build develoment environment
	if ! [ -f .env ];then cp .env.sample .env;fi
	docker compose build
	docker compose run --rm app bundle install
	docker compose run --rm app bin/rails db:create
	docker compose run --rm app bin/rails db:schema:load
	docker compose run --rm app bin/rails db:seed

serve: ## Run Server
	docker compose up -d app

app-log: ## Tail app log
	docker compose logs app -f

db-log: ## Tail postgres log
	docker compose logs postgres -f

bundle: ## Run Bundle install
	docker compose run --rm app bundle

shell: ## Run shell
	docker compose exec app bash

console: ## Run Rails Console
	docker compose exec app bin/rails c

migrate: ## Run db:migrate
	docker compose exec app bin/rails db:migrate

migrate-status: ## Run db:migrate
	docker compose exec app bin/rails db:migrate:status

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
