.DEFAULT: help
.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: install
install: ## Install dotfiles
	@sh ./scripts/install.sh

.PHONY: uninstall
uninstall: ## Uninstall dotfiles
	@sh ./scripts/uninstall.sh

.PHONY: update
update: ## Update dotfiles
	@sh ./scripts/update.sh
