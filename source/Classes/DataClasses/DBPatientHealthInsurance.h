//
//  DBPatientHealthInsurance.h
//  MobileHIS
//
//  Created by T.J. Boberek on 12/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBTypes.h"


@interface DBPatientHealthInsurance : NSObject
{
	PatientID	pid;
	NSString*	type;
	NSString*	idNumber;
	NSString*	policyHolder;
}
	
- (PatientID) pid;
- (NSString*) type;
- (NSString*) idNumber;
- (NSString*) policyHolder;

- (void) setPid : (PatientID) input;
- (void) setType: (NSString*) input;
- (void) setIDNumber : (NSString*) input;
- (void) setPolicyHolder : (NSString*) input;
@end
