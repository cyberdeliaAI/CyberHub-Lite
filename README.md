# CyberHub Lite

**Your AI image collection, organized — running 100% on your own machine.**

CyberHub Lite is a local-first command center for AI image creators. Point it at
your output folders and browse, search, and understand your generated images — no
account, no cloud, nothing uploaded.

> This is the free **Lite** edition. A paid **Full** edition adds creation/processing
> tools (Civitai grabber & browser, Danbooru auto-tagger, AI captioner, prompt
> engineer, cropper, overlays, and more). See [Full edition](#full-edition).

## Features

- **🖼 Gallery** — fast browsing of huge collections: folder tree, favorites,
  collections, thumbnails, and a metadata side-panel for every image.
- **🔎 Powerful search** — full-text search over prompts and metadata, including
  fragment search on checkpoint names (search `zit` → finds `CyberRealistic_zit_v5.0`).
- **🧬 Reads (almost) every metadata format** — Automatic1111, ComfyUI, Civitai,
  InvokeAI (all variants), NovelAI, SwarmUI, Fooocus / RuinedFooocus / FooocusMRE,
  EasyDiffusion. Prompt, negative, model, LoRAs and settings parsed into a clean
  panel, plus a Raw view.
- **🧭 Civitai model lookup** — resolves checkpoint hashes to readable model names.
- **👁 Viewer & Compare** — full-screen viewing and side-by-side comparison.
- **📚 Prompt Library** — save and organize your favorite prompts.

## Install

Requires **Python 3.10–3.13**.

1. Clone or download this repo.
2. Run the start script — it sets up a virtual environment, installs dependencies,
   and downloads fonts on first run:
   - **Windows:** `start.bat`
   - **macOS / Linux:** `./start.sh`
3. Open the URL it prints, go to **Settings**, and add your image folder.

The Civitai model database (`models.json`) is **not** bundled — fetch it any time
from **Settings → Civitai** (in-app updater).

## Manual

See [`MANUAL.md`](MANUAL.md) for the full user manual, including Gallery, Viewer,
Compare, Library, Settings, local data and troubleshooting.

## Privacy

Everything runs locally over `http://localhost`. Your images and prompts never
leave your machine. Optional LAN mode lets you open the hub from another device on
your own network.

## License

CyberHub Lite is released under the **PolyForm Noncommercial License 1.0.0**
(source-available). You may use, modify, share, and self-host it for **any
noncommercial purpose** — personal, hobby, research, testing, Docker, etc.
**Commercial use/resale is not permitted.** See [`LICENSE.md`](LICENSE.md) and
[`THIRD-PARTY-NOTICES.md`](THIRD-PARTY-NOTICES.md).

## Contributing

PRs and issues are very welcome — see [`CONTRIBUTING.md`](CONTRIBUTING.md). Note the
short contributor agreement: it lets accepted contributions also ship in the
commercial Full edition.

## Full edition

The **Full** edition bundles the production tools on top of everything here. It's a
separate paid product: **[get CyberHub Full →](https://whop.com/cyberdelia-ai-lab)**
