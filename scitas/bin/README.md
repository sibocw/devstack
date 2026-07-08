## Tl;dr
- Cancel all jobs submitted by me:
    `abort-abort-abort`
- Attach interactive shell to currently running job:
    - `attach <jobid>`
- Launch short interactive job for testing:
    - `interact cpu` (CPU-only on Jed)
    - `interact l40s` (L40S GPU on Kuma)
    - `interact h100` (H100 GPU on Kuma)
- Display queue of jobs submitted by me, but show longer job names and hide estimated starting time and nodelist:
    - `Squeue` (drop-in replacement of `/usr/bin/Squeue`

See `bin/` at root of this repository for non-SCITAS-specific utility scripts.

## Installation
Same as root `bin/README.md`.
