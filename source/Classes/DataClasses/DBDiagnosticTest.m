//
//  DBDiagnosticTest.m
//  MobileHIS
//
//  Created by T.J. Boberek on 12/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DBDiagnosticTest.h"


@implementation DBDiagnosticTest
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
	[description release];
	[code release];
	
	[super dealloc];
}

- (DiagnosticTestID) did
{
	return did;
}

- (NSString*) name
{
	return name;
}

- (NSString*) description
{
	return description;
}

- (NSString*) code
{
	return code;
}

- (void) setDID : (DiagnosticTestID) input
{
	did = input;
}

- (void) setName : (NSString*) input
{
	[name autorelease];
	name = [input retain];
}

- (void) setDescription : (NSString*) input
{
	[description autorelease];
	description = [input retain];
}

- (void) setCode : (NSString*) input
{
	[code autorelease];
	code = [input retain];
}

@end
