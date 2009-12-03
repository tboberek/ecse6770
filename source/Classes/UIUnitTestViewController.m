//
//  UIUnitTestViewController.m
//  MobileHIS
//
//  Created by T.J. Boberek on 11/30/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "UIUnitTestViewController.h"
#import "ECSConnectionSQLite.h"


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
	NSString* testTitle = @"Unit Test Results";
	
	NSMutableString* testText = [NSMutableString stringWithCapacity: 10];
	
	// Basic DB Connection unit test
	[testText appendString:@"DB Connection: "];
	
	ECSConnectionSQLite* sqlConnection = [ECSConnectionSQLite alloc];
	
	if ([sqlConnection open: @"test-database.sqlite"])
	{
		[testText appendString:@"Passed"];
	}
	else 
	{
		[testText appendString:@"Failed"];
	}
	
	// Basic Patient add / retrieve test
	[testText appendString: @"\nAdd / Retrieve Patient: "];
	DBPatient* patient = [DBPatient alloc];
	
	// Setup our patient
	[patient setPid : -1];
	[patient setDob : [[NSDate alloc] initWithString: @"2001-03-24 10:45:32 +0600"]];
	[patient setName : @"Test Patient"];
	[patient setSex : @"male"];
	[patient setPassword : @"gibberish"];
	[patient setAddress : @"14 Hemenway Street"];
	[patient setCity : @"Boston"];
	[patient setState : @"MA"];
	[patient setZip : @"02115"];
	[patient setPhone : @"617-435-7090"];
	[patient setEmail : @"test@example.com"];

	// Load the patient
	PatientID pid = [sqlConnection addPatient: patient];
	
	// Update our local copy of the patient with the pid
	[patient setPid: pid];
	
	// Retrieve the patient
	DBPatient* patientFromDB = [sqlConnection getPatient: pid];
	
	if ([patient equals: patientFromDB])
	{
		[testText appendString: @"Passed"];
	}
	else 
	{
		[testText appendString: @"Failed"];
	}

		
	
	UIAlertView* messageBox = [[UIAlertView alloc] initWithTitle:testTitle message:testText delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
	
	[messageBox show];
	[messageBox release];
	
	//DBPatient* patient = [DBPatient alloc];
	//
	//[patient setName : @"Patient Name"];
	//
	//if (@"Patient Name" == [patient name]) 
	//{
	//	[labelResults setText : @"Basic Unit Test Passed"];
	//}
	//else
	//{
	//	[labelResults setText : @"Basic Unit Test Failed"];
	//}
	
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
