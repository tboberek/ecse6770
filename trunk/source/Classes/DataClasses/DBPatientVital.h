//
//  DBPatientVital.h
//  MobileHIS
//
//  Created by T.J. Boberek on 12/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBTypes.h"

@interface DBPatientVital : NSObject 
{
	PatientID	pid;
	NSString*	temp;
	NSString*	bloodPressure;
	NSString*	pulse;
	NSString*	comment;
	NSString*	takenBy;
}

- (PatientID) pid;
- (NSString*) temp;
- (NSString*) bloodPressure;
- (NSString*) pulse;
- (NSString*) comment;
- (NSString*) takenBy;

- (void) setPid : (PatientID) input;
- (void) setTemp : (NSString*) input;
- (void) setBloodPressure : (NSString*) input;
- (void) setPulse : (NSString*) input;
- (void) setComment : (NSString*) input;
- (void) setTakenBy : (NSString*) input;

- (BOOL) equals: (DBPatientVital*) vitals;

@end
