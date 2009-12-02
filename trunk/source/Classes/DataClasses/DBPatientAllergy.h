//
//  DBPatientAllergy.h
//  MobileHIS
//
//  Created by T.J. Boberek on 12/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBTypes.h"

@interface DBPatientAllergy : NSObject 
{
	PatientID			pid;
	AllergyID			aid;
	
	NSDate*				startDate;
	NSDate*				endDate;
	
	NSString*			treatedBy;
}

// Getter functions
- (PatientID)			pid;
- (AllergyID)			aid;
- (NSDate*)				startDate;
- (NSDate*)				endDate;
- (NSString*)			treatedBy;

// Setter functions
- (void) setPid : (PatientID) input;
- (void) setAid : (AllergyID) input;
- (void) setStartDate : (NSDate*) input;
- (void) setEndDate : (NSDate*) input;
- (void) treatedBy : (NSString*) input;
@end
