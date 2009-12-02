//
//  DBPatientCondition.m
//  MobileHIS
//
//  Created by T.J. Boberek on 12/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DBPatientCondition.h"


@implementation DBPatientCondition
- (id) init
{
	if ( self = [super init])
	{
		
	}
	return self;
}

- (void) dealloc
{
	[name release];
	[startDate release];
	[endDate release];
	[treatedBy release];
	
	[super dealloc];
}

- (PatientID) pid
{
	return pid;
}

- (NSString*) name
{
	return name;
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

- (void) setPid : (PatientID) input
{
	pid = input;
}

- (void) setName : (NSString*) input
{
	[name autorelease];
	name = [input retain];
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
