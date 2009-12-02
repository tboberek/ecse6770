//
//  DBProcedure.m
//  MobileHIS
//
//  Created by T.J. Boberek on 12/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DBProcedure.h"


@implementation DBProcedure
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

	[super dealloc];
}

- (ProcedureID) pid
{
	return pid;
}

- (NSString*) name
{
	return name;
}

- (NSString*) description
{
	return description;
}

- (void) setPid : (ProcedureID) input
{
	pid = input;
}

- (void) setName : (NSString*) input
{
	[name autorelease];
	name = [input retain];
}

- (void) setDescription : (NSString*) input
{
	[description autorelease];
	description = [description retain];
}
@end
