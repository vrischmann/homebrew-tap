# AGENTS.md

## Project overview

This is a personal [Homebrew tap](https://docs.brew.sh/Taps) (tap name: `vrischmann/tasks`) hosted on [git.rischmann.fr/vincent/homebrew-tap](https://git.rischmann.fr/vincent/homebrew-tap). It provides Homebrew formulae for CLI tools maintained by the tap owner.

The repository follows the standard Homebrew tap layout: one Ruby file per formula inside the `Formula/` directory.

## Repository structure

```
.
├── Formula/
│   ├── ansible-password-agent.rb
│   └── llm-context.rb
├── .github/
│   └── workflows/
│       ├── tests.yml      # brew test-bot on push/PR
│       └── publish.yml    # brew pr-pull for bottle publishing
├── AGENTS.md
└── README.md
```

## Adding or updating a formula

### Adding a new formula

1. Create `Formula/<name>.rb` following the [Homebrew formula cookbook](https://docs.brew.sh/Formula-Cookbook).
2. Compute SHA256 checksums for each platform binary:
   ```sh
   curl -sL <url> | shasum -a 256
   ```
3. Ensure the formula includes a `test` block that verifies basic functionality (e.g., `--version` or `--help`).
4. Run local syntax and audit checks:
   ```sh
   brew audit --strict --tap=vrischmann/tasks <formula>
   brew test <formula>
   ```

### Updating an existing formula

1. Bump the `version` string.
2. Update all `url` values to point at the new release.
3. Recompute and replace all `sha256` values.
4. Verify locally with `brew audit` and `brew test`.

### Checksum computation

For each release asset, compute the SHA256 and replace the placeholder in the formula:

```sh
curl -sL https://github.com/<owner>/<repo>/releases/download/v<version>/<archive>.tar.gz | shasum -a 256
```

Never commit a formula with placeholder checksums (`0000...`) outside of initial scaffolding.

## CI/CD pipelines

### `tests.yml` — brew test-bot

Runs on:
- Push to `main`
- Pull requests
- Manual dispatch (`workflow_dispatch`)

Matrix: `ubuntu-latest`, `macos-latest`.

Steps:
1. Sets up Homebrew with the GitHub token.
2. Caches Ruby gems.
3. Runs cleanup and setup.
4. Checks formula syntax (`--only-tap-syntax`).
5. On PRs only: runs the full formula test suite (`--only-formulae`).
6. Uploads bottle artifacts if produced.

### `publish.yml` — brew pr-pull

Triggers when a PR is labeled `pr-pull`. Publishes bottled binaries to the tap's `main` branch and deletes the PR branch (if not from a fork).

## Commit conventions

All commits must follow the [Conventional Commits](https://www.conventionalcommits.org/) format:

```
<type>(<scope>): <description>
```

Relevant types for this repo:

| Type | Use when |
| --- | --- |
| `feat` | Adding a new formula |
| `fix` | Correcting a formula (wrong URL, checksum, install block) |
| `chore` | Bumping versions, updating checksums, removing formulae |
| `ci` | Changing workflow files |

Keep commits atomic: one formula change per commit, with a clear scope referencing the formula name.

### Examples

- `feat(ansible-password-agent): add formula at v1.0.5`
- `chore(llm-context): bump to v0.2.0`
- `fix(ansible-password-agent): correct macOS arm64 checksum`

## Local testing

Before pushing, test the formula locally:

```sh
# Audit the formula for issues
brew audit --strict --tap=vrischmann/tasks <formula>

# Run the formula's test block
brew test <formula>

# Install it for real
brew install vrischmann/tasks/<formula>
```

Use `brew test-bot` for a full CI-like run (requires a GitHub token):

```sh
brew test-bot --only-tap-syntax --only-formulae --tap=vrischmann/tasks
```
