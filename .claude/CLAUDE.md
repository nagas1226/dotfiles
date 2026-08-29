# Global Claude Instructions

## Language
- Respond in Japanese when the user writes in Japanese
- Code and comments in English

## Python
- Use `uv` for package management and virtual environments
- Thorough type hints for all functions, variables, and class attributes
- Use modern typing: `list[str]`, `dict[str, int]`, `X | None` (not `Optional`)
- Use `TypedDict`, `Protocol`, `Literal`, `Generic` where appropriate
- Follow PEP8
- Prefer `pathlib.Path` over `os.path`
- Use f-strings for formatting
- Use `pytest` for testing
- Google-style docstrings for public functions

### Code Quality (run before commit)
- Type check: `mypy` or `ty`
- Lint: `ruff check --fix`
- Format: `ruff format`

## Git
- Conventional commits: `feat:`, `fix:`, `docs:`, `refactor:`, `test:`, `chore:`
- Commit messages in English
- Keep commits atomic (one logical change per commit)
- Write concise commit messages (50 chars for title)
- Use imperative mood: "Add feature" not "Added feature"
- Reference issue numbers when applicable: `fix: resolve crash (#123)`
- Never commit secrets, credentials, or API keys

## Config
- Use environment variables or config files for environment-specific values
- Never hardcode secrets, API keys, or credentials
- Separate config from code (12-factor app principles)
- Use `.env` files for local development (never commit)

## Documentation
- README with setup instructions and usage examples
- Docstrings for public APIs and complex logic
- Document architecture decisions in ADR or docs/
- Keep docs close to code and up to date

## General
- Keep code simple and readable
- Avoid over-engineering
- Follow best practice design patterns (DI, Repository, Factory, etc.)
- Use modern stack and latest stable features
- Prefer composition over inheritance
- Single responsibility principle for functions and classes

## Obsidian
- Vault path: ~/obsidian/my-knowledge (symlink to iCloud)
- Actual path: ~/Library/Mobile Documents/iCloud~md~obsidian/Documents/my-knowledge
- Use wikilinks: [[note]] format
- Prefer Markdown links for external references
