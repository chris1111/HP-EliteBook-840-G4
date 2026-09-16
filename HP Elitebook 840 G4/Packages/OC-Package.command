#!/bin/bash
#
# Script for Installer OpenCorePackage
# (c) Copyright 2026 chris1111, All Rights Reserved.
# Builds OpenCore-Package.pkg with pkgbuild + productbuild
# Dependencies: pkgbuild, pkgutil, productbuild
#

set -u

# Always run from the script's own folder
cd "$(dirname "$0")" || exit 1

# ---------------------------------------------------------------------------
# Config — edit here only
# ---------------------------------------------------------------------------
PKG_ID="com.opencorePackage.OpenCorePackage.pkg"
STAGE="./OpenCore-Package/BUILD-PACKAGE"
EXPAND_DIR="/tmp/PackageDIR"
OUT_PKG="./OpenCore-Package.pkg"

# ---------------------------------------------------------------------------
# Colors — computed once
# ---------------------------------------------------------------------------
BOLD=$(tput bold)
RESET=$(tput sgr0)
WHITE=$(tput setaf 7)
GREEN=$(tput setaf 2)
CYAN=$(tput setaf 26 2>/dev/null || tput setaf 6)

accent() { printf '%s%s%s%s%s' "$WHITE" "$BOLD" "$CYAN" "$1" "$RESET"; }
good()   { printf '%s%s%s%s%s' "$WHITE" "$BOLD" "$GREEN" "$1" "$RESET"; }

banner() { echo " = = = = = = = = = = = = = = = = = = = = = = = = = ="; }
fail()   { echo "Error: $1" >&2; exit 1; }

# ---------------------------------------------------------------------------
# Pre-flight: inputs must exist BEFORE we start
# (./OpenCore-Package and /tmp/PackageDIR are created by the script,
#  so they are NOT listed — mkdir below handles them)
# ---------------------------------------------------------------------------
for f in \
    "./OC-EFI" \
    "./ScriptEFI" \
    "./Distribution" \
    "./Resources"; do
    [ -e "$f" ] || fail "required file not found: $f"
done

# ---------------------------------------------------------------------------
# Notifications
# ---------------------------------------------------------------------------
osascript -e 'display notification "Installer OpenCorePackage" with title "Create" sound name "default"'

# ---------------------------------------------------------------------------
# Clean previous build  (PackageDIR wiped here only, survives at the end)
# ---------------------------------------------------------------------------
echo "$(accent 'Cleaning previous build...')"
rm -rf ./OpenCore-Package "$OUT_PKG" "$EXPAND_DIR"
sleep 1
mkdir -p "$STAGE" "$EXPAND_DIR"

# ---------------------------------------------------------------------------
# Create package with pkgbuild
# ---------------------------------------------------------------------------
echo
echo "$(accent 'Building opencorePackage.pkg...')"
pkgbuild --root ./OC-EFI --scripts ./ScriptEFI --identifier "$PKG_ID" \
    --version 1.0 --install-location /Private/tmp/EFIROOTDIR \
    "$STAGE/opencorePackage.pkg" || fail "pkgbuild failed"
sleep 2

# ---------------------------------------------------------------------------
# Expand with pkgutil  (PackageDIR filled here, left alive at the end)
# ---------------------------------------------------------------------------
echo
echo "$(accent 'Expanding package with pkgutil...')"
pkgutil --expand "$STAGE/opencorePackage.pkg" "$EXPAND_DIR/opencorePackage.pkg" \
    || fail "pkgutil --expand failed"
sleep 3

# ---------------------------------------------------------------------------
# Copy resources and distribution
# ---------------------------------------------------------------------------
echo
echo "$(accent 'Copying resources and distribution...')"
cp -r ./Distribution "$STAGE/Distribution.xml" || fail "could not copy Distribution"
cp -Rp ./Resources "$STAGE/" || fail "could not copy Resources"

echo
banner
echo " $(accent 'Create final Package with Productbuild')"
banner
sleep 3

# ---------------------------------------------------------------------------
# Create final Package with Productbuild
# ---------------------------------------------------------------------------
productbuild \
    --distribution "$STAGE/Distribution.xml" \
    --package-path "$STAGE/" \
    --resources "$STAGE/Resources" \
    "$OUT_PKG" || fail "productbuild failed"

rm -rf ./OpenCore-Package

echo
banner
echo " $(good 'OpenCore-Package.pkg completed')"
banner
echo