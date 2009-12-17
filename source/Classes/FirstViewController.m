//
//  FirstViewController.m
//  MobileHISLookUp
//
//  Created by Evan Lonergan on 11/29/09.
//  Copyright Phoenix 2009. All rights reserved.
//

#import "FirstViewController.h"


@implementation FirstViewController
@synthesize FirstNameField;
@synthesize MiddleNameField;
@synthesize LastNameField;
@synthesize SexField;
@synthesize DOBField;
@synthesize AddressField;
@synthesize CityField;
@synthesize StateField;
@synthesize ZipCodeField;
@synthesize PhoneField;
@synthesize EmailField;




- (IBAction)textFieldDoneEditing:(id)sender
{
	[sender resignFirstResponder];
}

- (IBAction)backgroundClick:(id)sender
{
	[FirstNameField resignFirstResponder];
	[MiddleNameField resignFirstResponder];
	[LastNameField resignFirstResponder];
	[SexField resignFirstResponder];
	[DOBField resignFirstResponder];
	[AddressField resignFirstResponder];
	[CityField resignFirstResponder];
	[StateField resignFirstResponder];
	[ZipCodeField resignFirstResponder];
	[PhoneField resignFirstResponder];
	[EmailField resignFirstResponder];
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
	return YES;
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