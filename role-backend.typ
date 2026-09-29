// role-backend.typ: backend-focused version.
// Only differences from content.typ go here; everything else is inherited.
#import "template.typ": *
#import "content.typ": base

#let data = merge(base, (
  // Hide an entry by setting it to none.
  history: (diabotical: none),

  // Other things you can do (uncomment and edit):
  //
  // Replace a whole field:
  //   profile: [Backend engineer focused on *Go* ...],
  //
  // Change one field of one entry:
  //   jobs: (attraction: (title: "Full-stack Software Engineer")),
  //
  // Add a bullet to an entry (note the trailing comma for a one-item array):
  //   jobs: (attraction: (bullets: base.jobs.attraction.bullets + (
  //     [New bullet about ...],
  //   ))),
  //
  // Add a new entry (it appears after the existing ones):
  //   projects: (newthing: (name: "...", stack: "...", bullets: ([...],))),
))

// Reorder entries: move the backend skills row to the top.
#let data = data + (skills: reorder(data.skills, "backend", "languages"))

#show: cv.with(name: data.name)
#render(data)
