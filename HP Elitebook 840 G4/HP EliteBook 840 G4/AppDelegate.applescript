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
        set source to path to me as string
        set source to POSIX path of source & "Contents/Resources/Main.app"
        set source to quoted form of source
        do shell script "open " & source & "/"
    end Build:
    on cancel:sender
        quit
    end cancel:
    
    --- QUIT APP WHEN WINDOW IS CLOSED ---
    on applicationShouldTerminateAfterLastWindowClosed:sender
        return true
    end applicationShouldTerminateAfterLastWindowClosed:
    
    on applicationShouldTerminate:sender
        do shell script "killall Main; killall 'HP EliteBook 840 G4'"
        return current application's NSTerminateNow
    end applicationShouldTerminate:
    
    on applicationWillFinishLaunching:aNotification
        set pathToResources to (current application's class "NSBundle"'s mainBundle()'s resourcePath()) as string
    end applicationWillFinishLaunching:
    
    
end script
