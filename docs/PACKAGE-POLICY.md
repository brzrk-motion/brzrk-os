# Package and software policy

## Inclusion rules

A package may be listed in BRZRK manifests only if:

1. It is available from **Arch** `[core]`/`[extra]` **or** documented CachyOS repos, and
2. Its purpose maps to creative production (media, color, GPU accel, GNOME creative UX, fonts), and
3. Redistribution/use via pacman does not require BRZRK to ship a proprietary installer blob.

## Manifest tiers

| Manifest | Sync requirement | Purpose |
| --- | --- | --- |
| `base`, `media`, `color`, `creative`, `developer`, `fonts`, `gpu-*` | Must resolve on Arch `pacman -Si` | CI-validated workstation set |
| `cachyos.packages` | Optional unless `BRZRK_REQUIRE_CACHYOS=1` | Kernel/settings/chwd on real CachyOS |

## Install policy

- **Developer layer:** Git, Node.js/npm, Docker, Docker Compose, Docker Buildx, Zed, Starship, and Ghostty are included in `developer.packages`.
- **AI/developer applications:** Hermes Desktop, Codex CLI, and the community `chatgpt-desktop` AUR package are documented in `manifests/optional-developer.txt`; they require their own installer/authentication flows and are not silently installed by pacman.
- **herdr:** not added because the requested name does not identify a verifiable package or tool. Confirm the intended project/package name before adding it.
- **Core creative apps:** Blender, Krita, Kdenlive, OBS Studio, Chromium, Ghostty, GIMP, Inkscape, Darktable, Audacity, and HandBrake are included in the Arch-verified creative set.
- **Optional third-party apps:** Spotify, Natron, and DaVinci Resolve are recorded in `manifests/optional-third-party.txt`. They are not official Arch packages on the validation host and must be installed separately only after reviewing the relevant AUR/community source, licensing, and hardware requirements. DaVinci Resolve remains proprietary and BRZRK will not redistribute its installer.
- **Defaults:** Chromium is configured for HTTP/HTTPS/HTML; Ghostty is configured as the GNOME terminal and dock favorite.
- **GPU:** choose `--gpu amd|intel|nvidia` after hardware is known; on CachyOS prefer `chwd`.
- **Flatpak/Flathub:** enabled (`flatpak` + `gnome-software`) for apps not in repos; user-initiated.
- **AUR (`paru`):** listed only under CachyOS optional set; BRZRK does not pin AUR PKGBUILDs in this pass.
- **Proprietary DCC:** document only — never commit installers, license keys, or cracked content.

## Color / ACES

- Foundations: `opencolorio`, `openimageio`, `openexr`, `colord`, `gnome-color-manager`.
- Calibration tools: `argyllcms`, `displaycal` (hardware instruments optional).
- Studio ACES configs and vendor LUT packs stay outside the repo; place user copies under `~/Media/OCIO` and `~/Media/LUTs`.

## Codecs

- Prefer Fedora/Arch-normal `ffmpeg` + full GStreamer plugin set (`base/good/bad/ugly` + `gst-libav`).
- No claim of patent indemnity; users in restrictive jurisdictions must review codec legal status themselves.
