//
//  DBMedication.m
//  MobileHIS
//
//  Created by T.J. Boberek on 12/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DBMedication.h"


@implementation DBMedication
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
	[drugInteractions release];
	[sideEffects release];
	
	[super dealloc];
}

- (MedicationID) mid
{
	return mid;
}

- (NSString*) name
{
	return name;
}

- (NSString*) description
{
	return description;
}

- (NSString*) drugInteractions
{
	return drugInteractions;
}

- (NSString*) sideEffects
{
	return sideEffects;
}

- (void) setMid : (MedicationID) input
{
	mid = input;
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

- (void) setDrugInteractions : (NSString*) input
{
	[drugInteractions autorelease];
	drugInteractions = [input retain];
}

- (void) setSideEffects : (NSString*) input
{
	[sideEffects autorelease];
	sideEffects = [input retain];
}
@end
