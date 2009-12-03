//
//  DBPatient.h
//  MobileHIS
//
//  Created by T.J. Boberek on 11/30/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBTypes.h"


@interface DBPatient : NSObject {
	PatientID	pid;
	
	NSDate*		dob;

	NSString*	name;
	NSString*	sex;
	
	NSString*	password;
	
	NSString*	address;
	NSString*	city;
	NSString*	state;
	NSString*	zip;
	
	NSString*	phone;
	NSString*	email;
	
	NSMutableDictionary* allergies;
	NSMutableDictionary* conditions;
	NSMutableDictionary* healthInsurance;
	NSMutableDictionary* immunizations;
	NSMutableDictionary* medications;
	NSMutableDictionary* procedures;
}

// Getter functions for the class
- (PatientID) 	pid;
- (NSDate*) 	dob;
- (NSString*)	name;
- (NSString*)	sex;
- (NSString*)	password;
- (NSString*)	address;
- (NSString*)	city;
- (NSString*)	state;
- (NSString*)	zip;
- (NSString*)	phone;
- (NSString*)	email;

// Setter functions for the class
- (void) setPid : (PatientID) input;
- (void) setDob : (NSDate*) input;
- (void) setName : (NSString*) input;
- (void) setSex : (NSString*) input;
- (void) setPassword : (NSString*) input;
- (void) setAddress : (NSString*) input;
- (void) setCity : (NSString*) input;
- (void) setState : (NSString*) input;
- (void) setZip : (NSString*) input;
- (void) setPhone : (NSString*) input;
- (void) setEmail : (NSString*) input;

// Function to determine equality
- (BOOL) equals : (DBPatient*) patient;
@end
