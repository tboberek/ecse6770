//
//  DBProcedure.h
//  MobileHIS
//
//  Created by T.J. Boberek on 12/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBTypes.h"

@interface DBProcedure : NSObject 
{
	ProcedureID pid;
	NSString*	name;
	NSString*	description;
}

- (ProcedureID) pid;
- (NSString*)	name;
- (NSString*)	description;

- (void) setPid :	(ProcedureID) input;
- (void) setName :	(NSString*) input;
- (void) setDescription : (NSString*) input;

@end
