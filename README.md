# uofa-eng-assignment

A Quarto template for University of Alberta engineering assignments.

Originally an Overleaf/LaTeX template, now converted to Quarto using template-partials for modern publishing workflows.

## Installing

To use this template, you can install it directly from GitHub:

```bash
quarto use template Dagwbl/uofa-eng-assignment
```

This will install the extension and create an example qmd file that you can use as a starting place for your assignment.

## Using

After installing, create or edit a `.qmd` file with the following YAML header:

```yaml
---
title: "Assignment Title"
format:
  uofa-eng-assignment-pdf: default
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
- `logo`: (Optional) Custom path to a logo image file (defaults to the UofA Engineering logo)

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

This template uses Quarto's template-partials system, which allows for better modularity and customization compared to the traditional include-in-header approach. The main template partial is located in `_extensions/uofa-eng-assignment/partials/title.tex`.

## Example

See [template.qmd](template.qmd) for a complete example with hints and placeholders.

## Original LaTeX Template

The original Overleaf template can be found at:
https://www.overleaf.com/latex/templates/homework-assignment-university-of-alberta-engineering/nhjgtbxrfwqc
