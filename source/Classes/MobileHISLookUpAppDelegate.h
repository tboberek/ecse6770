//
//  MobileHISLookUpAppDelegate.h
//  MobileHISLookUp
//
//  Created by Evan Lonergan on 11/29/09.
//  Copyright Phoenix 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MobileHISLookUpAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
    UITabBarController *tabBarController;
	UIScrollView *scrollView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;

@end
