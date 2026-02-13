#!/bin/bash

# Path ke file .env (misal: sample.env)
ENV_FILE_PATH="$1"

if [ -z "$ENV_FILE_PATH" ] || [ ! -f "$ENV_FILE_PATH" ]; then
  echo "❌ File tidak ditemukan: $ENV_FILE_PATH"
  exit 1
fi

# Ambil nama service dari nama file (misal: sample.env → sample)
NAME=$(basename "$ENV_FILE_PATH" .env)
FOLDER="microservice-$NAME"
ENV_YAML_FILE="$FOLDER/env.yaml"
VALUES_TEMPLATE="template_values.yaml"
VALUES_OUTPUT_FILE="$FOLDER/values.yaml"

echo "🚀 Proses service: $NAME"

# --- Convert .env ke YAML ---
mkdir -p "$FOLDER"
echo "env:" > "$ENV_YAML_FILE"
while IFS= read -r line || [ -n "$line" ]; do
  [[ -z "$line" || "$line" == \#* ]] && continue
  KEY=$(echo "$line" | cut -d: -f1 | xargs)
  VALUE=$(echo "$line" | cut -d: -f2- | xargs)
  echo "  - name: $KEY" >> "$ENV_YAML_FILE"
  echo "    value: \"$VALUE\"" >> "$ENV_YAML_FILE"
done < "$ENV_FILE_PATH"

echo "✅ ENV saved: $ENV_YAML_FILE"

#--- Convert template_values.yaml ---
if [ -f "$VALUES_TEMPLATE" ]; then
  sed "s/template/$NAME/g" "$VALUES_TEMPLATE" | \
  sed "s/microservice-template/microservice-$NAME/g" | \
  sed "s/microservice-template-testing.com/microservice-$NAME-testing.com/g" > "$VALUES_OUTPUT_FILE"

  echo "✅ Values saved: $VALUES_OUTPUT_FILE"
else
  echo "⚠️ Template $VALUES_TEMPLATE tidak ditemukan."
fi
