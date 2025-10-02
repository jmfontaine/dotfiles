set quiet

[private]
default:
  just --list

# Bootstrap local environment
bootstrap:
  pre-commit install --install-hooks # Install pre-commit hooks

# Run checks
check:
  pre-commit run --all-files --show-diff-on-failure

# Update the pre-commit hooks
update-pre-commit:
  pre-commit autoupdate
