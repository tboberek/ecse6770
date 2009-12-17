//
//  Pharmacy.m
//  MobileHIS
//
//  Created by Evan Lonergan on 10/25/09.
//  Copyright 2009 Phoenix. All rights reserved.
//

#import "Pharmacy.h"


@implementation Pharmacy
@synthesize StartDate;
@synthesize EndDate;
@synthesize Drug;
@synthesize Dose;
@synthesize TimesPerDay;
@synthesize MinumumTimeBetweenDoses;
@synthesize TotalAmountPrescribed;
@synthesize PrescribedBy;
@synthesize Notes;
@synthesize Email;


- (IBAction)textFieldDoneEditing:(id)sender
{
	[sender resignFirstResponder];
}

- (IBAction)backgroundClick:(id)sender
{
	[StartDate resignFirstResponder];
	[EndDate resignFirstResponder];
	[Drug resignFirstResponder];
	[Dose resignFirstResponder];
	[TimesPerDay resignFirstResponder];
	[MinumumTimeBetweenDoses resignFirstResponder];
	[TotalAmountPrescribed resignFirstResponder];
	[PrescribedBy resignFirstResponder];
	[Notes resignFirstResponder];
	[Email resignFirstResponder];
	
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
