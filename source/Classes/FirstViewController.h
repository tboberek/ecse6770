//
//  FirstViewController.h
//  MobileHISLookUp
//
//  Created by Evan Lonergan on 11/29/09.
//  Copyright Phoenix 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController {
	IBOutlet	UITextField		*FirstNameField;
	IBOutlet	UITextField		*MiddleNameField;
	IBOutlet	UITextField		*LastNameField;
	IBOutlet	UITextField		*SexField;
	IBOutlet	UITextField		*DOBField;
	IBOutlet	UITextField		*AddressField;
	IBOutlet	UITextField		*CityField;
	IBOutlet	UITextField		*StateField;
	IBOutlet	UITextField		*ZipCodeField;
	IBOutlet	UITextField		*PhoneField;
	IBOutlet	UITextField		*EmailField;
	
	
}

@property (nonatomic, retain) UITextField *FirstNameField;
@property (nonatomic, retain) UITextField *MiddleNameField;
@property (nonatomic, retain) UITextField *LastNameField;
@property (nonatomic, retain) UITextField *SexField;
@property (nonatomic, retain) UITextField *DOBField;
@property (nonatomic, retain) UITextField *AddressField;
@property (nonatomic, retain) UITextField *CityField;
@property (nonatomic, retain) UITextField *StateField;
@property (nonatomic, retain) UITextField *ZipCodeField;
@property (nonatomic, retain) UITextField *PhoneField;
@property (nonatomic, retain) UITextField *EmailField;

- (IBAction)textFieldDoneEditing:(id)sender;
- (IBAction)backgroundClick:(id)sender;


@end
