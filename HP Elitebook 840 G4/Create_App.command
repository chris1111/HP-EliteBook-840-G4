#!/bin/bash
#
# HP-EliteBook-840-G4
# (c) Copyright 2026 chris1111, All Rights Reserved.
# This will create an Apple Bundle App HP-EliteBook-840-G4
# Dependencies: pkgbuild, pkgutil, productbuild
#

set -u

# Always run from the script's own folder
cd "$(dirname "$0")" || exit 1

# ---------------------------------------------------------------------------
# Config — edit here only
# ---------------------------------------------------------------------------
APP_TITLE="HP EliteBook 840 G4"
VERSION="1.0"
PKG_ID="com.opencorePackage.OpenCorePackage.pkg"
STAGE="./Packages/OpenCore-Package/BUILD-PACKAGE"
EXPAND_DIR="/tmp/PackageDIR"
INSTALLER_DIR="./Installer"
APP_BUNDLE="./build/Release/HP EliteBook 840 G4.app"

# ---------------------------------------------------------------------------
# Colors — computed once
# ---------------------------------------------------------------------------
BOLD=$(tput bold)
RESET=$(tput sgr0)
WHITE=$(tput setaf 7)
GREEN=$(tput setaf 2)
CYAN=$(tput setaf 26 2>/dev/null || tput setaf 6)

good()   { printf '%s%s%s%s%s' "$WHITE" "$BOLD" "$GREEN" "$1" "$RESET"; }
accent() { printf '%s%s%s%s%s' "$WHITE" "$BOLD" "$CYAN" "$1" "$RESET"; }

# ---------------------------------------------------------------------------
# Pre-flight: the app bundle must exist BEFORE we build anything,
# otherwise the whole package gets destroyed at the copy step
# ---------------------------------------------------------------------------
if [ ! -d "$APP_BUNDLE" ]; then
    echo
    echo "Error: app bundle not found:"
    echo "  $APP_BUNDLE"
    echo "Build the ${APP_TITLE}.app first, then run this script."
    exit 1
fi

# ---------------------------------------------------------------------------
# Clean previous build
# ---------------------------------------------------------------------------
echo
echo "$(accent 'Cleaning previous build...')"
find . -name '.DS_Store' -type f -delete
rm -rf ./Packages/OpenCore-Package ./Packages/OpenCore-Package.pkg "$EXPAND_DIR"
sleep 1
mkdir -p "$STAGE" "$EXPAND_DIR" "$INSTALLER_DIR"

# ---------------------------------------------------------------------------
# Package with pkgbuild
# ---------------------------------------------------------------------------
echo
echo "$(accent 'Creating package with pkgbuild...')"
pkgbuild \
    --root ./Packages/OC-EFI \
    --scripts ./Packages/ScriptEFI \
    --identifier "$PKG_ID" \
    --version "$VERSION" \
    --install-location /Private/tmp/EFIROOTDIR \
    "$STAGE/opencorePackage.pkg" || {
        echo "Error: pkgbuild failed!" >&2; exit 1; }
sleep 2

# ---------------------------------------------------------------------------
# Expand with pkgutil
# ---------------------------------------------------------------------------
echo
echo "$(accent 'Expanding package with pkgutil...')"
pkgutil --expand "$STAGE/opencorePackage.pkg" "$EXPAND_DIR/opencorePackage.pkg" || {
    echo "Error: pkgutil --expand failed!" >&2; exit 1; }
sleep 2

# ---------------------------------------------------------------------------
# Copy resources and distribution
# ---------------------------------------------------------------------------
echo
echo "$(accent 'Copying resources and distribution...')"
cp ./Packages/Distribution "$STAGE/Distribution.xml" || {
    echo "Error: ./Packages/Distribution not found!" >&2; exit 1; }
cp -Rp ./Packages/Resources "$STAGE/" || {
    echo "Error: ./Packages/Resources not found!" >&2; exit 1; }
sleep 2

# ---------------------------------------------------------------------------
# Final package with productbuild
# ---------------------------------------------------------------------------
echo
echo "$(accent 'Creating final package with productbuild...')"
productbuild \
    --distribution "$STAGE/Distribution.xml" \
    --package-path "$STAGE/" \
    --resources "$STAGE/Resources" \
    "$INSTALLER_DIR/OpenCore.pkg" || {
        echo "Error: productbuild failed!" >&2; exit 1; }
sleep 1
rm -rf ./Packages/OpenCore-Package

# ---------------------------------------------------------------------------
# Embed Installer into the app bundle
# ---------------------------------------------------------------------------
echo
echo "$(accent "Embedding Installer into ${APP_TITLE}.app...")"
cp -Rp "$INSTALLER_DIR" "$APP_BUNDLE/Contents/Resources" || {
    echo "Error: could not copy Installer into app bundle!" >&2; exit 1; }
sleep 1
rm -rf "$INSTALLER_DIR" "$EXPAND_DIR"

echo
echo " = = = = = = = = = = = = = = = = = = = = = = = = = ="
echo " $(good "${APP_TITLE}.app completed")"
echo " = = = = = = = = = = = = = = = = = = = = = = = = = ="
echo