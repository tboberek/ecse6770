/*
 *  ECSConnection.h
 *  MobileHIS
 *
 *  Created by T.J. Boberek on 12/2/09.
 *  Copyright 2009 __MyCompanyName__. All rights reserved.
 *
 */
#import "DBClasses.h"

@protocol ECSConnection
- (BOOL) open : (NSString*) filename;
- (void) close;

- (BOOL) isConnected;

// Functions to load from the database
- (DBPatient*) getPatient : (PatientID) pid;

// Functions to add to the database
- (PatientID) addPatient : (DBPatient*) patient;

//- (void) format;

//- (BOOL) connect;
//- (DBPatient*) loadPatient : PatientID pid;
@end