//
//  DBPatientVital.m
//  MobileHIS
//
//  Created by T.J. Boberek on 12/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DBPatientVital.h"


@implementation DBPatientVital
- (id) init
{
	if ( self = [super init])
	{
		
	}
	return self;
}

- (void) dealloc
{
	[temp dealloc];
	[bloodPressure dealloc];
	[pulse dealloc];
	[comment dealloc];
	[takenBy dealloc];
	
	[super dealloc];
}

- (PatientID) pid
{
	return pid;
}

- (NSString*) temp
{
	return temp;
}

- (NSString*) bloodPressure
{
	return bloodPressure;
}

- (NSString*) pulse
{
	return pulse;
}

- (NSString*) comment
{
	return comment;
}

- (NSString*) takenBy
{
	return takenBy;
}

- (void) setPid : (PatientID) input
{
	pid = input;
}

- (void) setTemp : (NSString*) input
{
	[temp autorelease];
	temp = [input retain];
}

- (void) setBloodPressure : (NSString*) input
{
	[bloodPressure autorelease];
	bloodPressure = [input retain];
}

- (void) setPulse : (NSString*) input
{
	[pulse autorelease];
	pulse = [input retain];
}

- (void) setComment : (NSString*) input
{
	[comment autorelease];
	comment = [input retain];
}

- (void) setTakenBy : (NSString*) input
{
	[takenBy autorelease];
	takenBy = [input retain];
}

- (BOOL) equals: (DBPatientVital*) vitals
{	
	BOOL equal = NO;
	
	if ([self pid] == [vitals pid] &&
		[[self temp] isEqualToString: [vitals temp]] &&
		[[self bloodPressure] isEqualToString: [vitals bloodPressure]] &&
		[[self pulse] isEqualToString: [vitals pulse]] &&
		[[self comment] isEqualToString: [vitals comment]] &&
		[[self takenBy] isEqualToString: [vitals takenBy]])
	{
		equal = YES;
	}
	
	return equal;
}

@end
