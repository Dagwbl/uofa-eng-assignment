# uofa-eng-assignment

A Quarto partial template for University of Alberta engineering assignments.

Originally an Overleaf/LaTeX template, now converted to Quarto using template-partials for modern publishing workflows.

## Using

Copy the template files (`title.tex`, `logo.png`, `uofa-metadata.lua`, and `template.qmd`) to your project directory.

Use the following YAML header in your `.qmd` file:

```yaml
---
title: "Assignment Title"
format:
  pdf:
    template-partials:
      - title.tex
    pdf-engine: lualatex
    fig-pos: H
    filters:
      - uofa-metadata.lua
author: "Your Full Name"
student-id: "Your Student ID"
course: "Course Name (Course Code)"
assignment: "Assignment Number"
date: "YYYY-MM-DD"  # Optional
logo: "path/to/custom/logo.png"  # Optional: Custom logo path
---
```

Then render your document:

```bash
quarto render your-file.qmd
```

## Format Options

The template supports the following metadata fields:

- `author` or `student-name`: Your full name (use `author` for compatibility with standard Quarto documents)
- `student-id`: Your student ID number
- `course`: Full course name and code
- `assignment`: Assignment number or title
- `date`: (Optional) Assignment date in YYYY-MM-DD format
- `logo`: (Optional) Custom path to a logo image file (defaults to `logo.png`)

## Features

- Custom title page with student information and logo
- Template-partials architecture for better modularity and customization
- Custom logo support via YAML field
- Support for mathematical equations (via amsmath, amsfonts, amssymb)
- Support for Greek Unicode characters in text mode
- Code syntax highlighting (Quarto's default)
- Compatible with all standard Quarto/Pandoc markdown features

## Custom Logo

To use a custom logo instead of the default UofA Engineering logo, add the `logo` field to your YAML header:

```yaml
---
logo: "path/to/your/logo.png"
---
```

The path can be:
- Relative to your document (e.g., `images/logo.png`)
- Absolute path (e.g., `/home/user/logos/logo.png`)

## Template Architecture

This is a partial template that uses Quarto's template-partials system. The main template partial is `title.tex`, which contains the custom title page formatting. The `uofa-metadata.lua` filter processes the YAML metadata and injects it into the LaTeX template.

## Files

- `title.tex` - LaTeX template partial for the title page
- `logo.png` - UofA Engineering logo
- `uofa-metadata.lua` - Lua filter for processing metadata
- `template.qmd` - Example document with hints and placeholders

## Example

See [template.qmd](template.qmd) for a complete example with hints and placeholders.

## Original LaTeX Template

The original Overleaf template can be found at:
https://www.overleaf.com/latex/templates/homework-assignment-university-of-alberta-engineering/nhjgtbxrfwqc
