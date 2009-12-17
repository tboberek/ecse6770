//
//  diagnosticTests.h
//  MobileHIS
//
//  Created by Evan Lonergan on 10/25/09.
//  Copyright 2009 Phoenix. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface diagnosticTests : UIViewController {

	IBOutlet	UITextField		*Date;
	IBOutlet	UITextField		*Test;
	IBOutlet	UITextField		*TestingCenter;
	IBOutlet	UITextField		*Address;
	IBOutlet	UITextField		*City;
	IBOutlet	UITextField		*State;
	IBOutlet	UITextField		*ZipCode;
		
	
}

@property (nonatomic, retain) UITextField *Date;
@property (nonatomic, retain) UITextField *Test;
@property (nonatomic, retain) UITextField *TestingCenter;
@property (nonatomic, retain) UITextField *Address;
@property (nonatomic, retain) UITextField *City;
@property (nonatomic, retain) UITextField *State;
@property (nonatomic, retain) UITextField *ZipCode;




- (IBAction)textFieldDoneEditing:(id)sender;
- (IBAction)backgroundClick:(id)sender;

@end
