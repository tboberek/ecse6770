//
//  DBPatientImmunization.m
//  MobileHIS
//
//  Created by T.J. Boberek on 12/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DBPatientImmunization.h"


@implementation DBPatientImmunization
- (id) init
{
	if ( self = [super init])
	{
		
	}
	return self;
}

- (void) dealloc
{
	[orderBy release];
	
	[super dealloc];
}

- (PatientID) pid
{
	return pid;
}

- (ImmunizationID) iid
{
	return iid;
}

- (NSString*) orderBy
{
	return orderBy;
}

- (void) setPid : (PatientID) input
{
	pid = input;
}

- (void) setIid : (ImmunizationID) input
{
	iid = input;
}

- (void) setOrderBy : (NSString*) input
{
	[orderBy autorelease];
	orderBy = [input retain];
}

@end
