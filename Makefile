YAML_FILES         := $(shell find . -type f \( -iname "*.yml" -o -iname "*.yaml" \))

.PHONY: all lint help

all: help

lint: ## Lint YAML files
	yamllint -c .yamllint $(YAML_FILES)

.PHONY: bump-major
bump-major: ## Bumps major version (1.2.3 → 2.0.0)
	tools/bump major

.PHONY: bump-minor
bump-minor: ## Bumps minor version (1.2.3 → 1.3.0)
	tools/bump minor

.PHONY: bump-patch
bump-patch: ## Bumps patch version (1.2.3 → 1.2.4)
	tools/bump patch

help: ## Displays available commands
	@echo "Available make targets:"; \
	grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk \
		'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

