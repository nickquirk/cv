# CV

Source for my CV, written in [Typst](https://typst.app).

- `cv.typ`: the content (edit this)
- `template.typ`: layout and styling
- `fonts/`: fonts used for the build (see `fonts/README.md`)

## Build locally

```sh
typst watch --font-path fonts cv.typ Nick-Quirk-CV.pdf
```

Or open `cv.typ` in VS Code with the Tinymist extension for a live preview.

## Variants

Wrap anything role-specific in `#only("audio")[...]` (any focus names you
like). The default build shows everything; a focused build hides content
tagged for other focuses:

```sh
typst compile --font-path fonts --input focus=backend cv.typ Nick-Quirk-CV-backend.pdf
```

## Releases

Every push to `main` builds the PDFs (Actions tab → run → `cv` artifact).
When sending the CV somewhere, tag the commit and push the tag; the PDFs are
attached to a GitHub Release:

```sh
git tag -a 2026-09-acme -m "Sent to Acme, backend role"
git push --tags
```
