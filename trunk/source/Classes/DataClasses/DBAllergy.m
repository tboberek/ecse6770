//
//  DBAllergy.m
//  MobileHIS
//
//  Created by T.J. Boberek on 12/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DBAllergy.h"


@implementation DBAllergy
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

// Getter functions
- (AllergyID) aid
{
	return aid;
}

- (NSString*) name
{
	return name;
}

- (NSString*) description
{
	return description;
}


// Setter functions
- (void) setAid : (AllergyID) input
{
	aid = input;
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
@end
