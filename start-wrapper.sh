#!/usr/bin/env bash
set -Eeuo pipefail

# Run your persistent startup hook if present
if [[ -x /workspace/start.sh ]]; then
  echo "[wrapper] running /workspace/start.sh"
  /workspace/start.sh || echo "[wrapper] WARNING: /workspace/start.sh failed"
else
  echo "[wrapper] no executable /workspace/start.sh (skipping)"
fi

# Continue with the original Runpod ComfyUI startup
exec /start.sh.base "$@"
