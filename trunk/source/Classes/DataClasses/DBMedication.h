//
//  DBMedication.h
//  MobileHIS
//
//  Created by T.J. Boberek on 12/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBTypes.h"


@interface DBMedication : NSObject 
{
	MedicationID	mid;
	NSString*		name;
	NSString*		description;
	NSString*		drugInteractions;
	NSString*		sideEffects;
}

- (MedicationID) mid;
- (NSString*) name;
- (NSString*) description;
- (NSString*) drugInteractions;
- (NSString*) sideEffects;

- (void) setMid : (MedicationID) input;
- (void) setName : (NSString*) input;
- (void) setDescription : (NSString*) input;
- (void) setDrugInteractions : (NSString*) input;
- (void) setSideEffects : (NSString*) input;

@end
