# Contributing Guidelines

Thank you for your interest in improving The Lathe Mastery Wiki Book!
Contributions are welcomed that enhance clarity, accuracy, or completeness.

## How to Contribute

1. Fork the repository
2. Create a feature branch (`git checkout -b improve-threading-chapter`)
3. Make your changes following our style guide
4. Run quality checks (see below)
5. Submit a pull request with clear description

## Style Guide

### Markdown Standards

- **Line length**: Maximum 80 characters per line
- **Sentences**: One sentence per line for complex paragraphs
- **Headings**: Use ATX-style (#) only, never skip levels
- **Lists**: Use `-` for unordered, `1.` for ordered
- **Code blocks**: Triple backticks with language identifier
- **Links**: Prefer reference-style `[text][ref]` with definitions at end
- **Tables**: Pad pipes with spaces, use alignment syntax
- **Whitespace**: One blank line before/after major elements

### Content Standards

- **Voice**: Professional yet approachable, encouraging tone
- **Safety**: Always include relevant safety warnings
- **Prerequisites**: Clearly state required prior knowledge
- **Examples**: Provide practical, tested examples
- **Cross-references**: Link to related topics
- **Word limit**: Keep sections under 1500 words

### Frontmatter Requirements

Every content file must include:

```yaml
---
title: "Descriptive Title"
author: Author Name
date: YYYY-MM-DD
version: X.Y.Z
tags: [relevant, keywords]
prerequisites: [chapter/section] or none
---
```

## Quality Checks

Before submitting:

1. **Markdown lint**: `markdownlint **/*.md` (must pass with zero errors)
2. **Spell check**: Review for technical accuracy
3. **Links**: Verify all cross-references work
4. **Code**: Test any code examples
5. **Prerequisites**: Confirm listed dependencies

## Types of Contributions

### Content Improvements

- Clarifying existing explanations
- Adding missing safety warnings
- Improving technical accuracy
- Adding helpful diagrams/illustrations

### New Sections

- Fill gaps in existing chapters
- Add advanced techniques
- Create troubleshooting guides
- Develop practice exercises

### Corrections

- Fix technical errors
- Update outdated information
- Correct typos or grammar
- Improve clarity

## Commit Messages

Use clear, descriptive commit messages:

- `fix: Correct feed rate calculation in Chapter 9`
- `feat: Add section on thread pitch measurement`
- `docs: Improve safety warnings for parting operations`
- `style: Format tables in measurement chapter`

## Code of Conduct

- Be respectful and constructive
- Focus on improving the content
- Welcome newcomers to machining
- Share knowledge generously

## Questions?

Open an issue with the `question` label if you need clarification.
