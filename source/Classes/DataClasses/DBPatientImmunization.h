//
//  DBPatientImmunization.h
//  MobileHIS
//
//  Created by T.J. Boberek on 12/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBTypes.h"

@interface DBPatientImmunization : NSObject 
{
	PatientID		pid;
	ImmunizationID	iid;
	NSString*		orderBy;
	
}

- (PatientID)		pid;
- (ImmunizationID)	iid;
- (NSString*)		orderBy;

- (void) setPid : (PatientID) input;
- (void) setIid : (ImmunizationID) input;
- (void) setOrderBy : (NSString*) input;

@end
