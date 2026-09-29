// content.typ: the base CV, as data.
// Fix things here and every version picks them up.
//
// Each entry has an id (e.g. `attraction`, `dashboard`) that role files
// use to override or hide it. Entries render in the order written here.

#let base = (
  name: "Nick Quirk",
  title: "Software Engineer",

  contact: (
    location: "London, W1",
    email: "nickquirk@proton.me",
    linkedin: (url: "https://www.linkedin.com/in/nick-quirk", label: "nick-quirk"),
    github: (url: "https://github.com/nickquirk", label: "nickquirk"),
    blog: (url: "https://theyellowsoundmachine.com", label: "theyellowsoundmachine.com"),
  ),

  profile: [
    Software engineer with 3+ years building backend-heavy features in *Go*, *PHP* and *TypeScript* on an international e-commerce platform, mostly around payments: PCI-compliant payment links, a fraud rule engine, checkout analytics. Before that, an MSc in *Sound and Music for Interactive Games* and freelance game audio work, including technical audio on the arena shooter Diabotical.
  ],

  skills: (
    languages: (label: "Programming languages", items: "Go, PHP, TypeScript, JavaScript, Python (PyTorch)"),
    frontend: (label: "Frontend", items: "Next.js, React, TailwindCSS, Sass, TanStack Query"),
    backend: (label: "Backend", items: "GORM, MySQL, SQLite, Node.js, Kafka, RabbitMQ, JWT, OAuth2"),
    testing: (label: "Testing", items: "Jest, Go Testing, Cypress"),
    devops: (label: "DevOps, cloud & monitoring", items: "Docker, Kubernetes, GCP, DataDog, Jenkins, Cloud Run"),
    other: (label: "Other", items: "Claude Code, Gemini API, Git/Bitbucket, Postman, Max/MSP, PureData, Unreal Engine, Figma"),
  ),

  jobs: (
    attraction: (
      title: "Software Engineer",
      org: "Attraction Tickets LTD",
      dates: "May 2023 – Present",
      bullets: (
        [Build and operate full-stack features in the Customer Success Team (PHP, Go, TypeScript) from conception to production (Jenkins, GCP, Cloud Run), including *upgrading a critical legacy codebase* our frontline teams use daily.],
        [Built *Payment Links* solo so phone sales no longer involve agents keying in card numbers: agents email customers a *Checkout.com* hosted payment link (3DS enforced, 15-minute expiry). Built across the legacy *PHP/Drupal 6* backend and a new *Drupal 7/Backbone* agent UI, with duplicate-link prevention and webhook-driven status tracking (paid, flagged, voided). Card data is now out of agent workflows entirely, shrinking our PCI scope.],
        [Extended Checkout.com's fraud scoring with a pluggable *Fraud Rule Engine* (PHP, Strategy pattern, DI-registered rules) that attaches six risk signals (deposit orders, high-risk tickets, same-day and near-date departures, suppliers) to every payment request, letting the fraud team flag or block on any signal from the CKO dashboard without code changes.],
        [Designed and deployed a *user journey tracking tool* for the checkout flow, now used daily and reducing the Product Owner's analysis workload by 10 hours monthly.],
        [*Automated financial reporting* with an internal web scraping and dashboard tool, automating a painful manual procedure and saving the Director of Finance around 8 hours monthly.],
        [Built two internal *Next.js* tools on the *Gemini API*, before CLI coding agents were common: a *README generator* that scans a codebase and writes docs in a standard format, used to backfill *13 undocumented codebases* and now the team default, and a *unit test generator* whose tests were merged into *5 codebases*. Teams estimate around 5 hours saved per codebase; I was asked to present both to the wider engineering team.],
        [*Raised test coverage* across the critical checkout codebase with unit, integration and end-to-end tests to protect payment reliability.],
        [Elected *Development Team Representative* on the Employee Forum.],
      ),
    ),
  ),

  projects: (
    dashboard: (
      name: "Life Dashboard",
      url: "https://frontend-835639357459.europe-west2.run.app/",
      repo: "https://github.com/nickquirk/life-dashboard-server",
      stack: "Go, GORM, MySQL, Next.js 16, TypeScript, TanStack Query, Tailwind, GCP",
      bullets: (
        [Designed and shipped a *full-stack productivity platform* that unifies Google Tasks and Calendar into a single drag-and-drop planning surface, deployed to *GCP Cloud Run* against *Cloud SQL* via a *Cloud Build CI/CD pipeline* with automated migration jobs.],
        [Secured the platform end-to-end: *OAuth2* login, *AES-256-GCM encryption* of persisted provider tokens, HTTP-only *JWT* session cookies with hashed refresh-token rotation, and *OIDC*-validated service requests backed by *GCP Secret Manager*.],
        [Structured the Go service around *Onion Architecture* with interface-driven repositories and *Uber Dig dependency injection*, so it's covered by *unit and integration tests* against mocked dependencies; the frontend is tested with *Jest and React Testing Library*.],
      ),
    ),
    audio: (
      name: "Generative Audio Streamer",
      url: "https://github.com/nickquirk/generative-audio-streamer",
      stack: "Python, PyTorch, FastAPI, Apache Kafka, Tone.js, Docker",
      bullets: (
        [Built a *decoupled streaming pipeline* where *Apache Kafka* buffers generated musical events and *Server-Sent Events (SSE)* push them to the browser, keeping playback continuous while generation runs asynchronously upstream.],
        [Built the real-time client with *Tone.js* for browser-based synthesis and an *HTML5 Canvas* piano roll rendering the endless note stream.],
        [*Trained a 2-layer LSTM* on MIDI datasets to predict musical sequences, using *Top-K sampling* with probabilistic silence injection so output stays varied rather than collapsing into repetition.],
      ),
    ),
  ),

  history: (
    events: (
      title: "Events Operations → Team Lead",
      org: "UK Festival Circuit",
      dates: "July 2017 – Sept 2022",
      bullets: (
        [Orchestrated operational logistics for up to 50 traders at UK festivals of 20,000+ attendees, including Glastonbury and CarFest, ensuring compliance and safety during the event.],
      ),
    ),
    canfi: (
      title: "Co-Founder",
      org: "Can-Fi",
      dates: "August 2019 – Sept 2022",
      summary: [Founded alongside my events work to solve a problem I kept seeing on site: traders unable to take card payments because public mobile networks collapse under festival crowd loads. Covid cancelled the 2020–21 season before the full system was deployed.],
      bullets: (
        [Designed and built the full hardware stack — a solar-powered, battery-backed rig housed in four oil drums, feeding a *Ubiquiti mesh network* that shared a single high-gain *4G uplink*.],
        [Field-tested components independently, including providing Wi-Fi to traders at smaller events and running a redundancy network at Glastonbury's Mandela Bar.],
      ),
    ),
    diabotical: (
      title: "Technical Audio",
      org: "GD: Studio – Diabotical",
      dates: "March 2021 – Aug 2021",
      summary: [Collaborated with the development team to solve audio issues on this multi-player arena shooter.],
      bullets: (
        [Investigated issues within their custom game engine related to occlusion and spatial audio.],
        [Created original in-game audio assets and music.],
      ),
    ),
  ),

  education: (
    cs50: [Harvard University (online), *CS50: Introduction to Computer Science* (Jan 2023 – Sept 2023)],
    ga: [General Assembly, London, *Software Engineering Immersive* (Sept 2022 – Dec 2022)],
    leeds: [Leeds Beckett University, *Sound and Music for Interactive Games MSc* (Sept 2013 – Sept 2014)],
    uwe: [University of the West of England, *Audio and Music Technology BSc (Hons)* (Sept 2009 – July 2012)],
  ),

  interests: [
    *Music* — I compose electronic music and also present a radio show. Recently I've been exploring music live coding platforms like Strudel and Sonic Pi.
  ],
)