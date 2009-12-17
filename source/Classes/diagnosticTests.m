//
//  diagnosticTests.m
//  MobileHIS
//
//  Created by Evan Lonergan on 10/25/09.
//  Copyright 2009 Phoenix. All rights reserved.
//

#import "diagnosticTests.h"


@implementation diagnosticTests
@synthesize Date;
@synthesize Test;
@synthesize TestingCenter;
@synthesize Address;
@synthesize City;
@synthesize State;
@synthesize ZipCode;



- (IBAction)textFieldDoneEditing:(id)sender
{
	[sender resignFirstResponder];
}

- (IBAction)backgroundClick:(id)sender
{
	[Date resignFirstResponder];
	[Test resignFirstResponder];
	[TestingCenter resignFirstResponder];
	[Address resignFirstResponder];
	[City resignFirstResponder];
	[State resignFirstResponder];
	[ZipCode resignFirstResponder];
	
	
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
