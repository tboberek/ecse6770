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
	UTECSScenarioTests* unitTest = [UTECSScenarioTests alloc];
	
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

	/*
	NSString* testTitle = @"Unit Test Results";
	
	NSMutableString* testText = [NSMutableString stringWithCapacity: 10];
	

	
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
	DBPatient* patientFromDB = [sqlConnection retrievePatient: pid];
	
	if ([patient equals: patientFromDB])
	{
		[testText appendString: @"Passed"];
	}
	else 
	{
		[testText appendString: @"Failed"];
	}
	
	// Test updating the patient data
	[testText appendString: @"\nUpdate Patient Test: "];
	
	// Update the patient data
	[patient setName: @"Updated Name"];
	
	// Push the changes to the database
	BOOL success = [sqlConnection updatePatient: patient];
	
	// Get the changes back from the database
	patientFromDB = [sqlConnection retrievePatient: [patient pid]];
	
	// Check to see if we just updated the data
	if (success && [patient equals: patientFromDB])
	{
		[testText appendString: @"Passed"];
	}
	else 
	{
		[testText appendString: @"Failed"];
	}
		
	
	// Test initializing the database
	[testText appendString: @"\nInit DB Test: "];
	
	// We're already input something into the patients table, so we
	// know that's not empty
	
	// Disconnect for the time being
	[sqlConnection close];
	
	// Initialize the database
	[sqlConnection initEditableFileCopy: @"test-database.sqlite"];
	
	// Connect back to the database
	[sqlConnection open: @"test-database.sqlite"];
	
	// Add the patient again
	PatientID newPid = [sqlConnection addPatient: patient];
	
	// If the pid is 1, the DB was initialized
	if (1 == newPid)
	{
		[testText appendString: @"Passed"];
	}
	else 
	{
		[testText appendString: @"Failed"];
	}
		
	
	// Done with tests, disconnect and init the database
	[sqlConnection close];
	[sqlConnection initEditableFileCopy: @"test-database.sqlite"];
	
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
	*/
	
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
