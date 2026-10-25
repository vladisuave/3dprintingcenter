# HTML slide decks

Picture-first, animated lesson slides built with [Slidev](https://sli.dev). They are published to GitHub Pages automatically whenever `web/` changes on `main`.

## Presenting (Chromebook or any browser)

- Open the site, pick a lesson
- **F** — full screen · **← →** or a clicker — next/previous · **O** — overview of all slides
- **P** — presenter view with teacher notes (open on your laptop, project the normal view)

## Editing

Each lesson is one Markdown file (`lesson2.md`, …). Slides are separated by `---`.
Teacher notes go in an HTML comment at the end of a slide: `<!-- notes here -->`.

Reusable interactive pieces live in `components/` and can be dropped into any slide:

| Component | What it does |
|---|---|
| `<KeychainArt name="MIA" color="#4f8cff" />` | Flat keychain illustration |
| `<LayerStack name="MIA" />` | Slider / "Print it!" button that builds a keychain layer by layer |
| `<WillItPrint />` | Four tap-to-flip "will it print?" cards |
| `<BuildSteps />` | 4-step keychain build, one step per click (slide needs `clicks: 4`) |
| `<ClassTimer />` | Big work timer with colour-coded phases; keeps running across slides |

Shared colours and card styles are in `styles/index.css`.

## Previewing locally

```sh
cd web
npm install
npm run dev        # live preview at http://localhost:3030
npm run build      # builds every lessonN.md into dist/
```

New lessons: add `lessonN.md` here and a tile for it in `site/index.html`; the build picks it up automatically.

> Inside SVGs, set font size with `style="font-size:…"` rather than a `font-size="…"` attribute — Slidev's CSS engine treats the bare attribute as a utility class and blows the text up.
