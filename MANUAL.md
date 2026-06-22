# CyberHub Lite: User Manual

CyberHub Lite is the free local edition of CyberHub. It is focused on browsing,
searching, inspecting and organizing AI-generated images. It runs on your own
machine over `localhost`; your images and prompts are not uploaded anywhere.

Lite is not a time-limited demo. It contains the complete gallery workflow:
Gallery, Viewer, Compare, Library and Settings. The Full edition adds production
tools such as Captioner, Prompt Engineer, Danbooru, Civitai Grabber, Overlay,
Cropper, Amateur Photo and Meta Copy Tool.

---

## Quick Start

1. Unzip `cyberhub-lite_v1.zip`.
2. Run `start.bat` on Windows or `./start.sh` on macOS/Linux.
3. Open the local URL printed in the terminal.
4. Go to Settings and add one or more image folders under Gallery.
5. Restart when Settings asks for it.

Requires Python 3.10-3.13. Your image folders are treated as read-only sources;
CyberHub Lite indexes them but does not move or modify the original files.

---

## Top Bar

The menu button opens the module switcher. The CyberHub title returns to the
Gallery. The theme button toggles dark/light mode. The Settings button opens the
configuration page.

---

## Modules

### Gallery

Gallery is the main image browser. It scans your configured folders, creates a
local SQLite index and shows your images in a fast thumbnail grid.

Main features:

- Multiple image folder roots.
- Folder tree navigation.
- Search across filenames, prompts, metadata and model names.
- Fragment search for model/checkpoint names, for example `zit` can match
  `CyberRealistic_zit_v5.0`.
- Favorites.
- Manual collections.
- Metadata side panel with parsed prompt, negative prompt, settings and raw
  metadata.
- Civitai model lookup from the local `models.json`. The Civitai release zip
  may include a current copy; GitHub source installs can fetch/update it from
  Settings -> Civitai.
- Send prompt metadata to Library cards.
- Side-by-side Compare from selected images.

Large collections are expected. The first scan can take a while, especially for
hundreds of thousands of images. Later startup scans skip unchanged folders where
possible.

### Viewer

Viewer lets you drop or choose one PNG, JPG or WEBP image and inspect its
generation metadata.

It shows:

- File info.
- Positive prompt.
- Negative prompt.
- Parsed generation settings.
- Civitai model match when available.
- Full raw metadata.

For PNG files, Viewer can also edit embedded text metadata. Use Edit in the Raw
Metadata section, adjust the prompt, negative prompt or raw JSON, then download a
new PNG with the modified metadata.

### Compare

Compare shows 2 to 4 selected images side by side.

From Gallery, use Ctrl+Click to select multiple images, then open Compare. The
images do not need to be next to each other in the folder or timeline.

Compare helps with:

- Visual differences between generations.
- Prompt differences.
- Shared, partial and unique tags.
- Picking the best image from a batch.

### Library

Library stores reusable prompt cards and notes. You can save strong prompts,
attach source images and build a personal reference library of what worked.

Card types include generation prompts, snippets and notes. Gallery can send an
image prompt and source image directly into a Library card.

### Settings

Settings controls the local Hub and enabled modules.

Important Lite settings:

- Gallery image folders.
- Theme.
- Network/LAN mode.
- Civitai `models.json` update.
- Maintenance actions such as rebuild index, rebuild search, generate
  thumbnails and optimize database.
- System diagnostics.

LAN mode is optional. By default CyberHub Lite only listens on `localhost`.

---

## Local Data

CyberHub Lite stores local app data next to `hub.py`:

```text
cyberdelia.db        gallery + library SQLite database
.thumbs/            generated thumbnails
settings.json       your settings
resources/          bundled/runtime resources
```

Your original image files stay in the folders you configured.

---

## Going Offline

CyberHub Lite is local-first. Normal use does not require a cloud account or
upload. A few optional actions may use the internet when you trigger them:

- Updating Civitai `models.json` from Settings.
- Downloading UI fonts on first run if they are missing.

The app does not automatically check for updates.

---

## Troubleshooting

### Gallery shows nothing after adding a folder

The first index may still be running. Watch the terminal for `[INDEX]` progress
lines. Large folders can take time on first scan.

### Thumbnails are missing

Go to Settings -> Maintenance -> Generate all thumbnails.

### Search misses recent images

Go to Settings -> Maintenance -> Rebuild search.

### Folder paths look wrong from another computer

Folder paths belong to the computer running the Hub server. If the Hub runs on
PC A and you open it from laptop B, server-side folder browsing sees PC A.

### Need help debugging

Open Settings -> System diagnostics and copy the diagnostic text.

---

## Full Edition

CyberHub Full adds the production modules:

- Captioner.
- Prompt Engineer.
- Danbooru Toolkit + offline Auto-Tagger.
- Civitai Grabber.
- Cropper.
- Overlay.
- Amateur Photo.
- Meta Copy Tool.

Lite organizes and searches your collection. Full adds the tools for captioning,
tagging, processing, downloading and metadata workflows.
