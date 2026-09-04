# BRZRK OS repository instructions

You are working on BRZRK OS, an opinionated Linux distribution/workstation experience for motion designers, 3D artists, video editors, and digital creative professionals.

## Working rules

- Read `README.md` and `docs/INITIAL-BUILD-MISSION.md` before changing code.
- Treat the creative-production workflow as the product. Avoid generic distro feature creep.
- Verify current Arch/CachyOS/GNOME behavior and package names before encoding assumptions.
- Keep the first implementation small, reproducible, inspectable, and runnable in CI or a clean Arch-like environment.
- Do not include secrets, proprietary installers, or unverified redistribution claims.
- Prefer shell scripts with strict modes and clear diagnostics; make scripts idempotent where practical.
- Add tests or validation for every non-trivial behavior.
- Update documentation when architecture or user-facing defaults change.

## Before declaring work complete

Run the repository's canonical checks and report their actual output. Distinguish checks that require real hardware, a VM, or network access from checks that can run locally.
