//
//  UTECSScenarioTests.m
//  MobileHIS
//
//  Created by T.J. Boberek on 12/8/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "UTECSScenarioTests.h"
#import "ECSInterface.h"


@implementation UTECSScenarioTests
- (id) init
{
	if ( self = [super init])
	{
		pass = NO;
	}
	return self;
}

- (BOOL) updatePatientVitals
{	
	// UI	req. ser.	Create New ECS				from ECS
	ECSInterface* ecs = [ECSInterface alloc];
	
	// ECS	req. ser.	Accept ECS Object			from UI
	[self acceptECSInterface: ecs];
	
	// UI	req. ser.	Log in						from ECS
	NSArray* availableActions = 
		[ecs logIn: @"testUser" password: @"testPass"];
	
	// ECS	req. ser.	Accept Available Actions	from UI
	[self acceptAvailableActions: availableActions];
	
	// UI	req. ser.	Get Patient List			from ECS
	NSArray* patientList = [ecs getPatientList];
	
	// ECS	req. ser.	Accept Patient List			from UI
	PatientID pid = [self acceptPatientList: patientList];
	
	// UI	req. ser.	Get Patient Chart			from ECS
	DBPatient* patientChart = [ecs getPatientChart: pid];
	
	// ECS	req. ser.	Accept Patient Chart		from UI
	[self acceptPatientChart: patientChart];
	
	// UI	req. ser.	Get New Vitals Entry		from ECS
	DBPatientVital* vitalsEntry = [ecs getNewVitalsEntry];
	
	// ECS	req. ser.	Fill Out Vitals Entry		from UI
	[self fillOutVitalsEntry: vitalsEntry];
	
	// UI	req. ser.	Commit Vitals Entry			from ECS
	int result = [ecs commitVitalsEntry: vitalsEntry];
	
	// ECS	req. ser.	Accept Commit Result		from UI
	[self acceptCommitResult: result];
	
	// Return our results
	return pass;
}

// Emulate UI
- (BOOL) acceptECSInterface: (ECSInterface*) ecs
{
	pass = pass && [ecs isLoggedIn];
	
	return pass;
}

- (BOOL) acceptAvailableActions: (NSArray*) availableActions
{
	// Verify that we have received the expected available
	// actions
	pass = pass && ([availableActions count] == 2);
	pass = pass && ([availableActions objectAtIndex: 0] == @"Get Patient List");
	pass = pass && ([availableActions objectAtIndex: 1] == @"Get Patient - Search");
	
	return pass;
}

- (BOOL) acceptPatientList: (NSArray*) patientList
{
	// Verify that we have the expected test data
	pass = pass && ([patientList count] == 3);
	pass = pass && ([patientList objectAtIndex: 0] == @"Gibbs, George");
	pass = pass && ([patientList objectAtIndex: 1] == @"Newsome, Howier");
	pass = pass && ([patientList objectAtIndex: 2] == @"Webb, Emily");
	
	return pass;
}

- (BOOL) acceptPatientChart: (DBPatient*) patientChart
{
	// Create expected test data
	DBPatient* baseline = [DBPatient alloc];
	
	[baseline setDob : [[NSDate alloc] initWithString: @"2001-03-24 10:45:32 +0600"]];
	[baseline setName : @"Gibbs, George"];
	[baseline setSex : @"male"];
	[baseline setPassword : @"gibberish"];
	[baseline setAddress : @"14 Hemenway Street"];
	[baseline setCity : @"Boston"];
	[baseline setState : @"MA"];
	[baseline setZip : @"02115"];
	[baseline setPhone : @"617-435-7090"];
	[baseline setEmail : @"test@example.com"];
	
	// Verify that provided test data matches expected test data
	pass = pass && [baseline equals: patientChart];
	
	return pass;
}

- (BOOL) acceptCommitResult: (ECSResult) commitResult
{
	// Verify that the commit was successful
	pass = pass && (ECS_SUCCESS == commitResult);

	return pass;
}

- (BOOL) fillOutVitalsEntry: (DBPatientVital*) vitalsEntry
{
	// Create Expected test data
	DBPatientVital* baseline = [DBPatientVital alloc];
	
	[baseline setPid: 1];
	[baseline setTemp: @"99.7"];
	[baseline setBloodPressure: @"132/78"];
	[baseline setPulse: @"89"];
	[baseline setComment: @"Patient slightly flushed"];
	[baseline setTakenBy: @"Dr. Fine"];
	
	pass = pass && [baseline equals: vitalsEntry];
	
	return pass;
}


@end
