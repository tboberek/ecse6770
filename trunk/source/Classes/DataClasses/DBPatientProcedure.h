//
//  DBPatientProcedure.h
//  MobileHIS
//
//  Created by T.J. Boberek on 12/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBTypes.h"

@interface DBPatientProcedure : NSObject 
{
	ProcedureID prid;
	PatientID	pid;
	NSDate*		date;
	NSString*	treatedBy;
}

- (ProcedureID) prid;
- (PatientID)	pid;
- (NSDate*)		date;
- (NSString*)	treatedBy;

- (void) setPrid : (ProcedureID) input;
- (void) setPid : (PatientID) input;
- (void) setDate : (NSDate*) input;
- (void) setTreatedBy : (NSString*) input;

@end
