//
//  ECSInterface.h
//  MobileHIS
//
//  Created by T.J. Boberek on 12/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBClasses.h"

#import "ECSDBInterface.h"
#import "ECSAppInterface.h"


@interface ECSInterface : NSObject 
{
	ECSDBInterface* db;
	ECSAppInterface* app;
	ECSRoleID	userRole;
}

- (BOOL) isLoggedIn;

- (NSArray*) logIn: (NSString*) username password: (NSString*) password;

- (NSDictionary*) getPatientList;
- (DBPatient*) getPatientChart: (PatientID) pid;
- (DBPatientVital*) getNewVitalsEntry;
- (DBPatientVital*) commitVitalsEntry: (DBPatientVital*) vitalsEntry;

- (void) storeAppInterface: (ECSAppInterface*) inputECS;
- (void) storeDBInterface: (ECSDBInterface*) inputDB;

@end
