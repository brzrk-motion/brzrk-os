# BRZRK OS — Initial Build Mission

## Mission

Establish a credible, runnable foundation for BRZRK OS: a CachyOS-based, GNOME-centered Linux distribution experience optimized for motion design, 3D, video, and creative production.

## First milestone

Produce a small, testable project skeleton that can evolve into an installable image or reproducible workstation setup without pretending that distribution packaging is solved.

## Initial investigation and build targets

1. Inspect current CachyOS, Arch, and GNOME customization/build mechanisms and choose the smallest viable architecture.
2. Define the boundary between CachyOS base responsibilities and BRZRK OS responsibilities.
3. Create a reproducible project layout for packages, configuration, branding, install/bootstrap scripts, documentation, and tests.
4. Identify the initial creative workstation defaults:
   - GPU/compute and video acceleration strategy
   - codecs and media tooling
   - color management and ACES workflow foundations
   - core creative applications and installation policy
   - fonts, shell, terminal, and file-management defaults
   - storage, permissions, and media-project conventions
5. Add validation that runs without requiring a physical workstation or proprietary secrets.
6. Document decisions, assumptions, unresolved hardware/licensing questions, and a path to a bootable/testable artifact.

## Constraints

- Do not build a generic Arch desktop spin.
- Do not invent package availability or hardware support; verify claims.
- Do not download proprietary creative software or redistribute software without checking licensing.
- Keep credentials and machine-specific secrets out of the repository.
- Prefer a thin, maintainable layer over CachyOS rather than forking the operating system unnecessarily.
- Every completed task must be backed by an executable check or explicit documented evidence.

## Definition of a useful first pass

A new contributor should be able to understand the architecture, run the non-hardware checks, and see exactly what remains before a VM-installable or bare-metal-testable image can be claimed.
