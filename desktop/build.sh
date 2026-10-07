#!/bin/bash
# Build script for Fun desktop app

set -e

APP_NAME="Fun"
SRC_DIR="src"
OUT_DIR="build"
ASSETS_DIR="assets"

# Clean
rm -rf "$OUT_DIR"
mkdir -p "$OUT_DIR"

echo "Compiling ActionScript..."
# Using Apache Flex SDK or similar
mxmlc \
    -source-path="$SRC_DIR" \
    -library-path+="$ASSETS_DIR" \
    -output="$OUT_DIR/$APP_NAME.swf" \
    -static-link-runtime-shared-libraries=true \
    -target-player=11.1 \
    -swf-version=14 \
    -default-background-color=0xF0F0F0 \
    "$SRC_DIR/Main.as"

echo "Packaging AIR application..."
# For AIR desktop (optional)
# adt -package -target native -storetype pkcs12 -keystore cert.p12 \
#     "$OUT_DIR/$APP_NAME.exe" "$APP_NAME-app.xml" "$OUT_DIR/$APP_NAME.swf" "$ASSETS_DIR"

echo "Build complete: $OUT_DIR/$APP_NAME.swf"