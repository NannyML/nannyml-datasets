alias b := build

old_version := `awk -F' = ' '/^version/ { gsub(/"/, "", $2); print $2 }' pyproject.toml`
new_version := `bump2version --dry-run --list patch | grep new_version | sed -r 's/^.*=//g'`

install:
    uv sync --all-extras --dev

bump version="patch":
    uv run --frozen bump2version {{version}}
    uv lock --upgrade-package nannyml-datasets
    git add .
    git commit -m "Bump version: {{old_version}} → {{new_version}}"
    git tag {{new_version}}

run:
    uv run python -m there_yet

debug:
    DEBUG=True uv run python -m there_yet

test:
    uv run pytest tests

build:
    uv run ruff check 
    uv build
