set quiet := true

_list:
    just --list

# Run formatters
format:
    uvx rumdl fmt

# Check formatting without modifying files
format-check:
    uvx rumdl fmt --check

# Run linter
lint:
    uvx rumdl check

# Run linter and fix issues
lint-fix:
    uvx rumdl check --fix

# Run pre-commit on all files
pre-commit:
    prek run --all-files

# Install pre-commit hooks
pre-commit-install:
    prek install

# Update pre-commit hooks to latest versions
pre-commit-update:
    prek autoupdate --freeze

# Run all quality assurance checks
qa: format-check lint

# Set local dev environment up
setup:
    prek install  # Install pre-commit hooks
