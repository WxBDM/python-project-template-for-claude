# Sample New Project

This repository contains everything a Python developer may need (and then some) to get a new project out of the gates. This repo includes:

- Package management: uv
- precommit hook: pytest, black, isort, ruff

To launch the project, perform the following:

1. Clone this repository down
2. Install the git hook (`uv run pre-commit install`)

## Pre-commit hook

The pre-commit hook runs every time you make a commit to your repository. This runs black, isort, and ruff to make sure you code is consistent and clean.

When you run `git commit`, you'll see the following in the terminal:

```bash
black........................................Passed
isort........................................Passed
ruff.........................................Passed
```

However, if you see a line such as:
```
black........................................Failed
isort........................................Passed
ruff.........................................Passed
```

The tools will fix the issues themselves and you'll need to re-add the files and re-commit:

```bash
git add .
git commit -m "your original message"
```
