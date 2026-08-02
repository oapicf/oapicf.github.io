# AGENTS.md

This repository contains a website project following a unified standard for
build automation, content generation, and coding conventions.

The key components of the standard include:

- Build automation (PageMaker or Doco Makefiles)
- Content generation from project metadata/templates
- Workflow validation and documentation linting
- Static documentation and page publishing workflows

This document outlines the common conventions that apply across website
projects generated from this template family.

## Runtime & Dependencies

- **Node.js Version**: 22+ (for npm-based site tooling)
- **Dependency Manager**: npm (project-site variants)
- **Documentation Linting**: markdownlint/mdl
- **Configuration Tooling**: yq

### Adding Dependencies

```bash
npm install package_name          # Add runtime dependency
npm install --save-dev pkg_name   # Add development dependency
make deps                         # Install all dependencies
```

## Project Structure

```text
project/
├── data/                    # Structured project/site data
├── docs/                    # Generated or source documentation pages
├── templates/               # Content templates (project-site variants)
├── images/                  # Site or docs image assets
├── .github/                 # GitHub workflows
├── AGENTS.md                # Agent instructions (this file)
├── Makefile                 # Build automation (PageMaker/Doco)
├── README.md                # Project README
└── CHANGELOG.md             # Changelog
```

## Build Automation

Website projects in this template family use Makefile-driven automation.

### Common Commands

```bash
make ci                 # Run standard validation flow
make clean              # Remove staged/generated files
make deps               # Install dependencies
make lint               # Run markdown/yaml/json lint checks
make build              # Build generated docs/pages (project-site variants)
make test               # Run link or site checks where configured
```

### Update Targets

```bash
make update-to-latest   # Update Makefile to latest upstream tool release
make update-to-main     # Update Makefile to upstream main branch
make update-to-version  # Update Makefile to specific upstream version
make update-dotfiles    # Refresh project dotfiles from generator
make update-partials    # Refresh README partial snippets from generator
```

## Development Environment

This project is designed to be developed in a consistent environment via Docker
image `cliffano/studio`.

You can run the container using: `docker run --rm --workdir /opt/workspace -v /var/run/docker.sock:/var/run/docker.sock -v $PWD:/opt/workspace -i -t cliffano/studio` and then run the build commands inside the container.

## Code Style and Linting

Applies to: `.github/workflows/**/*.yml`, `.github/workflows/**/*.yaml`, `docs/**/*.md`, `README.md`, `CHANGELOG.md`, `data/**/*.json`, `data/**/*.yml`, `data/**/*.yaml`, `templates/**/*.jazz`, `templates/**/*.md`, `doco.yml`, `pagemaker.yml`

- Markdown files should be clear, lint-clean, and maintainable
- Workflow/config changes should stay deterministic and explicit

### Style & Formatting

#### Markdown Content

All markdown content should stay readable and lint-friendly.

Guidelines:

- Use descriptive headings and short, direct paragraphs
- Keep examples copy-paste friendly
- Keep link text meaningful and avoid ambiguous references

#### YAML and Workflow Files

Guidelines:

- Use two-space indentation in YAML files
- Keep workflow steps explicit and predictable
- Prefer readable shell blocks over compressed command chains

#### Data and Template Files

Guidelines:

- Keep JSON/YAML data keys stable and self-descriptive
- Keep templates focused on presentation, not heavy logic
- Keep generated-output assumptions documented in README

### Project Conventions

- Treat `data/` as source-of-truth for generated pages
- Keep `docs/` changes aligned with build template expectations
- Keep update targets (`update-dotfiles`, `update-partials`) functional

### Validation

- Run `make lint` before merging content/config changes
- Run `make build` when template or data changes affect generated docs
- Keep workflow behavior aligned with Makefile target flow

## Testing

Applies to: `.github/workflows/**/*.yml`, `.github/workflows/**/*.yaml`, `docs/**/*.md`

- Run project checks with `make test` where available
- Keep docs/site checks deterministic and easy to diagnose

### Validation Strategy

Website projects emphasize deterministic lint/build verification and content
integrity checks.

Primary validation commands:

```bash
make ci
make test
```

### What to Validate

- Markdown/documentation lint passes
- Data/template-driven build output succeeds
- Link checks (where configured) pass reliably
- Workflow steps remain reproducible in CI

### Regression Prevention

When updating templates, data, or docs generation behavior:

1. Run `make lint`
2. Run `make build`
3. Run `make test`
4. Verify docs output changes are intentional
