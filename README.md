# BRZRK OS

> Omarchy for motion designers — built around GNOME and creative-production workflows.

BRZRK OS is an opinionated Linux workstation experience for motion designers, 3D artists, video editors, and digital creative professionals.

It uses CachyOS as its performance-focused Arch Linux foundation while BRZRK OS owns the creative workstation experience: configuration, software selection, branding, and workflow defaults.

## Goal

**Install BRZRK OS → reboot → start creating.**

The workstation should not require hours of manual setup for codecs, GPU acceleration, ACES/color management, creative applications, terminal configuration, or hardware support.

## Status

**Initial overlay foundation (not an installable image yet).**

Architecture: thin post-install layer on CachyOS/Arch + GNOME. See [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) and [`docs/ROADMAP-BOOTABLE.md`](docs/ROADMAP-BOOTABLE.md).

## Quick start (checks)

On Arch or CachyOS with `pacman` and `dconf`:

```bash
./scripts/brzrk-check
```

Dry-run the apply plan (no root, no installs):

```bash
./scripts/brzrk-apply
./scripts/brzrk-apply --packages --gpu amd --skel
```

Apply on a real GNOME workstation (root):

```bash
sudo ./scripts/brzrk-apply --apply --packages --gpu amd --skel
```

## Principles

- Creative-production-first, not general-purpose Linux.
- GNOME as the desktop foundation.
- CachyOS as the performance-focused Arch base.
- Reproducible, inspectable configuration.
- Sensible defaults with clear escape hatches.
- Automate setup; explain what automation changes.
- Prefer upstream packages and documented integrations over fragile hacks.

## Documentation

| Doc | Topic |
| --- | --- |
| [`docs/INITIAL-BUILD-MISSION.md`](docs/INITIAL-BUILD-MISSION.md) | Mission brief |
| [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) | Layering and layout |
| [`docs/DECISIONS.md`](docs/DECISIONS.md) | Decisions / assumptions |
| [`docs/PACKAGE-POLICY.md`](docs/PACKAGE-POLICY.md) | What we ship and why |
| [`docs/HARDWARE-LICENSING.md`](docs/HARDWARE-LICENSING.md) | GPU / license boundaries |
| [`docs/ROADMAP-BOOTABLE.md`](docs/ROADMAP-BOOTABLE.md) | Path to a tested image |

## License

MIT — see [`LICENSE`](LICENSE). Upstream packages keep their own licenses.
