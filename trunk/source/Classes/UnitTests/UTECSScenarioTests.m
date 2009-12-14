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
		pass = YES;
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
		[ecs logIn: @"Test Doctor" password: @"Test Password"];
	
	// ECS	req. ser.	Accept Available Actions	from UI
	[self acceptAvailableActions: availableActions];
	
	// UI	req. ser.	Get Patient List			from ECS
	NSDictionary* patientList = [ecs getPatientList];
	
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
	DBPatientVital* result = [ecs commitVitalsEntry: vitalsEntry];
	
	// ECS	req. ser.	Accept Commit Result		from UI
	[self acceptCommitResult: result];
	
	// Verify our results
	pass = [result equals: vitalsEntry];

	return pass;
}

// Emulate UI
- (BOOL) acceptECSInterface: (ECSInterface*) ecs
{
	pass = pass && ecs != nil;
	
	return pass;
}

- (BOOL) acceptAvailableActions: (NSArray*) availableActions
{

	// Verify that we have received the expected available
	// actions
	pass = pass && ([availableActions count] == 8);
	pass = pass && ([availableActions objectAtIndex: 0] ==  @"Log Out");
	pass = pass && ([availableActions objectAtIndex: 1] ==  @"Order Lab");
	pass = pass && ([availableActions objectAtIndex: 2] ==  @"Order Prescription");
	pass = pass && ([availableActions objectAtIndex: 3] ==  @"View Labs");
	pass = pass && ([availableActions objectAtIndex: 4] ==  @"View Prescriptions");
	pass = pass && ([availableActions objectAtIndex: 5] ==  @"Edit Patient Chart");
	pass = pass && ([availableActions objectAtIndex: 6] ==  @"Access Patient Chart");
	pass = pass && ([availableActions objectAtIndex: 7] ==  @"Contact Patient");
	
	return pass;
}

- (PatientID) acceptPatientList: (NSDictionary*) patientList
{
	// simulate selecting a patient
	PatientID pid = 1;
	
	// Verify that we have the expected test data
	pass = pass && ([patientList count] == 3);
	
	//pass = pass && ([[patientList objectForKey: 1] equalToString: @"Payten Manning"]);
	//pass = pass && ([[patientList objectForKey: 2] equalToString: @"Eli Manning"]);
	//pass = pass && ([patientList count] == 3);
	//pass = pass && ([patientList objectAtIndex: 0] == @"Gibbs, George");
	//pass = pass && ([patientList objectAtIndex: 1] == @"Newsome, Howier");
	//pass = pass && ([patientList objectAtIndex: 2] == @"Webb, Emily");
	
	return pid;
}

- (int) acceptPatientChart: (DBPatient*) patientChart
{
	// Create expected test data
	DBPatient* baseline = [DBPatient alloc];
	
	[baseline setPid: 1];
	[baseline setDob : nil];
	[baseline setName : @"Payton Manning"];
	[baseline setSex : @"male"];
	[baseline setPassword : @"asdhsajdkhsajdh"];
	[baseline setAddress : @"26 Heavy Road"];
	[baseline setCity : @"Rockville"];
	[baseline setState : @"TN"];
	[baseline setZip : @"01234"];
	[baseline setPhone : @"123-341-1238"];
	[baseline setEmail : @"manning1@hotmail.com"];
	
	// Verify that provided test data matches expected test data
	pass = pass && [baseline equals: patientChart];
	
	// Simulate update vitals
	return 3;
}

- (BOOL) acceptCommitResult: (DBPatientVital*) commitResult
{
	// Verify that the commit was successful
	pass = pass && (ECS_SUCCESS == commitResult);

	return pass;
}

- (BOOL) fillOutVitalsEntry: (DBPatientVital*) vitalsEntry
{
	[vitalsEntry setPid: 1];
	[vitalsEntry setTemp: @"99.7"];
	[vitalsEntry setBloodPressure: @"132/78"];
	[vitalsEntry setPulse: @"89"];
	[vitalsEntry setComment: @"Patient slightly flushed"];
	[vitalsEntry setTakenBy: @"Dr. Fine"];
	
	return true;
}


@end
