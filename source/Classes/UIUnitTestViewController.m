//
//  UIUnitTestViewController.m
//  MobileHIS
//
//  Created by T.J. Boberek on 11/30/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "UIUnitTestViewController.h"

#import "UTECSScenarioTests.h"


@implementation UIUnitTestViewController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
	// Create a title string for our results alert box
	NSString* resultTitle = @"ECS Unit Tests";
	
	// Create a string to display our results to the user
	NSMutableString* result = [NSMutableString stringWithCapacity: 0];
	
	// Set up the label for the 'Update Patient Vitals' usecase test
	[result appendString: @"'Update Patient Vitals': "];
	
	// Create a new scenario unit test object
	UTECSScenarioTests* unitTest = [[UTECSScenarioTests alloc] init];
	
	// Run the 'Update Patient Vitals' usecase test
	if ([unitTest updatePatientVitals])
	{
		[result appendString: @"Passed\n"];
	}
	else 
	{
		[result appendString: @"Failed\n"];
	}
	
	// Display the results of our tests the user
	UIAlertView* messageBox = [[UIAlertView alloc] initWithTitle:resultTitle 
														message:result delegate:self 
														cancelButtonTitle:@"OK" 
														otherButtonTitles:nil, nil];
	
	[messageBox show];
	[messageBox release];	

	[super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
	[labelResults release];
    [super dealloc];
}


@end
