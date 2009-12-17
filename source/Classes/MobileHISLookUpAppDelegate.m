//
//  MobileHISLookUpAppDelegate.m
//  MobileHISLookUp
//
//  Created by Evan Lonergan on 11/29/09.
//  Copyright Phoenix 2009. All rights reserved.
//

#import "MobileHISLookUpAppDelegate.h"


@implementation MobileHISLookUpAppDelegate

@synthesize window;
@synthesize tabBarController;
@synthesize scrollView;

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
    // Add the tab bar controller's current view as a subview of the window
    [window addSubview:tabBarController.view];
	
}


/*
// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
}
*/

/*
// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {
}
*/


- (void)dealloc {
    [tabBarController release];
    [window release];
	[scrollView release];
    [super dealloc];
}

@end

