# Hardware and licensing boundaries

## Hardware

| Area | BRZRK stance | Notes |
| --- | --- | --- |
| AMD GPU | First-class via `mesa`, `vulkan-radeon`, `opencl-mesa` | Verified package names in Arch |
| Intel GPU | `vulkan-intel` + `intel-media-driver` (Broadwell+) | Older IGPs may need `libva-intel-driver` (not defaulted) |
| NVIDIA | Optional `nvidia-open-dkms` + `nvidia-utils` | Kernel/module matching is host-specific; CachyOS `chwd` preferred |
| Audio | PipeWire + WirePlumber | JACK bridge via `pipewire-jack` |
| Colorimeters | Supported through ArgyllCMS/DisplayCAL when present | No hardware guaranteed |

Unresolved until tested on real GPUs/VMs:

- Hybrid laptop mux / offload defaults
- Which NVIDIA open vs proprietary module matrix BRZRK should document per kernel
- Thunderbolt dock / capture-card permission recipes

## Licensing

- **This repository:** MIT (`LICENSE`).
- **Upstream packages:** retain their own licenses (GPL, Apache, BSD, …) as reported by `pacman -Si`.
- **BRZRK does not redistribute** Adobe, Blackmagic, Maxon, Foundry, or similar proprietary installers.
- **Fonts:** only packages with clear redistributable licenses via Arch (`Inter`, Noto, Liberation, Source Code Pro, Adwaita).
- **OCIO/ACES:** OpenColorIO is BSD-3-Clause in Arch; Academy ACES reference configs have their own terms — do not vendor blindly; link/document in a later pass after license review.

## Secrets and machine identity

- No API keys, mirror credentials, Secure Boot dbx keys, or host SSH keys in-tree.
- `brzrk-validate` fails on obvious private-key / cloud-key patterns.
