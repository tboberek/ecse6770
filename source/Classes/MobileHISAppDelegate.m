//
//  MobileHISAppDelegate.m
//  MobileHIS
//
//  Created by Evan Lonergan on 10/25/09.
//  Copyright Phoenix 2009. All rights reserved.
//

#import "MobileHISAppDelegate.h"

@implementation MobileHISAppDelegate

@synthesize window;
@synthesize rootController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window addSubview:rootController.view];
	[window makeKeyAndVisible];
}


- (void)dealloc {
	[rootController release];
    [window release];
    [super dealloc];
}


@end
