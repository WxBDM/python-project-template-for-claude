#!/bin/bash

# Install uv if missing
if ! command -v uv &> /dev/null; then
    echo "Installing uv..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    [ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

    if ! command -v uv &> /dev/null; then
        echo "Failed to install uv. Install manually: curl -LsSf https://astral.sh/uv/install.sh | sh"
        exit 1
    fi
fi

# Project name (defaults to directory name)
default_name=$(basename "$PWD")
read -p "Project name [$default_name]: " project_name
project_name=${project_name:-$default_name}

sed -i.bak "s/name = \"python-project-setup-sample\"/name = \"$project_name\"/" pyproject.toml && rm -f pyproject.toml.bak

# Create .env
[ ! -f ".env" ] && touch .env

# Install dependencies
uv sync

# Update Dockerfile with Python version
py_version=$(uv run python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
sed -i.bak "s/python:VERSION-slim/python:${py_version}-slim/" Dockerfile && rm -f Dockerfile.bak

# Pre-commit hooks
read -p "Install pre-commit hooks? (recommended) (y/n): " setup_precommit
[[ "$setup_precommit" =~ ^[Yy]$ ]] && uv run pre-commit install

# Reset git history and clean up
rm -rf .git
git init
git add .
git commit -m "Initial commit"
rm -- "$0"

echo ""
echo "You're all set! This project template uses uv as the package manager."
echo " Here are some commands to get started:"
echo ""
echo "  uv run main.py          Run your application"
echo "  uv add <package>        Add a dependency"
echo "  uv remove <package>     Remove a dependency"
echo "  uv run pytest           Run tests"
echo "  uv run mkdocs serve     Preview documentation"
echo ""
