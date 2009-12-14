//
//  DBPatient.m
//  MobileHIS
//
//  Created by T.J. Boberek on 11/30/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DBPatient.h"


@implementation DBPatient
- (id) init
{
	if ( self = [super init])
	{
		
	}
	return self;
}

- (void) dealloc
{
	[dob release];
	[name release];
	[sex release];
	[password release];
	[address release];
	[city release];
	[state release];
	[zip release];
	[phone release];
	[email release];
	
	[super dealloc];
}

// Getter functions for the class
- (PatientID) pid 
{
	return pid;
}

- (NSDate*) dob 
{
	return dob;
}

- (NSString*) name 
{
	return name;
}

- (NSString*) sex
{
	return sex;
}

- (NSString*) password 
{
	return password;
}

- (NSString*) address 
{
	return address;
}

- (NSString*) city 
{
	return city;
}

- (NSString*) state 
{
	return state;
}

- (NSString*) zip 
{
	return zip;
}

- (NSString*) phone
{
	return phone;
}

- (NSString*) email 
{
	return email;
}

// Setter functions for the class
- (void) setPid : (PatientID) input 
{
	pid = input;
}
		
- (void) setDob : (NSDate*) input
{
	[dob autorelease];
	dob = [input retain];
}

- (void) setName : (NSString*) input
{
	[name autorelease];
	name = [input retain];
}

- (void) setSex : (NSString*) input
{
	[sex autorelease];
	sex = [input retain];
}

- (void) setPassword : (NSString*) input;
{
	[password autorelease];
	password = [input retain];
}

- (void) setAddress : (NSString*) input;
{
	[address autorelease];
	address = [input retain];
}

- (void) setCity : (NSString*) input
{
	[city autorelease];
	city = [input retain];
}

- (void) setState : (NSString*) input
{
	[state autorelease];
	state = [input retain];
}

- (void) setZip : (NSString*) input
{
	[zip autorelease];
	zip = [input retain];
}

- (void) setPhone : (NSString*) input
{
	[phone autorelease];
	phone = [input retain];
}

- (void) setEmail : (NSString*) input
{
	[email autorelease];
	email = [input retain];
}

- (BOOL) equals : (DBPatient*) patient
{
	BOOL success = NO;
	
	// TODO: Need to fix dob test in case of nil
	if ([self pid] == [patient pid] &&
		//[[self dob] isEqual: [patient dob]] &&
		[[self name] isEqual: [patient name]] &&
		[[self sex] isEqual: [patient sex]]	&&
		[[self password] isEqual: [patient password]] &&
		[[self address] isEqual: [patient address]] &&
		[[self city] isEqual: [patient city]] &&
		[[self state] isEqual: [patient state]] &&
		[[self zip] isEqual: [patient zip]] &&
		[[self phone] isEqual: [patient phone]] &&
		[[self email] isEqual: [patient email]])
	{
		success = YES;
	}
	
	return success;
		
}

@end
