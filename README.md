# CV

Source for my CV, written in [Typst](https://typst.app).

- `content.typ`: the base CV as data. Fix things here and every version updates.
- `template.typ`: styling, layout, and the renderer plus `merge`/`reorder` helpers.
- `cv.typ`: the general CV (renders `content.typ` unchanged).
- `role-*.typ`: tailored versions. Each holds only its differences from the base.
- `fonts/`: fonts used for the build (see `fonts/README.md`).

## Build locally

```sh
typst watch --font-path fonts cv.typ Nick-Quirk-CV.pdf
```

Or open any `.typ` file in VS Code with Tinymist for a live preview.

## Tailoring for a role

Copy an existing role file, e.g. `cp role-backend.typ role-acme.typ`, and edit
the overrides passed to `merge`:

- Replace a field: `profile: [...]`
- Change part of an entry: `jobs: (attraction: (title: "..."))`
- Hide an entry: `history: (diabotical: none)`
- Add a bullet: `jobs: (attraction: (bullets: base.jobs.attraction.bullets + ([...],)))`
- Reorder: `#let data = data + (projects: reorder(data.projects, "audio"))`

CI builds every `role-*.typ` automatically as `Nick-Quirk-CV-<name>.pdf`.

## Releases

Every push to `main` builds the PDFs (Actions tab → run → `cv` artifact).
When sending the CV somewhere, tag the commit and push the tag; the PDFs are
attached to a GitHub Release:

```sh
git tag -a 2026-10-acme -m "Acme, backend role"
git push --tags
```

Once an application is over you can delete its role file; the tag keeps
exactly what was sent.
