# Architecture

## Verdict

BRZRK OS is a **thin creative-workstation overlay** for CachyOS (Arch-compatible), not a forked distribution and not (yet) an installable ISO.

Smallest credible path that matches the product goal:

1. Install CachyOS and select **GNOME** (stock CachyOS live desktop profile is Plasma/KDE as of the inspected `CachyOS-Live-ISO` `packages_desktop.x86_64`).
2. Apply BRZRK package manifests + GNOME dconf + media-project conventions from this repository.
3. Defer a branded bootable image until an overlay can be built and tested in CI/VM against CachyOS’s archiso-based `buildiso.sh`.

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
scripts/       validate / apply / canonical check entrypoints
tests/         executable checks runnable without a GPU workstation
docs/          decisions, policy, bootable roadmap
```

## Why not fork the ISO first?

- CachyOS already maintains `CachyOS-Live-ISO` (archiso + `buildiso.sh`). Forking without a reproducible CI build would invent an unverified “image”.
- Default desktop package list is KDE-oriented; BRZRK’s product is GNOME-centered. A GNOME ISO profile is future work, not a claim of this pass.
- A post-install overlay is inspectable, testable on plain Arch (this host), and useful immediately.

## Runtime model

- `scripts/brzrk-validate` — layout, dconf compile, secret scan, `pacman -Si` for every Arch-tracked package.
- `scripts/brzrk-apply` — dry-run by default; `--apply` writes dconf; optional `--packages` / `--gpu` / `--skel`.
- `scripts/brzrk-check` — canonical local gate (no network ISO build, no proprietary downloads).

## Evidence sources used for this pass

- Local Arch `pacman` sync DBs (package names/versions, `mesa` provides `libva-mesa-driver`).
- CachyOS GitHub: `CachyOS-Live-ISO` README + `archiso/packages_desktop.x86_64`; `cachyos-gnome-settings` dconf; `chwd` README.
- Network fetches of third-party wiki HTML were unavailable in this environment; claims are limited to what was verified via pacman and those upstream repo files.
