#import "template.typ": *

#show: cv.with(name: "Nick Quirk")

#let linkedin = "https://www.linkedin.com/in/nick-quirk"
#let github = "https://github.com/nickquirk"

#header("Nick Quirk", "Software Engineer")[
  *Location:* London, W1 | *Email:* nickquirk\@proton.me | *LinkedIn:* #link(linkedin)[nick-quirk] \
  *GitHub:* #link(github)[nickquirk] | *Blog:* #link("https://theyellowsoundmachine.com")[theyellowsoundmachine.com]
]

#section("Profile")

#par(justify: true)[
  Full-stack engineer working across *TypeScript*, *Next.js*, *Go* and *GCP* on an international e-commerce platform, where I own features from concept to production. Before engineering I spent six years in live events running trader operations at greenfield events such as Glastonbury and CarFest, and co-founding a company that built off-grid network infrastructure for on-site ePOS. I love to build tools that remove manual work, and I've encouraged the adoption of AI-assisted development and tools across our team.
]

#section("Skills")

#skills(
  ("Programming languages", "Go, PHP, TypeScript, JavaScript, Python"),
  ("Frontend", "Next.js, React, TailwindCSS, Sass, TanStack Query"),
  ("Backend", "GORM, MySQL, SQLite, Node.js, Kafka, RabbitMQ, JWT, OAuth2"),
  ("Testing", "Jest, Go Testing, Cypress"),
  ("DevOps, cloud & monitoring", "Docker, Kubernetes, GCP, DataDog, Jenkins, Cloud Run"),
  ("AI tools", "Claude Code, Google AI Studio, OpenCode CLI, PyTorch ML library"),
  ("Other", "Git/Bitbucket, Postman, Max/MSP, PureData, Unreal Engine, Figma"),
)

#section("Employment")

#job("Software Engineer", "May 2023 – Present", "Attraction Tickets LTD")

- Build and operate full-stack features end-to-end in the *Customer Success Team* (PHP, Golang, TypeScript), owning the lifecycle from conception through to deployment on production (Jenkins, GCP).
- Implemented *Payment Links* to ensure PCI compliance was followed when customer payments were taken over the phone. This was a complex process undertaken across three codebases.
- Developed a custom *Fraud Rule Engine* for finer-grained identification of fraudulent payments, improving detection rates and cutting manual review time for stakeholders.
- Designed and deployed a user journey tracking tool for the checkout flow, now used daily and reducing the Product Owner's analysis workload by 10 hours monthly.
- Automated financial reporting with an internal web scraping and dashboard tool, automating a painful manual procedure and saving the Director of Finance around 8 hours monthly.
- Introduced *AI-assisted development tooling* (documentation generation, auto test writer) into team workflows, saving around 5 hours per project.
- *Raised test coverage* across the critical checkout codebase with unit, integration and end-to-end tests to protect payment reliability.
- Elected *Development Team Representative* in the Employee Forum.
- Organised *knowledge sharing* sessions around AI Tools and best practices when introducing them.

#section("Projects")

// TODO: point repo/url at the actual project repos.
#project(
  "Life Dashboard",
  url: "https://frontend-835639357459.europe-west2.run.app/",
  repo: github + "/life-dashboard-server",
  stack: "Go, GORM, MySQL, Next.js 16, TypeScript, TanStack Query, Tailwind, GCP",
)

- Designed and shipped a *full-stack productivity platform* that unifies Google Tasks and Calendar into a single drag-and-drop planning surface, deployed to *GCP Cloud Run* against *Cloud SQL* via a *Cloud Build CI/CD pipeline* with automated migration jobs.
- Secured the platform end-to-end: *OAuth2* login, *AES-256-GCM encryption* of persisted provider tokens, HTTP-only *JWT* session cookies with hashed refresh-token rotation, and *OIDC*-validated service requests backed by *GCP Secret Manager*.
- Structured the Go service around *Onion Architecture* with DTOs, interface-driven repositories and *Uber Dig dependency injection*, enabling comprehensive *unit and integration testing* against mocked dependencies.
- Engineered a drag and drop scheduling UI with *dnd-kit*, covered by a *Jest and React Testing Library* suite.

#project(
  "Generative Audio Streamer",
  url: github + "/generative-audio-streamer",
  stack: "Python, PyTorch, FastAPI, Apache Kafka, Tone.js, Docker",
)

- Built a *decoupled streaming pipeline* where *Apache Kafka* buffers generated musical events and *Server-Sent Events (SSE)* push them to the browser, keeping playback continuous while generation runs asynchronously upstream.
- *Handled* the real-time client using *Tone.js* for browser-based synthesis and an *HTML5 Canvas* piano roll rendering an endless note stream without dropped frames.
- *Trained a 2-layer LSTM* on MIDI datasets to predict musical sequences, using *Top-K sampling* with probabilistic silence injection so output stays varied rather than collapsing into repetition.
- *Orchestrated* the full stack — *Kafka*, *Zookeeper*, *FastAPI* and model server — under *Docker Compose* for reproducible local development.

#section("Work history")

#entry("Events Operations", "UK Festival Circuit", "May 2017 – May 2023")

- Orchestrated operational logistics for up to 50 traders at large-scale UK events (20,000+ attendees), ensuring compliance and safety during the event.

#entry("Co-Founder", "Can-Fi", "August 2019 – Sept 2022")

#pad(left: 1.4em)[
  Founded alongside my events work to solve a problem I kept seeing on site: traders unable to take card payments because public mobile networks collapse under festival crowd loads.
]

- Designed and built the full hardware stack — a solar-powered, battery-backed rig housed in four oil drums, feeding a *Ubiquiti mesh network* that shared a single high-gain *4G uplink*.
- Field-tested components independently, including providing Wi-Fi to traders at smaller events and running a redundancy network at Glastonbury's Mandela Bar.
- Covid cancelled the 2020–21 festival season before the complete system reached full deployment.

// Example variant: hidden when built with --input focus=backend (or any
// focus other than "audio"), shown in the general CV.
#only("audio")[
  #entry("Technical Audio", "GD: Studio – Diabotical", "March 2021 – Aug 2021")

  #pad(left: 1.4em)[
    Collaborated with the development team to solve audio issues on this multi-player arena shooter.
  ]

  - Investigated issues within their custom game engine related to occlusion and spatial audio.
  - Created original in-game audio assets and music.
]

#v(0.4em)
#align(center, emph[For full career breakdown visit my #link(linkedin)[LinkedIn]])

#section("Education")

General Assembly, London, *Software Engineering Immersive* (Sept 2022 – Dec 2022) \
Leeds Beckett University, *Sound and Music for Interactive Games MSc* (Sept 2013 – Sept 2014) \
University of the West of England, *Audio and Music Technology BSc (Hons)* (Sept 2009 – July 2012)

#section("Interests")

*Music* — I compose electronic music and also present a radio show. Recently I've been exploring music live coding platforms like Strudel and Sonic Pi. *Reading* — I read every day and always have a book on the go. From pop psychology to biographies to sci-fi and everything in between.
