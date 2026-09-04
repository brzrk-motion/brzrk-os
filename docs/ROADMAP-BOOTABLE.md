# Path to a bootable / testable artifact

This repository now contains a first ISO build path. It is a build recipe, not
yet a release artifact; do not skip the boot evidence below.

## Already runnable (local)

```bash
./scripts/brzrk-check
```

Validates manifests against pacman, dconf compile, layout, dry-run apply. No GPU required.

## Next useful artifact: golden VM (recommended)

1. Install current CachyOS; choose **GNOME** in the installer (or install GNOME packages on a minimal base).
2. Clone this repo; run `./scripts/brzrk-check`.
3. As root: `./scripts/brzrk-apply --apply --packages --gpu <amd|intel|nvidia> --skel`.
4. Reboot into GNOME; smoke-test: Ptyxis, Nautilus favorites, Blender launch, `vainfo`/`vulkaninfo` as applicable.
5. Record package versions + GPU in a short `docs/smoke/` note (future).

**Exit criterion:** another contributor can repeat the VM path from docs alone.

## Then: reproducible package install in CI

- Container/VM job on Arch: install pacman sync DBs, run `brzrk-check` (already possible on Arch hosts).
- Optional CachyOS job with `BRZRK_REQUIRE_CACHYOS=1` once CachyOS repos are configured in CI.

## Branded test image

Upstream reference: [CachyOS-Live-ISO](https://github.com/CachyOS/CachyOS-Live-ISO) (`buildiso.sh -p desktop`, archiso profiles).

Implemented approach:

1. Run `./scripts/brzrk-iso --check` to validate the checked-in profile.
2. Run `./scripts/brzrk-iso` on a clean CachyOS/Arch-like builder with the documented prerequisites.
3. Boot the resulting ISO under QEMU; confirm GDM autologin, GNOME defaults, installer launch, and the package inventory.
4. Record package versions, builder commit, VM result, and checksum in `docs/smoke/` before publishing.

**Do not advertise an installable BRZRK OS ISO until step 3 has a green, recorded boot test.**
