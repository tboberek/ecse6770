//
//  DBPatientMedication.h
//  MobileHIS
//
//  Created by T.J. Boberek on 12/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBTypes.h"

@interface DBPatientMedication : NSObject 
{
	PatientID		pid;
	MedicationID	mid;
	PrescriptionID	psid;
	NSDate*			startDate;
	NSDate*			toDate;
	NSString*		medStrength;
	NSString*		dosage;
	NSString*		frequency;
	NSString*		deliveryMethod;
	NSString*		refillsLeft;
	NSString*		writtenBy;
	NSDate*			filledOn;
	int				quantity;
}

- (PatientID) pid;
- (MedicationID) mid;
- (PrescriptionID) psid;
- (NSDate*) startDate;
- (NSDate*) toDate;
- (NSString*) medStrength;
- (NSString*) dosage;
- (NSString*) frequency;
- (NSString*) deliveryMethod;
- (NSString*) refillsLeft;
- (NSString*) writtenBy;
- (NSDate*) filledOn;
- (int) quantity;

- (void) setPid : (PatientID) input;
- (void) setMid : (MedicationID) input;
- (void) setPsid : (PrescriptionID) input;
- (void) setStartDate : (NSDate*) input;
- (void) setToDate : (NSDate*) input;
- (void) setMedStrength : (NSString*) input;
- (void) setDosage : (NSString*) input;
- (void) setFrequency : (NSString*) input;
- (void) setDeliveryMethod : (NSString*) input;
- (void) setRefillsLeft : (NSString*) input;
- (void) setWrittenBy : (NSString*) input;
- (void) setFilledOn : (NSDate*) input;
- (void) setQuantity : (int) input;

@end
