.PHONY: help lint lint-fix serve build clean

help:
	@echo "Available commands:"
	@echo "  make lint      - Check markdown files for linting issues"
	@echo "  make lint-fix  - Automatically fix markdown linting issues"
	@echo "  make serve     - Start MkDocs development server"
	@echo "  make build     - Build the documentation"
	@echo "  make clean     - Clean build artifacts"

lint:
	@echo "Checking markdown files..."
	@markdownlint-cli2 "**/*.md"

lint-fix:
	@echo "Fixing markdown linting issues..."
	@markdownlint-cli2 --fix "**/*.md"

serve:
	mkdocs serve

build:
	mkdocs build --strict

clean:
	rm -rf site/