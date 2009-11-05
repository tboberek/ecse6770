//
//  MobileHISAppDelegate.h
//  MobileHIS
//
//  Created by Evan Lonergan on 10/25/09.
//  Copyright Phoenix 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MobileHISAppDelegate : NSObject <UIApplicationDelegate> {
    IBOutlet UIWindow *window;
	IBOutlet UITabBarController *rootController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) UITabBarController *rootController;

@end

