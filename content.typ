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
  Full-stack software engineer with 3+ years on an international e-commerce platform, building payment and checkout systems in *Go*, *PHP* and *TypeScript*. I split my time between the legacy PHP monolith our sales agents work in every day and new Go services and internal tools. I came to software from audio, including technical sound work on the arena shooter Diabotical.
],


  education: (
    ga: [General Assembly, London, *Software Engineering Immersive* (Sep 2022 – Dec 2022)],
    leeds: [Leeds Beckett University, *Sound and Music for Interactive Games MSc (Merit)* (Sep 2013 – Sep 2014)],
    uwe: [University of the West of England, *Audio and Music Technology BSc (2:1 Hons)* (Sep 2009 – Jul 2012)],
  ),

  jobs: (
    attraction: (
      title: "Software Engineer",
      org: "Attraction Tickets Ltd",
      dates: "May 2023 – Present",
      bullets: (
        [Build and operate full-stack features for the Customer Success team in *Go*, *PHP* and *TypeScript* (*React*\/*Next.js*), from spec to production, tested with *testify*, *Jest* and *Cypress*. Ship via *Docker*, *Jenkins* and *Bitbucket Pipelines* to *GCP (Cloud Run, GKE/Kubernetes)*, and debug staging and production with *DataDog* and *k9s*.],
        [Took card numbers out of phone sales by integrating *Checkout.com* hosted *Payment Links* into the legacy *PHP* backend and a new agent UI: agents email customers a 3DS-enforced, 15-minute link, with duplicate-link prevention and webhook-driven status tracking, shrinking our PCI scope.],
        [Extended Checkout.com's fraud scoring with a pluggable *Fraud Rule Engine* (PHP, Strategy pattern, DI-registered rules) that attaches six risk signals, such as deposit orders and same-day departures, to every payment, so Operations can flag or block on any signal without code changes.],
        [Built *agent-facing tools* end to end in our legacy PHP monolith, writing both the APIs and the UI. 30–40 sales and support agents use them daily to act on payment and risk data mid-call: decline diagnostics, a scored risk panel explaining each triggered rule, customer booking history and an order-recovery review workflow.],
        [Built Wolverine, a *Go* payment-health service on Cloud Run. The dev team pulls decline-reason, 3DS and checkout-error breakdowns from *Slack slash commands*, and project leads and directors get a daily *SendGrid* report comparing capture rate against the 7-day average. Data comes from the *Checkout.com API* and *BigQuery*.],
        [Built Spiral, a *Go* worker on *GKE* that consumes cart-abandonment events from *RabbitMQ* and forwards them by region to *Bloomreach*, which emails customers a recovery prompt 30 minutes after they abandon a cart. Traced with *DataDog* via Orchestrion and unit-tested with *testify* and *mockery*.],
        [Built Cyclops, a checkout debugging tool (*Next.js*\/*TypeScript* frontend, *Go* API over *BigQuery*, on Cloud Run) that reconstructs any order's checkout as an event-by-event timeline with timings between steps, and shows what share of orders hit a given event, such as a payment failure, over a date range. The Product Owner uses it daily, saving around 10 hours of analysis a month.],
        [Before CLI coding agents were common, built a *README generator* and a *unit test generator* on the *Gemini API* (*Next.js*): the docs backfilled *13 codebases* and are now the team default, and the generated tests were merged into *5*. Around 5 hours saved per codebase; I presented both to the wider engineering team.],
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
        [Secured the platform end to end: *OAuth2* login, *AES-256-GCM encryption* of persisted provider tokens, HTTP-only *JWT* session cookies with hashed refresh-token rotation, and *OIDC*-validated service requests backed by *GCP Secret Manager*.],
        [Structured the Go service around *Onion Architecture* with interface-driven repositories and *Uber Dig dependency injection*; *unit and integration tests* against mocked dependencies; the frontend is tested with *Jest and React Testing Library*.],
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
      dates: "Jul 2017 – Sep 2022",
      bullets: (
        [Ran trader operations at UK festivals of 20,000+ attendees, including Glastonbury and CarFest, managing up to 50 traders per event on compliance and site safety.],
      ),
    ),
    canfi: (
      title: "Co-Founder",
      org: "Can-Fi",
      dates: "Aug 2019 – Sep 2022",
      summary: [Founded alongside my events work to solve a problem I kept seeing on site: traders unable to take card payments because public mobile networks collapse under festival crowd loads. Covid cancelled the 2020–21 season before the full system was deployed.],
      bullets: (
        [Designed and built the full hardware stack: a solar-powered, battery-backed rig housed in four oil drums, feeding a *Ubiquiti mesh network* that shared a single high-gain *4G uplink*.],
        [Field-tested components independently, including providing Wi-Fi to traders at smaller events and running a redundancy network at Glastonbury's Mandela Bar.],
      ),
    ),
    diabotical: (
      title: "Technical Audio",
      org: "GD: Studio – Diabotical",
      dates: "Mar 2021 – Aug 2021",
      summary: [Collaborated with the development team to solve audio issues on this multi-player arena shooter.],
      bullets: (
        [Investigated issues within their custom game engine related to occlusion and spatial audio.],
        [Created original in-game audio assets and music.],
      ),
    ),
  ),

  interests: [
    *Music* — I compose electronic music and also present a radio show. Recently I've been exploring music live coding platforms like Strudel and Sonic Pi.
  ],
)
