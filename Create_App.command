
# HP-EliteBook-840-G4
# (c) Copyright 2022 chris1111, All Right Reserved.
# This will create a Apple Bundle App HP-EliteBook-840-G4
# Dependencies: osacompile
PARENTDIR=$(dirname "$0")
cd "$PARENTDIR"
find . -name '.DS_Store' -type f -delete


# Declare some VARS
APP_NAME="HP_EliteBook-840_G4.app"
SOURCE_SCRIPT="./Files_In/HP-EliteBook840_G4.applescript"

echo "= = = = = = = = = = = = = = = = = = = = = = = = =  "
echo "HP EliteBook 840_G4"
echo "= = = = = = = = = = = = = = = = = = = = = = = = =  "


# shell script Notifications
osascript -e 'display notification "Installer OpenCorePackage" with title "Create"  sound name "default"'

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

# Remove app
rm -rf "$APP_NAME"
rm -rf ./Packages/OpenCore-Package
Sleep 2

# Create the dir structure
/usr/bin/osacompile -o "$APP_NAME" -u "$SOURCE_SCRIPT"

# Copy Licenses
cp ./Files_In/LICENSE "$APP_NAME"/Contents/Resources/LICENSE.txt

# Copy description
cp -rp ./Files_In/description.rtfd "$APP_NAME"/Contents/Resources

# Copy Assets
cp -rp ./Files_In/Assets.car "$APP_NAME"/Contents/Resources

# Copy Installer
cp -rp ./OpenCore.pkg "$APP_NAME"/Contents/Resources/Scripts


Sleep 2

# Copy applet.icns
cp -rp ./Files_In/applet.icns "$APP_NAME"/Contents/Resources
cp -rp ./Files_In/applet.icns "$APP_NAME"/Contents/Resources/Scripts
# Zip app
Sleep 1
zip -r "$APP_NAME".zip "$APP_NAME"
Sleep 1
rm -rf "$APP_NAME"
unzip "$APP_NAME".zip
Sleep 1

# Remove app
rm -rf ./OpenCore.pkg
rm -rf ./"$APP_NAME".zip

Open $APP_NAME

echo " = = = = = = = = = = = = = = = = = = = = = = = = = 
HP-EliteBook-840-G4.app completed
= = = = = = = = = = = = = = = = = = = = = = = = =  "


