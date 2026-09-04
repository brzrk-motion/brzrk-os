# Decisions and assumptions

Recorded during the initial build mission (2026-09-04).

## Decisions

1. **Overlay first, ISO later.** Ship manifests + GNOME dconf + validation before claiming a bootable BRZRK image.
2. **GNOME is the BRZRK desktop.** CachyOS may ship other DEs; BRZRK defaults and favorites assume GNOME Shell + GDM + Ptyxis.
3. **CachyOS remains the performance base.** Prefer `chwd` / CachyOS NVIDIA open profiles on CachyOS hosts; document Arch-equivalent packages for CI validation.
4. **FOSS creative core only in-repo.** Blender, GIMP, Krita, Inkscape, OBS, Darktable, HandBrake, Audacity. Flatpak enabled for optional user installs.
5. **OpenColorIO is the ACES foundation.** Install `opencolorio` + `openimageio` + `openexr`; do not vendor proprietary ACES/LUT packs.
6. **MIT license** for this repository’s scripts and config (see `LICENSE`). Packaged upstream software retains its own licenses.
7. **Mouse accel flat + dark UI + fixed 4 workspaces** as first creative defaults (escape hatch: GNOME Settings / Tweaks).

## Assumptions

- Target machines are x86_64 workstations with a working network for pacman.
- Contributors can run checks on Arch or CachyOS with `pacman` and `dconf` available.
- GNOME desktop file IDs remain stable enough for favorite-apps (verified from Arch package file lists for blender/gimp/inkscape/krita/obs/ptyxis/nautilus/settings).
- `mesa` continues to provide VA-API drivers formerly packaged as `libva-mesa-driver`.

## Explicit non-goals (this pass)

- Building or publishing an ISO.
- Shipping NVIDIA proprietary `.run` installers or CUDA full stacks by default (`cuda` exists in Arch but is opt-in later).
- Wine/Steam gaming layers as product features.
- Claiming DaVinci Resolve / Adobe / Maxon support beyond “user installs separately”.
