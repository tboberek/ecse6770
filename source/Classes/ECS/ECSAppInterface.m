//
//  ECSAppInterface.m
//  MobileHIS
//
//  Created by T.J. Boberek on 12/8/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ECSAppInterface.h"


@implementation ECSAppInterface
- (NSArray*) getAvailableActions: (ECSRoleID) roleID
{
	NSMutableArray* actions = [NSMutableArray arrayWithObject: @"Log Out"];
	
	switch (roleID)
	{
		case ECS_ROLE_DOCTOR:
		case ECS_ROLE_NURSE_P:
			[actions addObject: @"Order Lab"];
			[actions addObject: @"Order Prescription"];
		case ECS_ROLE_NURSE:
			[actions addObject: @"View Labs"];
			[actions addObject: @"View Prescriptions"];
			[actions addObject: @"Edit Patient Chart"];
		case ECS_ROLE_ADMINISTRATOR:
			[actions addObject: @"Access Patient Chart"];
			[actions addObject: @"Contact Patient"];
			break;
		default:
			break;
	}
	return actions;

}

- (NSDictionary*) createPatientList: (NSDictionary*) patientRecords
{
	NSMutableDictionary* patientList = [NSMutableDictionary new];
	
	// Iterator through the ids and get the patient chart for
	// each one
	for (id theKey in patientRecords)
	{
		DBPatient* patient = [patientRecords objectForKey: theKey];
		[patientList setObject: [patient name] forKey: theKey];
	}
	
	return patientList;
	
}
@end
