#!/usr/bin/env bash
# Generates carlos-vera-resume.pdf from the running Jekyll server.
# Usage: bash scripts/generate-pdf.sh [URL]
# Default URL: http://localhost:4000
# Requires: Jekyll running locally + Google Chrome installed

CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
URL="${1:-http://localhost:4000}"
OUTPUT="assets/downloads/carlos-vera-resume.pdf"
TEMP_PDF="/tmp/cv_resume_$$.pdf"
MIN_SIZE=300000  # 300 KB minimum — a real resume is always bigger

echo "Generating PDF from $URL ..."

"$CHROME" \
  --headless \
  --disable-gpu \
  --no-sandbox \
  --print-to-pdf="$TEMP_PDF" \
  --no-pdf-header-footer \
  --run-all-compositor-stages-before-draw \
  --virtual-time-budget=3000 \
  "$URL" 2>/dev/null

if [ ! -f "$TEMP_PDF" ]; then
  echo "✗ Chrome did not produce a file. Is Jekyll running at $URL?"
  exit 1
fi

ACTUAL_SIZE=$(wc -c < "$TEMP_PDF")
if [ "$ACTUAL_SIZE" -lt "$MIN_SIZE" ]; then
  echo "✗ PDF too small (${ACTUAL_SIZE} bytes < ${MIN_SIZE} minimum). Keeping previous version."
  rm -f "$TEMP_PDF"
  exit 1
fi

mkdir -p "$(dirname "$OUTPUT")"

# Preserve previous version before overwriting
if [ -f "$OUTPUT" ]; then
  cp "$OUTPUT" "${OUTPUT%.pdf}-previous.pdf"
fi

mv "$TEMP_PDF" "$OUTPUT"
echo "✓ Saved: $OUTPUT ($(du -h "$OUTPUT" | cut -f1))"
