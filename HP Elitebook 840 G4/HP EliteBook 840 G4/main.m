//
//  main.m
//  HP EliteBook 840 G4  /  Install Media OC
//
//  Created by chris on 2024-02-24.
//  Updated 2026-05-26.
//

#import <Cocoa/Cocoa.h>
#import <AppleScriptObjC/AppleScriptObjC.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Load AppleScriptObjC bridge scripts BEFORE the app runs
        [[NSBundle mainBundle] loadAppleScriptObjectiveCScripts];
        
        // Standard launch: loads MainMenu.nib, connects the delegate,
        // starts the event loop (our NSTimer lives in that loop)
        return NSApplicationMain(argc, argv);
    }
}