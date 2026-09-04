# Architecture

## Verdict

BRZRK OS is a **thin creative-workstation overlay** for CachyOS (Arch-compatible), with a pinned CachyOS Live ISO profile used to produce a first testable image.

Smallest credible path that matches the product goal:

1. Install CachyOS and select **GNOME** (stock CachyOS live desktop profile is Plasma/KDE as of the inspected `CachyOS-Live-ISO` `packages_desktop.x86_64`).
2. Apply BRZRK package manifests + GNOME dconf + media-project conventions from this repository.
3. Build the branded test image through `scripts/brzrk-iso`, which delegates image assembly to CachyOS’s archiso-based `buildiso.sh`.

## Responsibility split

| Layer | Owner | Examples |
| --- | --- | --- |
| Kernel, micro-arch repos, `chwd`, mirrors, base ISO tooling | CachyOS | `linux-cachyos`, `chwd`, `cachyos-settings`, Live ISO |
| Desktop session choice | CachyOS installer / user | GNOME vs Plasma; `cachyos-gnome-settings` |
| Creative package sets, GNOME creative defaults, media dirs, policy docs | **BRZRK OS** | manifests/*, `config/dconf`, `scripts/brzrk-*` |
| Proprietary DCC (Adobe, DaVinci Resolve Studio, Cinema4D, …) | User / vendor | Never vendored here |

## Repository layout

```
manifests/     declarative package sets (Arch-verified + CachyOS-optional)
config/dconf/  system dconf overlay for GNOME creative defaults
config/skel/   documented XDG/project conventions
iso/           pinned-profile inputs and live-environment overlay
scripts/       validate / apply / ISO build / canonical check entrypoints
tests/         executable checks runnable without a GPU workstation
docs/          decisions, policy, bootable roadmap
```

## Why not vendor the ISO builder?

- CachyOS already maintains `CachyOS-Live-ISO` (archiso + `buildiso.sh`). Vendoring its boot files and installer scripts would create a second unmaintained builder.
- The pinned upstream profile is KDE-oriented, so `scripts/brzrk-iso` replaces its package list, login manager, branding, and skeleton defaults with BRZRK inputs.
- A post-install overlay is inspectable, testable on plain Arch (this host), and useful immediately.

## Runtime model

- `scripts/brzrk-validate` — layout, dconf compile, secret scan, `pacman -Si` for every Arch-tracked package.
- `scripts/brzrk-apply` — dry-run by default; `--apply` writes dconf; optional `--packages` / `--gpu` / `--skel`.
- `scripts/brzrk-iso` — offline profile check or pinned upstream build; artifacts go to `out/desktop/`.
- `scripts/brzrk-check` — canonical local gate (profile checks, no network ISO build, no proprietary downloads).

## Evidence sources used for this pass

- Local Arch `pacman` sync DBs (package names/versions, `mesa` provides `libva-mesa-driver`).
- CachyOS GitHub: `CachyOS-Live-ISO` README + `archiso/packages_desktop.x86_64`; pinned builder commit `4937780541814b4b0ec7c212c00fe06299f799b6`; `cachyos-gnome-settings` dconf; `chwd` README.
- Network fetches of third-party wiki HTML were unavailable in this environment; claims are limited to what was verified via pacman and those upstream repo files.
