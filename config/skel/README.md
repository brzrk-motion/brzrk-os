# BRZRK OS XDG media-project conventions (documentation for skel apply)
#
# Recommended top-level layout under $HOME (created by scripts/brzrk-apply):
#   Projects/          active client/show work
#   Projects/_inbox/   unsorted drops from camera/cards
#   Media/Cache/       renders, proxies, thumbnails (safe to wipe)
#   Media/Exports/     delivery masters
#   Media/LUTs/        user-provided LUTs (never redistribute proprietary)
#   Media/OCIO/        optional local OCIO configs / roles
#
# Permissions: projects stay mode 700 for the owner by default.
# External volumes used for media should be mounted with user ownership
# (udisks) rather than world-writable sticky dirs.
