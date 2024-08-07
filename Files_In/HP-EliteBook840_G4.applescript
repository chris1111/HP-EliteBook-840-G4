# Applescript create by chris1111
# HP EliteBook 840 G4 .app Copyright (c) 2022, 2024 chris1111 All rights reserved.
# No right on OpenCore EFI Bootloader


set theAction to button returned of (display dialog "
Welcome HP EliteBook 840 G4 Installer
Create ➤ USB Install Media 
Using OpenCore Package" with icon note buttons {"Quit", "Create ➤ USB Install Media", "OpenCore Package"} cancel button "Quit" default button {"Create ➤ USB Install Media"})
if theAction = "OpenCore Package" then
	display notification "Starting OpenCore Package!"
	delay 1
	set source to path to me as string
	set source to POSIX path of source & "Contents/Resources/Scripts/OpenCore.pkg"
	set source to quoted form of source
	do shell script "open " & source & "/"
end if
--If Create ➤ Create ➤ USB Install Media
if theAction = "Create ➤ USB Install Media" then
	set theAction to button returned of (display dialog "
Welcome HP EliteBook 840 G4 Installer
This installer allows you
to create a bootable USB Install media of macOS Big Sur 11 to macOS Sequoia 15
You need 16 Gig USB or Spare SSD
You need Install macOS from the Mac App Store
" with icon note buttons {"Quit", "USB Install Media"} cancel button "Quit" default button {"USB Install Media"})
	delay 1
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
		set Volumepath to paragraphs of (do shell script "ls /Volumes")
		set Diskpath to choose from list Volumepath with prompt "
To continue, select the volume you want to use then press the OK button

OpenCore will be installed on the volume." OK button name "OK" with multiple selections allowed
		if Diskpath is false then
			display dialog "Quit Installer " with icon 0 buttons {"EXIT"} default button {"EXIT"}
			return
			
			return (POSIX path of Diskpath)
		end if
		try
			
			delay 1
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
				(display dialog "Please confirm your choice?
Create Install Media from --> " & (InstallOSX as text) & "
Install to --> " & (Diskpath as text) with icon note buttons {"Cancel", "OK"} cancel button "Cancel" default button "OK")
				
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
				
				set progress additional description to "Installation in Progress 30%
Installing Opencore to ➤  " & Diskpath & ""
				delay 2
				set source to path to me as string
				set source to POSIX path of source & "Contents/Resources/Scripts/OpenCore.pkg"
				set source to quoted form of source
				do shell script ¬
					"installer -pkg  " & source & " -target \"" & Diskpath & "\"" with administrator privileges
				set progress completed steps to 3
				
				set progress additional description to "Install USB Media OK 40%"
				delay 2
				set progress completed steps to 4
				
				set progress additional description to "Installation in Progress 50%"
				delay 2
				set progress completed steps to 5
				
				set progress additional description to "Install in Progress Wait . . . 60%
Installing macOS  to the disk " & Diskpath & ""
				delay 2
				--display dialog cmd
				set cmd to "sudo \"" & OSXInstaller & "Contents/Resources/createinstallmedia\" --volume /Volumes/\"" & Diskpath & "\" --nointeraction"
				do shell script cmd with administrator privileges
				set progress completed steps to 6
				
				set progress additional description to "Install USB Media OK 80%"
				delay 2
				set progress completed steps to 7
				
				set progress additional description to "Installation almost done 90%"
				delay 2
				set progress completed steps to 8
				set progress additional description to "
USB Install Media  ➤ 100%
Done ➤  " & Diskpath & ""
				delay 3
			end if
		end try
	end if
end if
