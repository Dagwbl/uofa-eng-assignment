# UofA Engineering Assignment Template - Partial Format

This is a **Template-Partial** version of the University of Alberta Engineering Assignment template for Quarto. It provides a reusable, well-documented LaTeX partial that you can customize and include in your documents.

## What is a Template Partial?

A **template partial** is a reusable component that can be included in other documents. Unlike a complete template, a partial focuses on providing specific functionality (in this case, the UofA Engineering title page and formatting) that can be mixed and matched with other document elements.

## Features

✨ **Custom Logo Support**: Specify your own logo path via YAML metadata  
📚 **Extensively Commented**: Every LaTeX command is explained in detail to help you learn  
🎓 **University of Alberta Engineering Format**: Official-looking title page with student information  
🔧 **Highly Customizable**: Easy to modify and extend  
📝 **Educational**: Perfect for learning LaTeX while creating assignments  

## Installation

Install this template directly from GitHub:

```bash
quarto use template Dagwbl/uofa-eng-assignment
```

This will:
1. Install the extension
2. Create an example `.qmd` file
3. Set up the directory structure

## Basic Usage

Create a `.qmd` file with the following YAML header:

```yaml
---
title: "Assignment Title"
format:
  uofa-eng-assignment-pdf: default
author: "Your Full Name"
student-id: "Your Student ID"
course: "Course Name (Course Code)"
assignment: "Assignment Number"
---
```

Then render your document:

```bash
quarto render your-file.qmd
```

## Custom Logo Usage

One of the key features of this partial template is the ability to use a **custom logo** from an external path. This is useful if you want to use a different university logo, department logo, or personal branding.

### Setting a Custom Logo Path

Add the `logo` field to your YAML metadata:

```yaml
---
title: "Assignment Title"
format:
  uofa-eng-assignment-pdf: default
author: "Your Full Name"
student-id: "Your Student ID"
course: "Course Name (Course Code)"
assignment: "Assignment Number"
logo: "path/to/your/custom-logo.png"
---
```

### Logo Path Examples

**Relative path** (relative to your `.qmd` file):
```yaml
logo: "images/my-logo.png"
```

**Absolute path**:
```yaml
logo: "/home/user/Documents/logos/university-logo.png"
```

**Parent directory**:
```yaml
logo: "../shared-assets/logo.png"
```

### Logo Requirements

- **Supported formats**: PNG, JPG, PDF (vector graphics recommended)
- **Recommended size**: At least 200×200 pixels for good quality
- **Aspect ratio**: Any (the template scales to 2cm height, width scales proportionally)
- **Default logo**: If you don't specify a logo, the UofA Engineering logo will be used

## YAML Metadata Fields

All available fields you can use in your document header:

| Field | Required | Description | Example |
|-------|----------|-------------|---------|
| `author` | Yes | Your full name | `"John Doe"` |
| `student-id` | Yes | Your student ID number | `"1234567"` |
| `course` | Yes | Course name and code | `"Data Structures (CMPUT 201)"` |
| `assignment` | Yes | Assignment number or title | `"Assignment 3"` |
| `date` | No | Assignment due date or submission date | `"2024-11-20"` |
| `logo` | No | Path to custom logo image | `"images/logo.png"` |
| `title` | No | Document title (for PDF metadata) | `"Assignment 3"` |

### Field Details

**`author` vs `student-name`**: You can use either `author` or `student-name`. The template uses `author` for compatibility with standard Quarto documents.

**`date`**: If omitted, no date will appear on the title page. Format can be anything (e.g., "November 20, 2024" or "2024-11-20").

**`logo`**: If omitted, the default UofA Engineering logo is used. The path can be relative or absolute.

## Understanding the Template Code

This template is designed to be **educational**. The LaTeX code is heavily commented to help you understand what each command does.

### Main Files

1. **`template-partial.tex`**: The heavily commented LaTeX partial with detailed explanations
2. **`uofa-eng-assignment.tex`**: The production version (less verbose)
3. **`uofa-metadata.lua`**: Lua filter that converts YAML metadata to LaTeX commands

### Learning LaTeX with This Template

If you're new to LaTeX, we recommend:

1. **Read `template-partial.tex`**: Open this file and read through the comments. Each LaTeX command is explained in detail.

2. **Experiment**: Try modifying values to see what changes. For example:
   - Change `\setlength{\textwidth}{6.5in}` to `8in` and see how the page width changes
   - Modify color definitions to customize syntax highlighting colors
   - Adjust spacing in the title page layout

3. **Key Concepts Covered**:
   - Page layout and margins (`\setlength`, `geometry` package)
   - Color definitions (`\definecolor`)
   - Including images (`\includegraphics`)
   - Mathematical typesetting (`amsmath`, `amssymb`)
   - Custom commands (`\newcommand`, `\renewcommand`)
   - Conditional logic (`\ifx...\else...\fi`)
   - Document structure (`\maketitle`, environments)

### Common LaTeX Commands Explained

Here are some frequently used commands you'll see:

- `\usepackage{package}`: Load an external package to add functionality
- `\newcommand{\name}[args]{definition}`: Create a custom command
- `\renewcommand{\name}[args]{definition}`: Redefine an existing command
- `\def\@name{value}`: Define an internal variable (note the `@`)
- `\begin{environment}...\end{environment}`: Create a structured block
- `\vspace{size}`: Add vertical space (positive = down, negative = up)
- `\rule{width}{height}`: Draw a horizontal or vertical line
- `\\`: Line break
- `{}`: Group content together

## Advanced Customization

### Modifying the Title Page Layout

The title page layout is defined in the `\renewcommand\maketitle` section. You can modify:

- **Student info position**: Edit the `flushleft` environment
- **Logo size**: Change `height=2cm` in `\includegraphics`
- **Logo position**: Adjust `\vspace{-15mm}` to move the logo up/down
- **Course info styling**: Modify `\textbf{\large \@course}` for different font size/style
- **Separator line**: Change `\rule{\linewidth}{0.1mm}` for different line thickness
- **Spacing**: Add or remove `\bigskip` commands to adjust vertical spacing

### Adding Custom Packages

If you need additional LaTeX functionality, you can add packages to `uofa-eng-assignment.tex`:

1. Add `\usepackage{packagename}` near the top of the file
2. Be cautious with packages that might conflict with Quarto's features
3. Test your document after adding packages

### Creating Your Own Custom Commands

You can add custom mathematical commands or shortcuts. For example, in your `.qmd` file:

```markdown
```{=latex}
\newcommand{\Real}{\mathbb{R}}
\newcommand{\vect}[1]{\mathbf{#1}}
```

Then use them in your document:
$$x \in \Real^n, \quad \vect{v} = [v_1, v_2, ..., v_n]^T$$
```

## Mathematical Features

The template includes packages for advanced mathematics:

- **amsmath**: Equation environments (`align`, `gather`, `split`)
- **amsfonts**: Special fonts (blackboard bold: ℝ, ℂ, ℕ)
- **amssymb**: Additional symbols (∀, ∃, ∈, ∉, ⊂, ⊃)
- **eucal**: Calligraphic fonts

### Custom Math Commands Included

The template provides these pre-defined commands:

```latex
\tr          % Trace operator: Tr(A)
\op{H}       % Operator with check: Ȟ
\bra{x}      % Bra vector: ⟨x|
\ket{x}      % Ket vector: |x⟩
\braket{x}{y}% Inner product: ⟨x|y⟩
\mean{E}     % Expectation value: ⟨E⟩
\opvec{p}    % Vector operator with check
\sp{...}     % Split equation environment
```

## Code Syntax Highlighting

Quarto provides built-in syntax highlighting for code blocks. Simply use:

````markdown
```python
def fibonacci(n):
    if n <= 1:
        return n
    return fibonacci(n-1) + fibonacci(n-2)
```
````

The template is configured to work seamlessly with Quarto's highlighting system.

### Advanced: Using LaTeX Listings Package

If you need the `listings` package for raw LaTeX code blocks, uncomment the listings section in `template-partial.tex`. However, this may conflict with Quarto's code blocks.

## Troubleshooting

### Logo Not Appearing

**Problem**: Custom logo doesn't show up in the PDF.

**Solutions**:
1. Check the path is correct (relative to your `.qmd` file)
2. Ensure the image file exists and has the right extension
3. Try using an absolute path to isolate path issues
4. Check the console output for error messages

### Metadata Not Showing

**Problem**: Student name, ID, or other fields don't appear.

**Solutions**:
1. Verify YAML syntax (proper indentation, quotes if needed)
2. Check field names exactly match (case-sensitive: `student-id` not `student_id`)
3. Ensure `format: uofa-eng-assignment-pdf: default` is set correctly

### Compilation Errors

**Problem**: Document won't render or shows LaTeX errors.

**Solutions**:
1. Check for special characters that need escaping (`&`, `%`, `$`, `#`, `_`, `{`, `}`)
2. Ensure all `\begin{environment}` have matching `\end{environment}`
3. Look at the error message for line numbers and specific issues
4. Try rendering the example `template.qmd` first to ensure the extension works

### Package Conflicts

**Problem**: Certain LaTeX features don't work or cause errors.

**Solutions**:
1. Some packages conflict with Quarto's defaults (especially code highlighting)
2. Check the comments in `template-partial.tex` for known conflicts
3. Avoid uncommenting `listings`, `fancybox`, or `pstricks` unless necessary
4. If you must use conflicting packages, test thoroughly

## Examples

### Example 1: Basic Assignment

```yaml
---
title: "Homework 1"
format:
  uofa-eng-assignment-pdf: default
author: "Jane Smith"
student-id: "1234567"
course: "Introduction to Computer Science (CMPUT 101)"
assignment: "Homework Assignment 1"
date: "2024-11-20"
---

## Question 1

Explain the difference between a compiler and an interpreter.

## Question 2

Write a Python function to calculate factorial.
```

### Example 2: With Custom Logo

```yaml
---
title: "Lab Report 3"
format:
  uofa-eng-assignment-pdf: default
author: "John Doe"
student-id: "7654321"
course: "Electrical Circuits (ECE 240)"
assignment: "Lab Report 3: RC Circuits"
date: "2024-11-25"
logo: "assets/ece-department-logo.png"
---

## Abstract

This lab explores the behavior of RC circuits...
```

### Example 3: Advanced Math

```yaml
---
title: "Problem Set 5"
format:
  uofa-eng-assignment-pdf: default
author: "Alex Johnson"
student-id: "1112131"
course: "Quantum Mechanics (PHYS 372)"
assignment: "Problem Set 5"
---

## Problem 1

Calculate the expectation value of the Hamiltonian:

$$
\mean{H} = \braket{\psi}{H|\psi}
$$

where $\ket{\psi}$ is the normalized wavefunction.
```

## File Structure

After installation, your project will have this structure:

```
your-project/
├── _extensions/
│   └── uofa-eng-assignment/
│       ├── _extension.yml          # Extension configuration
│       ├── uofa-eng-assignment.tex # Main LaTeX template
│       ├── template-partial.tex    # Commented learning version
│       ├── uofa-metadata.lua       # Metadata processor
│       └── logo.png                # Default UofA logo
├── template.qmd                    # Example document
└── README-partial.md               # This file
```

## Comparison: Template vs Template-Partial

| Feature | Regular Template | Template-Partial |
|---------|-----------------|------------------|
| **Purpose** | Complete document setup | Reusable component |
| **Customization** | Limited | Highly flexible |
| **Documentation** | Basic | Extensive comments |
| **Learning Value** | Medium | High (educational) |
| **Logo Options** | Fixed path | Custom path via YAML |
| **Modularity** | Monolithic | Composable |

## Contributing

Found a bug or want to improve the template? Contributions are welcome!

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## Resources for Learning LaTeX

- [Overleaf Learn LaTeX](https://www.overleaf.com/learn): Comprehensive tutorials
- [LaTeX Wikibook](https://en.wikibooks.org/wiki/LaTeX): Free online book
- [CTAN](https://ctan.org/): Package documentation
- [TeX Stack Exchange](https://tex.stackexchange.com/): Q&A community

## Credits

- Original LaTeX template: [Overleaf UofA Engineering Template](https://www.overleaf.com/latex/templates/homework-assignment-university-of-alberta-engineering/nhjgtbxrfwqc)
- Converted to Quarto: Dagwbl
- Enhanced with partial format and educational comments

## License

See [LICENSE](LICENSE) file for details.

## Support

If you encounter issues or have questions:

1. Check the Troubleshooting section above
2. Review the commented code in `template-partial.tex`
3. Open an issue on GitHub
4. Consult the [Quarto documentation](https://quarto.org/)

---

**Happy writing! 📝✨**
