# Path to a bootable / testable artifact

This repository does **not** yet produce an ISO. Use this ladder; do not skip evidence.

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

## Finally: branded image (only with proof)

Upstream reference: [CachyOS-Live-ISO](https://github.com/CachyOS/CachyOS-Live-ISO) (`buildiso.sh -p desktop`, archiso profiles).

Likely BRZRK approach (not implemented yet):

1. Add a GNOME-oriented package list / profile overlay (stock desktop list is Plasma-centric).
2. Inject BRZRK manifests + `/etc/dconf/db/local.d/00-brzrk`.
3. Build ISO in CI or a clean builder VM; boot under QEMU; run automated smoke tests (`testiso.sh` patterns upstream).
4. Only then publish checksums and call it a BRZRK image.

**Do not advertise an installable BRZRK OS ISO until step 3 has a green, recorded boot test.**
