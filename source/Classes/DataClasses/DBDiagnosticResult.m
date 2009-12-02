//
//  DBDiagnosticResult.m
//  MobileHIS
//
//  Created by T.J. Boberek on 12/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DBDiagnosticResult.h"


@implementation DBDiagnosticResult
- (id) init
{
	if ( self = [super init])
	{
		
	}
	return self;
}

- (void) dealloc
{
	[result release];
	[normalData release];
	[testDate release];
	[orderedBy release];
	
	[super dealloc];
}

- (PatientID)			pid
{
	return pid;
}

- (DiagnosticTestID)	did
{
	return did;
}

- (NSString*)			result
{
	return result;
}

- (NSString*)			normalData
{
	return normalData;
}

- (NSDate*)				testDate
{
	return testDate;
}

- (NSString*)			orderedBy
{
	return orderedBy;
}

- (void) setPid : (PatientID) input
{
	pid = input;
}

- (void) setDid : (DiagnosticTestID) input
{
	did = input;
}

- (void) setResult : (NSString*) input
{
	[result autorelease];
	result = [input retain];
}

- (void) setNormalData : (NSString*) input
{
	[normalData autorelease];
	normalData = [input retain];
}

- (void) setTestDate : (NSDate*) input
{
	[testDate autorelease];
	testDate = [input retain];
}

- (void) setOrderedBy : (NSString*) input
{
	[orderedBy autorelease];
	orderedBy = [input retain];
}

@end
