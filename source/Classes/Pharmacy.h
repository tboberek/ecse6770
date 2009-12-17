//
//  Pharmacy.h
//  MobileHIS
//
//  Created by Evan Lonergan on 10/25/09.
//  Copyright 2009 Phoenix. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Pharmacy : UIViewController {
	IBOutlet	UITextField		*StartDate;
	IBOutlet	UITextField		*EndDate;
	IBOutlet	UITextField		*Drug;
	IBOutlet	UITextField		*Dose;
	IBOutlet	UITextField		*TimesPerDay;
	IBOutlet	UITextField		*MinumumTimeBetweenDoses;
	IBOutlet	UITextField		*TotalAmountPrescribed;
	IBOutlet	UITextField		*PrescribedBy;
	IBOutlet	UITextField		*Notes;
	IBOutlet	UITextField		*Email;
	
	
}

@property (nonatomic, retain) UITextField *StartDate;
@property (nonatomic, retain) UITextField *EndDate;
@property (nonatomic, retain) UITextField *Drug;
@property (nonatomic, retain) UITextField *Dose;
@property (nonatomic, retain) UITextField *TimesPerDay;
@property (nonatomic, retain) UITextField *MinumumTimeBetweenDoses;
@property (nonatomic, retain) UITextField *TotalAmountPrescribed;
@property (nonatomic, retain) UITextField *PrescribedBy;
@property (nonatomic, retain) UITextField *Notes;
@property (nonatomic, retain) UITextField *Email;


- (IBAction)textFieldDoneEditing:(id)sender;
- (IBAction)backgroundClick:(id)sender;

	
	


@end
