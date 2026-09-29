# Fonts

The CV uses **Oswald** (headings) and **Open Sans** (body). Both are free
under the SIL Open Font License, so it's fine to commit them here.

1. Download both families from https://fonts.google.com
2. From each download's `static/` folder, copy these files into this folder:
   - `Oswald-Regular.ttf`
   - `OpenSans-Regular.ttf`, `OpenSans-Bold.ttf`, `OpenSans-Italic.ttf`, `OpenSans-BoldItalic.ttf`
3. Commit them.

Use the static files rather than the variable `[wght]` ones, so bold and italic
render reliably. If this folder has no fonts, the build still works but falls
back to DejaVu Sans.
