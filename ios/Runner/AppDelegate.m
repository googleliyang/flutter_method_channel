#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
    
    FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;

    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"demo.gawkat.com/info"
                                     binaryMessenger:controller
                                    ];


    [channel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
        NSString *from = call.arguments[@"from"];

        if([@"getMessage" isEqualToString:call.method]) {
            NSString *messgae = @"IOS says greetings";
            NSString *returnMessage = [messgae stringByAppendingString:from];
            result(returnMessage);
        }
    }];
    

    
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
