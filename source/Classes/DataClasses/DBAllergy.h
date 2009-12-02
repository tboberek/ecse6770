//
//  DBAllergy.h
//  MobileHIS
//
//  Created by T.J. Boberek on 12/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBTypes.h"

@interface DBAllergy : NSObject 
{
	AllergyID	aid;
	NSString*	name;
	NSString*	description;
}

// Getter functions
- (AllergyID)	aid;
- (NSString*)	name;
- (NSString*)	description;

// Setter functions
- (void) setAid : (AllergyID) input;
- (void) setName : (NSString*) input;
- (void) setDescription : (NSString*) input;
@end
