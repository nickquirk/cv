// role-audio.typ: audio / creative-tech focused version.
// Only differences from content.typ go here; everything else is inherited.
#import "template.typ": *
#import "content.typ": base

#let data = merge(base, (
  // Example rewrite built from facts already in the CV; edit to taste.
  profile: [
    Software engineer with a background in audio technology: an MSc in *Sound and Music for Interactive Games*, technical audio work on the multiplayer shooter Diabotical, and a *generative music streaming* project built with *PyTorch*, *Kafka* and *Tone.js*. Day to day I build full-stack features across *TypeScript*, *Next.js*, *Go* and *GCP* on an international e-commerce platform, owning them from concept to production.
  ],
))

// Put the audio project first.
#let data = data + (projects: reorder(data.projects, "audio"))

#show: cv.with(name: data.name)
#render(data)
