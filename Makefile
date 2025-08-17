YAML_FILES         := $(shell find . -type f \( -iname "*.yml" -o -iname "*.yaml" \))

.PHONY: all lint help

all: help

lint: ## Lint YAML files
	yamllint -c .yamllint $(YAML_FILES)

help: ## Displays available commands
	@echo "Available make targets:"; \
	grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk \
		'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

