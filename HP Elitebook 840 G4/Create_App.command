# HP-EliteBook-840-G4
# (c) Copyright 2024 chris1111, All Right Reserved.
# This will create a Apple Bundle App HP-EliteBook-840-G4
# Dependencies: osacompile
PARENTDIR=$(dirname "$0")
cd "$PARENTDIR"
# Vars
apptitle="HP EliteBook 840 G4"
version="1.0"
# Set Icon directory and file
export ICNS=$(dirname "${0}")
iconfile="$ICNS/AppIcon.icns"
find . -name '.DS_Store' -type f -delete

# Declare some VARS
APP_NAME="HP EliteBook 840 G4.app"

# Delete build if exist
rm -rf ./Packages/OpenCore-Package
rm -rf ./Packages/OpenCore-Package
rm -rf /tmp/PackageDIR
rm -rf ./Packages/OpenCore-Package.pkg
Sleep 1
mkdir -p ./Packages/OpenCore-Package/BUILD-PACKAGE
mkdir -p /tmp/PackageDIR
# Create Packages with pkgbuild
pkgbuild --root ./Packages/OC-EFI --scripts ./Packages/ScriptEFI --identifier com.opencorePackage.OpenCorePackage.pkg --version 1.0 --install-location /Private/tmp/EFIROOTDIR ./Packages/OpenCore-Package/BUILD-PACKAGE/opencorePackage.pkg

Sleep 2
# Expend the Packages with pkgutil
pkgutil --expand ./Packages/OpenCore-Package/BUILD-PACKAGE/opencorePackage.pkg /tmp/PackageDIR/opencorePackage.pkg

Sleep 3
# Copy resources and distribution
cp -r ./Packages/Distribution ./Packages/OpenCore-Package/BUILD-PACKAGE/Distribution.xml
cp -rp ./Packages/Resources ./Packages/OpenCore-Package/BUILD-PACKAGE/

echo "
= = = = = = = = = = = = = = = = = = = = = = = = =
Create finale Package with Productbuild "
Sleep 3
# Create finale Package with Productbuild
productbuild --distribution "./Packages/OpenCore-Package/BUILD-PACKAGE/Distribution.xml"  \
--package-path "./Packages/OpenCore-Package/BUILD-PACKAGE/" \
--resources "./Packages/OpenCore-Package/BUILD-PACKAGE/Resources" \
"./OpenCore.pkg"
rm -rf ./Packages/OpenCore-Package
Sleep 2

# Copy helper files
cp -rp ./OpenCore.pkg ./build/Release/"$APP_NAME"/Contents/Resources
cp -rp ./Helper/applet.icns ./build/Release/"$APP_NAME"/Contents/Resources
cp -rp ./Helper/LICENSE ./build/Release/"$APP_NAME"/Contents/Resources

# Delete the PKG
rm -rf ./OpenCore.pkg
