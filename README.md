# homebrew-tap

Personal [Homebrew tap](https://docs.brew.sh/Taps) for distributing CLI tools and utilities via Homebrew.

## Available formulae

| Formula | Description |
| --- | --- |
| `llm-context` | CLI tool for gathering file contents into formatted messages for LLM conversations |

## How do I install these formulae?

```
brew install vrischmann/tasks/<formula>
```

Or tap the repository first, then install:

```
brew tap vrischmann/tasks
brew install <formula>
```

In a `brew bundle` `Brewfile`:

```ruby
tap "vrischmann/tasks"
brew "<formula>"
```

## CI

This tap uses Homebrew's standard CI workflows:

- **`brew test-bot`** runs on every push to `main` and on pull requests (`ubuntu-latest`, `macos-latest`). It checks formula syntax and, on PRs, runs the full test suite.
- **`brew pr-pull`** publishes bottled binaries when a PR is labeled `pr-pull`.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
