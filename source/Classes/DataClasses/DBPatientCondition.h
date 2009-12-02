//
//  DBPatientCondition.h
//  MobileHIS
//
//  Created by T.J. Boberek on 12/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBTypes.h"


@interface DBPatientCondition : NSObject 
{
	PatientID			pid;
	NSString*			name;
	NSDate*				startDate;
	NSDate*				endDate;
	NSString*			treatedBy;
}

- (PatientID) pid;
- (NSString*) name;
- (NSDate*) startDate;
- (NSDate*) endDate;
- (NSString*) treatedBy;

- (void) setPid : (PatientID) input;
- (void) setName : (NSString*) input;
- (void) setStartDate : (NSDate*) input;
- (void) setEndDate : (NSDate*) input;
- (void) treatedBy : (NSString*) input;

@end
