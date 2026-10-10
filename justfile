set quiet

[private]
default:
  just --list

# Bootstrap local environment
bootstrap:
  prek install --prepare-hooks # Install Git hook shims and prepare hook environments

# Run checks
check:
  prek run --all-files --show-diff-on-failure

# Update the hook repositories
update-hooks:
  prek update
