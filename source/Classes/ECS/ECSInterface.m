//
//  ECSInterface.m
//  MobileHIS
//
//  Created by T.J. Boberek on 12/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ECSInterface.h"

#import "ECSDBInterfaceFactory.h"
#import "ECSAppInterfaceFactory.h"


@implementation ECSInterface

- (id) init
{
	if ( self = [super init])
	{
		db = nil;
		app = nil;
		userRole = ECS_ROLE_INVALID;
	}
	return self;
}

- (BOOL) isLoggedIn
{
	return (db != nil && [db isConnected] && app != nil && 
			userRole != ECS_ROLE_INVALID);
}

- (NSArray*) logIn: (NSString*) username password: (NSString*) password
{
	// ECS		req. ser.	Create AppInterface		from AppIntF
	ECSAppInterface* inputApp = [ECSAppInterfaceFactory createAppInterface];
	
	// AppInt	req. ser.	Store AppInterface			from ECS
	[self storeAppInterface: inputApp];
	
	// ECS		req. ser.	Create DBInterface		from DBIntFactory
	ECSDBInterface* inputDB = 
		[ECSDBInterfaceFactory createDBInterface: @"test-database.sqlite"];
	
	// DBIntFactory	req. ser.	Store DBInterface			from ECS
	[self storeDBInterface: inputDB];
	
	// ECS		req. ser.	Verify User Credentials		from DBInt
	userRole = [db verifyLogin: username password: password];
	
	// DBInt	req. ser.	Get Available Actions		from AppInt
	NSArray* availableActions = [app getAvailableActions: userRole];
	
	// AppInt	req. ser.	Return Available Actions	from ECS
	return availableActions;
}

- (NSDictionary*) getPatientList
{
	NSDictionary* allPatients = [db retrieveAllPatients];
	return [app createPatientList: allPatients];
}

- (DBPatient*) getPatientChart: (PatientID) pid
{
	return [db retrievePatient: pid];
}

- (DBPatientVital*) getNewVitalsEntry
{
	return [DBPatientVital alloc];
}

- (DBPatientVital*) commitVitalsEntry: (DBPatientVital*) vitalsEntry
{
	DBPatientVital* storedVital = nil;
	
	int vid = [db addPatientVital: vitalsEntry];
	
	storedVital = [db retrievePatientVital: vid];
	
	return storedVital;
}

- (void) storeAppInterface: (ECSAppInterface*) inputECS
{
	app = [inputECS retain];
}

- (void) storeDBInterface: (ECSDBInterface*) inputDB
{
	db = [inputDB retain];
}

@end
