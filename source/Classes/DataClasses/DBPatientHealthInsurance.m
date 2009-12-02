//
//  DBPatientHealthInsurance.m
//  MobileHIS
//
//  Created by T.J. Boberek on 12/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DBPatientHealthInsurance.h"


@implementation DBPatientHealthInsurance
- (id) init
{
	if ( self = [super init])
	{
		
	}
	return self;
}

- (void) dealloc
{
	[type release];
	[idNumber release];
	[policyHolder release];
	
	[super dealloc];
}

- (PatientID) pid
{
	return pid;
}

- (NSString*) type
{
	return type;
}

- (NSString*) idNumber
{
	return idNumber;
}

- (NSString*) policyHolder
{
	return policyHolder;
}

- (void) setPid : (PatientID) input;
{
	pid = input;
}

- (void) setType: (NSString*) input
{
	[type autorelease];
	type = [input retain];
}

- (void) setIDNumber : (NSString*) input
{
	[idNumber autorelease];
	idNumber = [input retain];
}

- (void) setPolicyHolder : (NSString*) input
{
	[policyHolder autorelease];
	policyHolder = [input retain];
}
@end
