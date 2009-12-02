//
//  DBPatientAllergy.m
//  MobileHIS
//
//  Created by T.J. Boberek on 12/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DBPatientAllergy.h"


@implementation DBPatientAllergy
// Getter functions
- (id) init
{
	if ( self = [super init])
	{
		
	}
	return self;
}

- (void) dealloc
{
	[startDate release];
	[endDate release];
	[treatedBy release];
	
	[super dealloc];
}

- (PatientID) pid
{
	return pid;
}

- (AllergyID) aid
{
	return aid;
}

- (NSDate*) startDate
{
	return startDate;
}

- (NSDate*) endDate
{
	return endDate;
}

- (NSString*) treatedBy
{
	return treatedBy;
}

// Setter functions
- (void) setPid : (PatientID) input
{
	pid = input;
}

- (void) setAid : (AllergyID) input
{
	aid = input;
}

- (void) setStartDate : (NSDate*) input
{
	[startDate autorelease];
	startDate = [input retain];
}

- (void) setEndDate : (NSDate*) input
{
	[endDate autorelease];
	endDate = [input retain];
}

- (void) treatedBy : (NSString*) input
{
	[treatedBy autorelease];
	treatedBy = [input retain];
}

@end
