// role-sention.typ: Sention Technologies, Senior Full-Stack Engineer (Python/TypeScript).
// Angle: audio/DSP background + turning raw data into tools non-engineers use.
// Only differences from content.typ go here; everything else is inherited.
#import "template.typ": *
#import "content.typ": base

#let b = base.jobs.attraction.bullets
// Base bullet order: 0 stack, 1 payment links, 2 fraud engine, 3 agent tools,
// 4 wolverine, 5 spiral, 6 cyclops, 7 AI generators.
// If you reorder content.typ, update these indices.

#let data = merge(base, (
  title: "Full-Stack Software Engineer",

  profile: [
    Full-stack software engineer with 3+ years building payment and checkout systems on an international e-commerce platform in *Go*, *PHP* and *TypeScript*, owning features from spec to production. Outside work I also build in *Python*, most recently a generative music streamer with *PyTorch* and *FastAPI*. Before software I worked in audio: a BSc in Audio and Music Technology, where I built a multi-effect audio processor in *C++*\/*JUCE*, an MSc in Sound and Music for Interactive Games, and spatial-audio debugging on the arena shooter Diabotical. I want to put both to work on acoustic signal data.
  ],

  skills: (
    languages: (label: "Programming languages", items: "Go, TypeScript, JavaScript, PHP, Python (FastAPI, PyTorch), C++ (JUCE)"),
  ),

  education: (
    uwe: [University of the West of England, *Audio and Music Technology BSc (2:1 Hons)* (Sep 2009 – Jul 2012).],
  ),

  jobs: (attraction: (bullets: (
    b.at(0),
    // Cyclops first: closest thing to SignalWorks (raw data -> visual tool for a non-engineer).
    [Built Cyclops, a checkout debugging tool that turns raw *BigQuery* event data into an event-by-event timeline of any order, with timings between steps and the share of orders hitting a given event, such as a payment failure, over a date range (*Next.js*\/*TypeScript* frontend, *Go* API, Cloud Run). The Product Owner uses it daily, saving around 10 hours of analysis a month.],
    // Wolverine reframed as prototype -> production.
    [Took Wolverine from a one-off payment report to a production *Go* service on Cloud Run: engineers pull decline-reason, 3DS and checkout-error breakdowns from *Slack slash commands*, and directors get a daily *SendGrid* report comparing capture rate against the 7-day average, built on the *Checkout.com API* and *BigQuery*.],
    // Payment Links outcome: paid links Mar–Sep 2026 (8,791 paid; GBP 6.09m + EUR 722k + USD 148k + AUD 13k).
    b.at(1),
    // TODO: fraud engine still needs an outcome (flags raised? Ops rules built on the signals?).
    b.at(2),
    b.at(3),
    b.at(7),
    // Spiral (b.at(5)) dropped to free space for the audio/Python material.
  ))),
))

// Python-first skills, audio project first, Diabotical stays in (hidden in role-backend).
#let data = data + (skills: reorder(data.skills, "languages", "backend"))
#let data = data + (projects: reorder(data.projects, "audio"))

#show: cv.with(name: data.name)
#render(data)
