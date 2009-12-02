//
//  UIUnitTestViewController.h
//  MobileHIS
//
//  Created by T.J. Boberek on 11/30/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIUnitTestViewController : UIViewController {
	
	// Connection to the one big label we use to display the results
	// of our unit tests
	IBOutlet UILabel* labelResults;

}

@end
