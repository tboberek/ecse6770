/*
 *  ECSConnection.h
 *  MobileHIS
 *
 *  Created by T.J. Boberek on 12/2/09.
 *  Copyright 2009 __MyCompanyName__. All rights reserved.
 *
 */
#import <Foundation/Foundation.h>
#import "DBClasses.h"

@protocol ECSDBInterface

- (ECSRoleID) verifyLogin: (NSString*) username password: (NSString*) password;

- (BOOL) open : (NSString*) filename;
- (void) close;

- (BOOL) isConnected;

// Functions to load from the database
- (NSDictionary*) retrieveAllPatients;
- (DBPatient*) retrievePatient : (PatientID) pid;
- (DBPatientVital*) retrievePatientVital : (int) vid;

// Functions to add to the database
- (PatientID) addPatient : (DBPatient*) patient;
- (MedicationID) addMedication : (DBMedication*) medication;
- (int) addPatientVital : (DBPatientVital*) vitalEntry;

// Functions to update the database
- (BOOL) updatePatient : (DBPatient*) patient;

@end

@interface ECSDBInterface : NSObject<ECSDBInterface>
{
}

@end