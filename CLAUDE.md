# Guidelines and Rules

## General Guidelines for Project Development and Evolution

- Data modeling: only use data modeling if you have data that's external of the system or if you're writing to a database.
- When adding new functionality, understand what you're adding in and write tests accordingly. Ideally, follow TDD principals when building.
- All I/O operations must use async/await.
- Handle errors gracefully. Identify boundary cases and be specific with try/except statements. Within error messages, be specific as to what the error is to help developers understand why something went wrong.

## Project Documentation

When writing any form of documentation (in-line, docstrings, and external):

- Avoid bloating and over-explaining. Explain the non-obvious (and the why, if necessary)
- Avoid emojis.
- Gear the language to developers and avoid AI slop and common phrases.

### Project documentation with Mkdocs

The project documentation can be found under the docs folder. You are to put all project documentation in here using mkdocs.

You are to update the documentation that is relevant to the *developer* who is new to the app upon every change.

### Project documentation in code

- Comments: Follows PEP 8 styling and formatting. Comments are to explain why certain decisions were made rather than explain code, as code might be self-explanitory.
- Docstrings: Follow PEP 257 and use Google style notation.
- Typing: Always type hint inputs and outputs. Avoid `Any` and be specific with the typing.

## Package management: uv

Use uv exclusively for Python package management in this project.

### Package Management Commands

- All Python dependencies **must be installed, synchronized, and locked** using uv
- Never use pip, pip-tools, poetry, or conda directly for dependency management
- Confirm it's necessary before adding a dependency.

Use these commands:

- Install dependencies: `uv add <package>`
- Remove dependencies: `uv remove <package>`
- Sync dependencies: `uv sync`

### Running Python Code

- Run a Python script with `uv run <script-name>.py`
- Run Python tools like Pytest with `uv run pytest` or `uv run ruff`
- Launch a Python repl with `uv run python`

### Managing Scripts with PEP 723 Inline Metadata

- Run a Python script with inline metadata (dependencies defined at the top of the file) with: `uv run script.py`
- You can add or remove dependencies manually from the `dependencies =` section at the top of the script, or
- Or using uv CLI:
    - `uv add package-name --script script.py`
    - `uv remove package-name --script script.py`

## Environment management

- Load the environment frequently during runtime using `python-dotenv`.
- Do not write to the .env file, unless prompted by the user.
- Do not create a .env.example file, ever. If the user needs to add a env variable, prompt them to do so.
