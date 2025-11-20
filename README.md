# uofa-eng-assignment

A Quarto partial template for University of Alberta engineering assignments.

Originally an Overleaf/LaTeX template, now converted to Quarto using template-partials for modern publishing workflows.

## Using

Copy the template files (`title.tex`, `logo.png`, and `template.qmd`) to your project directory.

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
header-includes: |
  \studentname{Your Full Name}
  \studentid{Your Student ID}
  \course{Course Name (Course Code)}
  \assignment{Assignment Number}
  % \date{YYYY-MM-DD}  % Optional: Uncomment and add date if needed
  % \logopath{path/to/custom/logo.png}  % Optional: Custom logo path
---
```

Then render your document:

```bash
quarto render your-file.qmd
```

## Template Fields

The template uses the following LaTeX commands in `header-includes`:

- `\studentname{...}`: Your full name
- `\studentid{...}`: Your student ID number
- `\course{...}`: Full course name and code
- `\assignment{...}`: Assignment number or title
- `\date{...}`: (Optional) Assignment date
- `\logopath{...}`: (Optional) Custom path to a logo image file (defaults to `logo.png`)

## Features

- Custom title page with student information and logo
- Template-partials architecture for better modularity and customization
- Custom logo support via LaTeX command
- Support for mathematical equations (via amsmath, amsfonts, amssymb)
- Support for Greek Unicode characters in text mode
- Code syntax highlighting (Quarto's default)
- Compatible with all standard Quarto/Pandoc markdown features

## Custom Logo

To use a custom logo instead of the default UofA Engineering logo, add the `\logopath` command to your `header-includes`:

```yaml
---
header-includes: |
  \logopath{path/to/your/logo.png}
---
```

The path can be:
- Relative to your document (e.g., `images/logo.png`)
- Absolute path (e.g., `/home/user/logos/logo.png`)

## Template Architecture

This is a partial template that uses Quarto's template-partials system. The main template partial is `title.tex`, which contains the custom title page formatting. Metadata is passed directly via LaTeX commands in the `header-includes` field.

## Files

- `title.tex` - LaTeX template partial for the title page
- `logo.png` - UofA Engineering logo
- `template.qmd` - Example document with hints and placeholders

## Example

See [template.qmd](template.qmd) for a complete example with hints and placeholders.

## Original LaTeX Template

The original Overleaf template can be found at:
https://www.overleaf.com/latex/templates/homework-assignment-university-of-alberta-engineering/nhjgtbxrfwqc
