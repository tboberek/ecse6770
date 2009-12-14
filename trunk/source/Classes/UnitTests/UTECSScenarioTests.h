//
//  UTECSScenarioTests.h
//  MobileHIS
//
//  Created by T.J. Boberek on 12/8/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ECSInterface.h"
#import "DBClasses.h"


@interface UTECSScenarioTests : NSObject 
{
	BOOL pass;
}

// Top-level scenario usecase tests
- (BOOL) updatePatientVitals;

// Functions to simulate "external objects" during
// tests

// Emulate UI
- (PatientID) acceptPatientList: (NSDictionary*) patientList;
- (int) acceptPatientChart: (DBPatient*) patientChart;
- (BOOL) acceptECSInterface: (ECSInterface*) ecs;
- (BOOL) acceptCommitResult: (DBPatientVital*) commitResult;
- (BOOL) acceptAvailableActions: (NSArray*) availableActions;
- (BOOL) fillOutVitalsEntry: (DBPatientVital*) vitalsEntry;


@end
