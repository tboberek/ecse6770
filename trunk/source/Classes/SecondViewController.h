//
//  SecondViewController.h
//  MobileHISLookUp
//
//  Created by Evan Lonergan on 12/6/09.
//  Copyright 2009 Phoenix. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SecondViewController : UIViewController 

<UITableViewDelegate, UITableViewDataSource> {
	NSArray *listData;
	UISearchBar *search;
	
}

@property (nonatomic, retain) NSArray *listData;

@end
