# Applescript create by chris1111
# HP EliteBook 840 G4 .app Copyright (c) 2022, 2023 chris1111 All rights reserved.
# No right on OpenCore EFI Bootloader


set theAction to button returned of (display dialog "
Welcome HP EliteBook 840 G4 Installer
Create ➤ Install SSD or USB Install Media 
Using OpenCore Package" with icon note buttons {"Quit", "Create ➤ Install SSD / USB Media", "OpenCore Package"} cancel button "Quit" default button {"Create ➤ Install SSD / USB Media"})
if theAction = "OpenCore Package" then
	display notification "Starting OpenCore Package!"
	delay 1
	set source to path to me as string
	set source to POSIX path of source & "Contents/Resources/Scripts/OpenCore.pkg"
	set source to quoted form of source
	do shell script "open " & source & "/"
end if
--If Create ➤ Install SSD / USB Media
if theAction = "Create ➤ Install SSD / USB Media" then
	set theAction to button returned of (display dialog "
Welcome HP EliteBook 840 G4 Installer
This installer allows you
to create a bootable SSD or a USB Install media of macOS Big Sur 11 to macOS Sonoma 14
You need 16 Gig USB or Spare SSD
You need Install macOS from the Mac App Store
" with icon note buttons {"Quit", "Create Install SSD", "USB Install Media"} cancel button "Quit" default button {"USB Install Media"})
	delay 1
	if theAction = "Create Install SSD" then
		display dialog "
Before selecting OK button you have to close all terminal windows if any are open.
*****************************" with icon note buttons {"Quit", "OK"} cancel button "Quit" default button {"OK"}
		
		set the_command to quoted form of POSIX path of (path to resource "Create-Install-SSD" in directory "Scripts")
		tell application "Terminal"
			activate
		end tell
		
		tell application "Terminal"
			quit
			
		end tell
		delay 1
		tell application "Terminal"
			activate
			do script the_command in window 1
			
		end tell
	end if
	if theAction = "USB Install Media" then
		display dialog "
Format your USB Drive with Disk Utility 
in the format Mac OS Extended (Journaled) 
GUID Partition Map
*****************************
You must quit Disk Utility to continue" with icon note buttons {"Quit", "Continue"} cancel button "Quit" default button {"Continue"}
		do shell script "open -F -a 'Disk Utility'"
		delay 1
		tell application "Disk Utility"
			activate
		end tell
		
		repeat
			if application "Disk Utility" is not running then exit repeat
			
		end repeat
		
		activate me
		set all to paragraphs of (do shell script "ls /Volumes")
		set w to choose from list all with prompt " 
To continue, select the volume you want to use then press the OK button

OpenCore will be installed and the volume will be renamed HP-840-USB" OK button name "OK" with multiple selections allowed
		if w is false then
			display dialog "Quit Installer " with icon 0 buttons {"EXIT"} default button {"EXIT"}
			return
		end if
		try
			
			repeat with teil in w
				do shell script "diskutil `diskutil list | awk '/ " & teil & "  / {print $NF}'`"
			end repeat
		end try
		delay 1
		set source to path to me as string
		set source to POSIX path of source & "Contents/Resources/Scripts/OpenCore.pkg"
		set source to quoted form of source
		do shell script ¬
			"installer -pkg  " & source & " -target \"" & w & "\"" with administrator privileges
		delay 1
		set theName to "HP-840-USB"
		tell application "Finder"
			set name of disk w to theName
		end tell
		do shell script "chflags hidden /Volumes/HP-840-USB/Private"
		do shell script "chflags hidden /Volumes/HP-840-USB/Library"
		--If Continue
		
		set theAction to button returned of (display dialog "

Choose your Install macOS.app" with icon note buttons {"Quit", "Big Sur 11 to Sonoma 14"} cancel button "Quit" default button {"Big Sur 11 to Sonoma 14"})
		if theAction = "Big Sur 11 to Sonoma 14" then
			--Big Sur 11 to Sonoma 14
			display dialog "
Choose the location of your Install macOS.app" with icon note buttons {"Quit", "Continue"} cancel button "Quit" default button {"Continue"}
			
			set InstallOSX to choose file of type {"XLSX", "APPL"} default location (path to applications folder) with prompt "Choose your install macOS.app"
			set OSXInstaller to POSIX path of InstallOSX
			
			delay 2
			
			set progress description to "
USB Install Media
======================================
Installation time of 15 to 20 min on a standard USB key
5 minutes on Ext DISK /HD/SSD
======================================
"
			
			set progress total steps to 8
			
			set progress additional description to "Installation in Progress 10%"
			delay 2
			set progress completed steps to 1
			
			set progress additional description to "Installation in Progress 20%"
			delay 2
			set progress completed steps to 2
			
			set progress additional description to "Installation in Progress 30%"
			delay 2
			set progress completed steps to 3
			
			set progress additional description to "Install USB Media OK 40%"
			delay 2
			set progress completed steps to 4
			
			set progress additional description to "Installation in Progress 50%"
			delay 1
			set progress completed steps to 5
			
			set progress additional description to "Installation in Progress 60%"
			delay 1
			set progress completed steps to 6
			
			set progress additional description to "Installation Volumes ➤ HP-840-USB . . 70%  
Wait!"
			delay 1
			--display dialog cmd
			set cmd to "sudo \"" & OSXInstaller & "Contents/Resources/createinstallmedia\" --volume /Volumes/HP-840-USB --nointeraction "
			do shell script cmd with administrator privileges
			set progress completed steps to 6
			
			set progress additional description to "Installation almost done 90%"
			delay 2
			set progress completed steps to 7
			set progress additional description to "
USB Install Media  ➤ 100%
Done. "
			delay 1
		end if
	end if
end if
