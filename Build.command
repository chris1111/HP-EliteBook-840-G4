PARENTDIR=$(dirname "$0")
cd "$PARENTDIR"

cd ./"HP Elitebook 840 G4"
xcodebuild -project "HP EliteBook 840 G4.xcodeproj" -alltargets -configuration Release
Sleep 3

./Create_App.command

Open ./build/Release


