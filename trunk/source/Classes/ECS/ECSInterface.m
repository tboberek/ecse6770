//
//  ECSInterface.m
//  MobileHIS
//
//  Created by T.J. Boberek on 12/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ECSInterface.h"


@implementation ECSInterface

- (id) init
{
	if ( self = [super init])
	{
		db = nil;
		app = nil;
	}
	return self;
}

- (BOOL) isLoggedIn
{
	return NO;
}

- (NSArray*) logIn: (NSString*) username password: (NSString*) password
{
	// ECS		req. ser.	Create New AppInterface		from AppInt
	ECSAppInterface* inputApp = [ECSAppInterface alloc];
	
	// AppInt	req. ser.	Store AppInterface			from ECS
	[self storeAppInterface: inputApp];
	
	// ECS		req. ser.	Create New DBInterface		from DBInt
	ECSDBInterface* inputDB = [ECSDBInterface alloc];
	
	// DBInt	req. ser.	Store DBInterface			from ECS
	[self storeDBInterface: inputDB];
	
	// ECS		req. ser.	Verify User Credentials		from DBInt
	ECSResult loginResult = [db verifyUserCredentials: username password: password];
	
	// DBInt	req. ser.	Get Available Actions		from AppInt
	NSArray* availableActions = [app getAvailableActions: loginResult];
	
	// AppInt	req. ser.	Return Available Actions	from ECS
	return availableActions;
}

- (NSArray*) getPatientList
{
	return [NSArray alloc];
}

- (DBPatient*) getPatientChart: (PatientID) pid
{
	return [DBPatient alloc];
}

- (DBPatientVital*) getNewVitalsEntry
{
	return [DBPatientVital alloc];
}

- (ECSResult) commitVitalsEntry: (DBPatientVital*) vitalsEntry
{
	return ECS_UNKNOWN_FAILURE;
}

- (void) storeAppInterface: (ECSAppInterface*) inputECS
{
	app = inputECS;
}

- (void) storeDBInterface: (ECSDBInterface*) inputDB
{
	db = inputDB;
}

@end
