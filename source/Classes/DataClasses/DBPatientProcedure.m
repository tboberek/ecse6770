//
//  DBPatientProcedure.m
//  MobileHIS
//
//  Created by T.J. Boberek on 12/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DBPatientProcedure.h"


@implementation DBPatientProcedure
- (id) init
{
	if ( self = [super init])
	{
		
	}
	return self;
}

- (void) dealloc
{
	[date release];
	[treatedBy release];
	
	[super dealloc];
}

- (ProcedureID) prid
{
	return prid;
}

- (PatientID) pid
{
	return pid;
}

- (NSDate*) date
{
	return date;
}

- (NSString*) treatedBy
{
	return treatedBy;
}

- (void) setPrid : (ProcedureID) input
{
	prid = input;
}

- (void) setPid : (PatientID) input
{
	pid = input;
}

- (void) setDate : (NSDate*) input
{
	[date autorelease];
	date = [input retain];
}

- (void) setTreatedBy : (NSString*) input
{
	[treatedBy autorelease];
	treatedBy = [input retain];
}

@end
