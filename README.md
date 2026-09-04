# BRZRK OS

> Omarchy for motion designers — built around GNOME and creative-production workflows.

BRZRK OS is an opinionated Linux workstation experience for motion designers, 3D artists, video editors, and digital creative professionals.

It uses CachyOS as its performance-focused Arch Linux foundation while BRZRK OS owns the creative workstation experience: configuration, software selection, branding, and workflow defaults.

## Goal

**Install BRZRK OS → reboot → start creating.**

The workstation should not require hours of manual setup for codecs, GPU acceleration, ACES/color management, creative applications, terminal configuration, or hardware support.

## Status

**First ISO build path implemented; boot/install validation remains.**

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

## Build the ISO

The ISO builder uses the pinned CachyOS Live ISO profile, replaces its KDE
package profile with BRZRK's GNOME creative workstation set, and injects the
existing BRZRK defaults. It requires a CachyOS or Arch-like build host, root
via `sudo`, the `archiso` toolchain, and network access for packages.

Validate the checked-in profile without building:

```bash
./scripts/brzrk-iso --check
```

Install the build prerequisites and build:

```bash
sudo pacman -S --needed archiso mkinitcpio-archiso git squashfs-tools grub
./scripts/brzrk-iso
```

Artifacts, package inventory, and checksums are written to `out/desktop/`.
This is a rolling-repository build; boot it in a VM before treating it as a
release image.

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
| [`docs/ROADMAP-BOOTABLE.md`](docs/ROADMAP-BOOTABLE.md) | Build and test path |

## License

MIT — see [`LICENSE`](LICENSE). Upstream packages keep their own licenses.
