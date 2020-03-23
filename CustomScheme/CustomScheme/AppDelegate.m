//
//  AppDelegate.m
//  CustomScheme
//


#import "AppDelegate.h"

@interface AppDelegate ()

@property(weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate


- (void)applicationWillFinishLaunching:(NSNotification *)aNotification
{
    // Register ourselves as a URL handler for this URL
    [[NSAppleEventManager sharedAppleEventManager] setEventHandler:self andSelector:@selector(handleURLEvent:withReplyEvent:) forEventClass:kInternetEventClass andEventID:kAEGetURL];
}


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (void) msgBox:(NSString*) message
{
    NSAlert *alert = [[NSAlert alloc] init];
    [alert setMessageText:message];
    [alert addButtonWithTitle:@"OK"];
    [alert runModal];
}

- (void)handleURLEvent:(NSAppleEventDescriptor *)theEvent withReplyEvent:(NSAppleEventDescriptor *)replyEvent
{
    NSString *path = [[[theEvent paramDescriptorForKeyword:keyDirectObject] stringValue] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [self msgBox:[NSString stringWithFormat:@"Hive URL: %@", path]];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification
{
/*  Terminal command to reset all custom schemes is:

 /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -domain user

 Google Chrome policy // not confirmed to work
 External​Protocol​Dialog​Show​Always​Open​Checkbox
 Show an "Always open" checkbox in external protocol dialog.

 defaults write com.google.Chrome External​Protocol​Dialog​Show​Always​Open​Checkbox -bool true
 */
 
 //Another way to avoid extra clicks is White-listing URLs:
// defaults write com.google.Chrome URLWhitelist -array 'myprotocol1://*' 'myprotocol2://*' 'myprotocol3://*'
    
 //   [self msgBox:@"applicationWillTerminate"];
 //   [[NSAppleEventManager sharedAppleEventManager] removeEventHandlerForEventClass:kInternetEventClass andEventID:kAEGetURL];
}
@end
