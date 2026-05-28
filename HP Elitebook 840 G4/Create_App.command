# HP-EliteBook-840-G4
# (c) Copyright 2026 chris1111, All Right Reserved.
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
APP_NAME="Main.app"
SOURCE_SCRIPT="./Helper/Main.applescript"

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

# Create the dir structure
dir=$(cd $(dirname "$1"); pwd)
/usr/bin/osacompile -o "$APP_NAME" "$SOURCE_SCRIPT"

# Copy Licenses
cp ./Helper/LICENSE "$APP_NAME"/Contents/Resources/LICENSE.txt

# Copy Assets
cp -rp ./Helper/Assets.car "$APP_NAME"/Contents/Resources

# Copy Installer, applet
cp -rp ./OpenCore.pkg "$APP_NAME"/Contents/Resources
cp -rp ./Helper/applet.icns "$APP_NAME"/Contents/Resources
cp -rp ./Helper/applet.icns "$APP_NAME"/Contents/Resources/Scripts

Sleep 1
# Use Startup screen, LSUIElement
defaults write "$dir/$APP_NAME"/Contents/Info LSUIElement -bool true
defaults write "$dir/$APP_NAME"/Contents/Info CFBundleExecutable -string Main
mv "$dir/$APP_NAME"/Contents/MacOS/applet "$dir/$APP_NAME"/Contents/MacOS/Main

# Zip app
Sleep 1
zip -r "$APP_NAME".zip "$APP_NAME"
Sleep 1
rm -rf "$APP_NAME"
unzip "$APP_NAME".zip
Sleep 1
cp -rp "$APP_NAME" ./build/Release/HP\ EliteBook\ 840\ G4.app/Contents/Resources
Sleep 1
# Remove app
rm -rf ./OpenCore.pkg
rm -rf ./"$APP_NAME".zip
rm -rf ./"$APP_NAME"


echo " = = = = = = = = = = = = = = = = = = = = = = = = = 
HP EliteBook 840 G4.app completed
= = = = = = = = = = = = = = = = = = = = = = = = =  "



