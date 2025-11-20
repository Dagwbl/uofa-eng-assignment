# uofa-eng-assignment

A Quarto template for University of Alberta engineering assignments.

Originally an Overleaf/LaTeX template, now converted to Quarto for easier document creation and modern publishing workflows.

## Template Formats

This repository provides two versions:

- **Standard Template** (`uofa-eng-assignment.tex`): Production-ready LaTeX template
- **Template-Partial** (`template-partial.tex`): Heavily commented educational version with detailed explanations

For detailed documentation on the partial format, see [README-partial.md](README-partial.md).

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
logo: "path/to/logo.png"  # Optional - use custom logo
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
- `date`: (Optional) Assignment date
- `logo`: (Optional) Path to custom logo image (relative or absolute)

## Features

- Custom title page with student information and UofA Engineering logo
- **Custom logo support**: Specify your own logo path via YAML
- Support for mathematical equations (via amsmath, amsfonts, amssymb)
- Support for Greek Unicode characters in text mode (via textgreek)
- Code syntax highlighting (Quarto's default)
- Compatible with all standard Quarto/Pandoc markdown features
- **Educational**: Heavily commented partial template to help you learn LaTeX

## Custom Logo Usage

You can use your own logo by specifying the `logo` field in your YAML metadata:

```yaml
logo: "images/my-logo.png"  # Relative path
# or
logo: "/absolute/path/to/logo.png"  # Absolute path
```

If not specified, the default UofA Engineering logo will be used.

## Advanced Usage

If you need to use advanced LaTeX packages that were commented out to avoid conflicts, you can add them back by modifying `_extensions/uofa-eng-assignment/uofa-eng-assignment.tex`. Packages that may conflict with Quarto's code highlighting include:

- `fancybox` - conflicts with verbatim environments
- `pstricks` and `pst-plot` - may interfere with syntax highlighting
- `listings` - conflicts with Quarto's default code highlighting (use Quarto's native code blocks instead)

## Learning LaTeX

This template includes a heavily commented version (`template-partial.tex`) that explains every LaTeX command in detail. If you're new to LaTeX or want to understand how the template works, check out:

- `_extensions/uofa-eng-assignment/template-partial.tex` - Educational version with extensive comments
- [README-partial.md](README-partial.md) - Comprehensive guide to the partial template

## Example

See [template.qmd](template.qmd) for a complete example with placeholder values.

## Original LaTeX Template

The original Overleaf template can be found at:
https://www.overleaf.com/latex/templates/homework-assignment-university-of-alberta-engineering/nhjgtbxrfwqc
