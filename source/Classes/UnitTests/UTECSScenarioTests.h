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
- (BOOL) acceptPatientList: (NSArray*) patientList;
- (BOOL) acceptECSInterface: (ECSInterface*) ecs;
- (BOOL) acceptPatientChart: (DBPatient*) patientChart;
- (BOOL) acceptCommitResult: (ECSResult) commitResult;
- (BOOL) acceptAvailableActions: (NSArray*) availableActions;
- (BOOL) fillOutVitalsEntry: (DBPatientVital*) vitalsEntry;


@end
