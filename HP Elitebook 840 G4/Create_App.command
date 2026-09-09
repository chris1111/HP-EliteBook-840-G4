# HP-EliteBook-840-G4
# (c) Copyright 2026 chris1111, All Right Reserved.
# This will create a Apple Bundle App HP-EliteBook-840-G4
# Dependencies: osacompile
PARENTDIR=$(dirname "$0")
cd "$PARENTDIR"
# Vars
apptitle="HP EliteBook 840 G4"
version="1.0"
find . -name '.DS_Store' -type f -delete

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
Sleep 2
mkdir -p ./Installer

echo "
= = = = = = = = = = = = = = = = = = = = = = = = =
Create finale Package with Productbuild "
Sleep 3
# Create finale Package with Productbuild
productbuild --distribution "./Packages/OpenCore-Package/BUILD-PACKAGE/Distribution.xml"  \
--package-path "./Packages/OpenCore-Package/BUILD-PACKAGE/" \
--resources "./Packages/OpenCore-Package/BUILD-PACKAGE/Resources" \
"./Installer/OpenCore.pkg"
rm -rf ./Packages/OpenCore-Package
Sleep 2
cp -rp ./Installer ./build/Release/HP\ EliteBook\ 840\ G4.app/Contents/Resources
Sleep 1
rm -rf ./Installer

echo " = = = = = = = = = = = = = = = = = = = = = = = = = 
HP EliteBook 840 G4.app completed
= = = = = = = = = = = = = = = = = = = = = = = = =  "



