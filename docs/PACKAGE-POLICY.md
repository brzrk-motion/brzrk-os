# Package and software policy

## Inclusion rules

A package may be listed in BRZRK manifests only if:

1. It is available from **Arch** `[core]`/`[extra]` **or** documented CachyOS repos, and
2. Its purpose maps to creative production (media, color, GPU accel, GNOME creative UX, fonts), and
3. Redistribution/use via pacman does not require BRZRK to ship a proprietary installer blob.

## Manifest tiers

| Manifest | Sync requirement | Purpose |
| --- | --- | --- |
| `base`, `media`, `color`, `creative`, `fonts`, `gpu-*` | Must resolve on Arch `pacman -Si` | CI-validated workstation set |
| `cachyos.packages` | Optional unless `BRZRK_REQUIRE_CACHYOS=1` | Kernel/settings/chwd on real CachyOS |

## Install policy

- **Default recommend:** Arch-verified FOSS set via `brzrk-apply --apply --packages`.
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
