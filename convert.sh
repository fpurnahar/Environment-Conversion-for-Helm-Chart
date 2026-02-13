#!/bin/bash

if [ "$#" -lt 1 ]; then
  echo "❌ Usage: ./core.sh *.env"
  exit 1
fi

# Pastikan script core bisa dijalankan
chmod +x core.sh

# Jalankan paralel (max 4 file sekaligus)
printf "%s\n" "$@" | xargs -P4 -I{} ./core.sh "{}"

echo "🎉 Semua file selesai diproses."