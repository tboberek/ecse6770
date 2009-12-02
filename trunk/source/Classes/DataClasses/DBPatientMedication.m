//
//  DBPatientMedication.m
//  MobileHIS
//
//  Created by T.J. Boberek on 12/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DBPatientMedication.h"


@implementation DBPatientMedication
- (id) init
{
	if ( self = [super init])
	{
		
	}
	return self;
}

- (void) dealloc
{
	[startDate release];
	[toDate release];
	[medStrength release];
	[dosage release];
	[frequency release];
	[deliveryMethod release];
	[refillsLeft release];
	[writtenBy release];
	[filledOn release];
	
	[super dealloc];
}

- (PatientID) pid
{
	return pid;
}

- (MedicationID) mid
{
	return mid;
}

- (PrescriptionID) psid
{
	return psid;
}

- (NSDate*) startDate
{
	return startDate;
}

- (NSDate*) toDate
{
	return toDate;
}

- (NSString*) medStrength
{
	return medStrength;
}

- (NSString*) dosage
{
	return dosage;
}

- (NSString*) frequency
{
	return frequency;
}

- (NSString*) deliveryMethod
{
	return deliveryMethod;
}

- (NSString*) refillsLeft
{
	return refillsLeft;
}

- (NSString*) writtenBy
{
	return writtenBy;
}

- (NSDate*) filledOn
{
	return filledOn;
}

- (int) quantity
{
	return quantity;
}

- (void) setPid : (PatientID) input
{
	pid = input;
}

- (void) setMid : (MedicationID) input
{
	mid = input;
}

- (void) setPsid : (PrescriptionID) input
{
	psid = input;
}

- (void) setStartDate : (NSDate*) input
{
	[startDate autorelease];
	startDate = [input retain];
}

- (void) setToDate : (NSDate*) input
{
	[toDate autorelease];
	toDate = [input retain];
}

- (void) setMedStrength : (NSString*) input
{
	[medStrength autorelease];
	medStrength = [input retain];
}

- (void) setDosage : (NSString*) input
{
	[dosage autorelease];
	dosage = [input retain];
}

- (void) setFrequency : (NSString*) input
{
	[frequency autorelease];
	frequency = [input retain];
}

- (void) setDeliveryMethod : (NSString*) input
{
	[deliveryMethod autorelease];
	deliveryMethod = [input retain];
}

- (void) setRefillsLeft : (NSString*) input
{
	[refillsLeft autorelease];
	refillsLeft = [input retain];
}

- (void) setWrittenBy : (NSString*) input
{
	[writtenBy autorelease];
	writtenBy = [input retain];
}

- (void) setFilledOn : (NSDate*) input
{
	[filledOn autorelease];
	filledOn = [input retain];
}

- (void) setQuantity : (int) input
{
	quantity = input;
}

@end
