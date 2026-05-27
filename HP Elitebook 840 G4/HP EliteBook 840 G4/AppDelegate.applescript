--
--  AppDelegate.applescript
--  HP EliteBook 840 G4
--  Created by chris on 2024-02-24, Update 2026-05-26.
--
--

script AppDelegate
	property spinner : missing value -- connected to the progress bar
	property animated : false -- keeps track of progress bar animation
	property pathToResources : "NSString"
	
	on Build:sender -- toggle animation
		if animated then
			spinner's stopAnimation:me -- one way
			set animated to false
		else
			tell spinner to startAnimation:me -- another way
			set animated to true
		end if
		display alert "Program Start!" buttons ("OK") giving up after 3
		delay 1
		set theAction to button returned of (display dialog "
Welcome HP EliteBook 840 G4 Installer
Create ➤ USB Install Media
Using OpenCore Package" with icon note buttons {"Quit", "Create ➤ USB Install Media", "OpenCore Package"} default button {"Create ➤ USB Install Media"})
		
		if theAction = "Quit" then
			do shell script "killall 'HP EliteBook 840 G4'"
		end if
		
		if theAction = "OpenCore Package" then
			display notification "Starting OpenCore Package!"
			delay 1
			set source to path to me as string
			set source to POSIX path of source & "Contents/Resources/OpenCore.pkg"
			set source to quoted form of source
			set alertResult to display alert "Starting OpenCore.pkg" message "Open Package." buttons {"OK"} default button "OK" giving up after 3
			do shell script "open " & source & "/"
			delay 1
			do shell script "killall 'HP EliteBook 840 G4'"
		end if
		--If Create ➤ Create ➤ USB Install Media
		if theAction = "Create ➤ USB Install Media" then
			set theAction to button returned of (display dialog "
Welcome HP EliteBook 840 G4 Installer
This installer allows you
to create a bootable USB Install media of macOS Big Sur 11 to macOS Tahoe 26
You need 16 Gig USB or Spare SSD
NOTE: For macOS Tahoe 26 you need a USB flash drive of 25 Gig or more
You need Install macOS from the Mac App Store
" with icon note buttons {"Quit", "USB Install Media"} default button {"USB Install Media"})
			delay 1
			if theAction = "Quit" then
				do shell script "killall 'HP EliteBook 840 G4'"
			end if
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
					delay 1
					do shell script "killall 'HP EliteBook 840 G4'"
					return
					
					return (POSIX path of Diskpath)
				end if
				try
					
					delay 1
					--If Continue
					set theAction to button returned of (display dialog "

Choose your Install macOS.app" with icon note buttons {"Quit", "Big Sur 11 to Tahoe 26"} default button {"Big Sur 11 to Tahoe 26"})
					delay 1
					if theAction = "Quit" then
						do shell script "killall 'HP EliteBook 840 G4'"
					end if
					delay 1
					if theAction = "Big Sur 11 to Tahoe 26" then
						--Big Sur 11 to Tahoe 26
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
						set progress additional description to "Installation in Progress"
						delay 2
						set progress additional description to "Installation in Progress"
						delay 2
						set progress additional description to "Installation in Progress
Installing Opencore to ➤  " & Diskpath & ""
						display alert "Installing OpenCore!
macOS will be install to the Volumes. Wait. . ." buttons ("OK") giving up after 3
						delay 2
						set source to path to me as string
						set source to POSIX path of source & "Contents/Resources/OpenCore.pkg"
						set source to quoted form of source
						do shell script ¬
							"installer -pkg  " & source & " -target \"" & Diskpath & "\"" with administrator privileges
						
						tell application "HP EliteBook 840 G4"
							activate
						end tell
						
						set progress additional description to "Install USB Media OK"
						delay 2
						set progress additional description to "Installation in Progress"
						delay 2
						set progress additional description to "Install in Progress Wait . . .
Installing macOS  to the disk " & Diskpath & ""
						delay 2
						--display dialog cmd
						set cmd to "sudo \"" & OSXInstaller & "Contents/Resources/createinstallmedia\" --volume /Volumes/\"" & Diskpath & "\" --nointeraction"
						do shell script cmd with administrator privileges
						
						tell application "HP EliteBook 840 G4"
							activate
						end tell
						
						set progress additional description to "Install USB Media OK"
						delay 2
						set progress additional description to "Installation almost done"
						delay 2
						
						tell application "HP EliteBook 840 G4"
							activate
						end tell
						
						set progress additional description to "
USB Install Media Done ➤  " & Diskpath & ""
						
						tell application "HP EliteBook 840 G4"
							activate
						end tell
						
						delay 3
						--Not display icon in opencore
						do shell script " rm -rf /Volumes/'Install macOS Tahoe'/.VolumeIcon.icns"
						do shell script " rm -rf /Volumes/'Install macOS Tahoe Beta'/.VolumeIcon.icns"
						do shell script " rm -rf /Volumes/'Install macOS Sequoia'/.VolumeIcon.icns"
						do shell script " rm -rf /Volumes/'Install macOS Sequoia Beta'/.VolumeIcon.icns"
						do shell script " rm -rf /Volumes/'Install macOS Sonoma'/.VolumeIcon.icns"
						do shell script " rm -rf /Volumes/'Install macOS Sonoma Beta'/.VolumeIcon.icns"
						do shell script " rm -rf /Volumes/'Install macOS Ventura'/.VolumeIcon.icns"
						do shell script " rm -rf /Volumes/'Install macOS Ventura Beta'/.VolumeIcon.icns"
						do shell script " rm -rf /Volumes/'Install macOS Monterey'/.VolumeIcon.icns"
						do shell script " rm -rf /Volumes/'Install macOS Monterey Beta'/.VolumeIcon.icns"
						do shell script " rm -rf /Volumes/'Install macOS Big Sur'/.VolumeIcon.icns"
						do shell script " rm -rf /Volumes/'Install macOS Big Sur Beta'/.VolumeIcon.icns"
						delay 1
						display alert "Install MacOS completed!!
macOS is install to the Volumes." buttons ("Done") giving up after 3
						delay 0.5
						
						do shell script "killall 'HP EliteBook 840 G4'"
					end if
				end try
			end if
		end if
	end Build:
	on cancel:sender
		quit
	end cancel:
	
	--- QUIT APP WHEN WINDOW IS CLOSED ---
	on applicationShouldTerminateAfterLastWindowClosed:sender
		return true
	end applicationShouldTerminateAfterLastWindowClosed:
	
	on applicationShouldTerminate:sender
		do shell script ("killall 'HP EliteBook 840 G4'")
		return current application's NSTerminateNow
	end applicationShouldTerminate:
	
	on applicationWillFinishLaunching:aNotification
		set pathToResources to (current application's class "NSBundle"'s mainBundle()'s resourcePath()) as string
	end applicationWillFinishLaunching:
	
	
	
end script
