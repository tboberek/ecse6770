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

- (ECSResult) verifyUserCredentials: (NSString*) username password: (NSString*) password;

- (BOOL) open : (NSString*) filename;
- (void) close;

- (BOOL) isConnected;

// Functions to load from the database
- (DBPatient*) retrievePatient : (PatientID) pid;
//- (DBMedication*) retrieve : (MedicationID) mid;

// Functions to add to the database
- (PatientID) addPatient : (DBPatient*) patient;
- (MedicationID) addMedication : (DBMedication*) medication;

// Functions to update the database
- (BOOL) updatePatient : (DBPatient*) patient;

//- (void) format;

//- (BOOL) connect;
//- (DBPatient*) loadPatient : PatientID pid;
@end

@interface ECSDBInterface : NSObject<ECSDBInterface>
{
}

@end