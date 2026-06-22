# Changelog

## CyberHub Lite 1.2 - 22 Jun 2026

This update builds on the Civitai Lite 1.0 release.

### Added

- Added a root `MANUAL.md` for GitHub users and kept the in-app manual at
  `resources/help/cyberhub-lite-manual.md`.
- Added license and third-party notice files to the Lite release zip.
- Added an optional Gallery setting: **Close other folders when opening one**.
- Added ZIP import support in Settings -> Maintenance for update/module packages.

### Improved

- Gallery now hides folders that contain no images and have no image-containing
  subfolders.
- Gallery restores the active folder tree when returning from another module.
- Gallery folder accordion mode now also closes sibling branches when selecting
  a folder without subfolders.
- Gallery folder filtering is faster for large trees by using folder index data
  instead of scanning image rows.
- Viewer and Gallery share the improved metadata reader.
- Viewer no longer shows raw ComfyUI workflow JSON as the prompt when a clean
  prompt can be extracted.
- Improved ComfyUI metadata extraction for modern workflow/node chains.
- Lite Civitai release zips include the current `resources/civitai/models.json`
  for first-run model-name lookup. GitHub source installs can fetch/update it
  from Settings -> Civitai.

### Version Bumps

- Hub: 1.2
- Gallery: 1.2
- Viewer: 1.1
- Settings: 1.1

### Notes

- No re-index is required for the metadata improvements; metadata is parsed live.
- Folder tree changes use the existing Gallery database. Refresh the browser page
  after updating.
