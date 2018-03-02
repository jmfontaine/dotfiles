.DEFAULT_GOAL := help
.SILENT:

ROOT_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

help: ## Display usage
	awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {sub("\\\\n",sprintf("\n%22c"," "), $$2);printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

install: ## Install/update local host configuration
	ansible-playbook --inventory="$(ROOT_DIR)/hosts" "$(ROOT_DIR)/playbook.yaml"
	echo 'Run "source ~/.zshrc" in this shell to reload ZSH configuration'

lint: ## Check playbook for practices and behaviour that could potentially be improved
	ansible-lint playbook.yaml
