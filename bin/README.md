## Tl;dr
- Convert (multi-Artboard Illustrator) files to PDF and PNG formats for publication (multi-artboard files are split into one PDF/PNG per artboard):
    - `ai2pdfpng -ai <indir-with-ai-files-or-single-ai-file> -pdf <outdir-for-pdfs> -png <outdir-for-pngs> -dpi <dpi>`
- Generate BIB entry given DOI (like doi2bib.org but without its rate limit; calls doi.org API directly):
    - `doi2bib <doi-or-url>` (copies to output clipboard automatically)
- Generate a CSV manifest (path, size, mtime) of all files in a directory or tar archive, for easier diffing between two file trees:
    - `gen-manifest <directory-or-tar-file>` (writes `<path>.manifest.csv`, and `<path>.manifest.failed.csv` for entries that couldn't be read)
- Use `rclone` for EPFL NAS servers, but prompt me for password every time instead of requiring it to be saved somewhere in plain text:
    - `rclone-gaspar` (use as a drop-in replacement of `rclone`)
- Shrink PDF size
    - `shrinkpdf <input-pdf-file> -o <output-pdf-file> -q <quality-preset>` (quality preset is one of `screen`, `ebook`, `printer`, `prepress` in increasing order of quality. Optional; default is `printer`)

See `scitas/bin/` for SCITAS-specific scripts.

## Installation
```sh
cd $HOME/.local/bin
ln -s <absolute-path-to-this-folder>/* .
```
Then make sure `$HOME/.local/bin` is in `$PATH`.
