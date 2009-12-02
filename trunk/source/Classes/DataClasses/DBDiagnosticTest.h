//
//  DBDiagnosticTest.h
//  MobileHIS
//
//  Created by T.J. Boberek on 12/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBTypes.h"


@interface DBDiagnosticTest : NSObject 
{
	DiagnosticTestID	did;
	NSString*			name;
	NSString*			description;
	NSString*			code;
}

- (DiagnosticTestID)	did;
- (NSString*)			name;
- (NSString*)			description;
- (NSString*)			code;

- (void)	setDID : (DiagnosticTestID) input;
- (void)	setName : (NSString*) input;
- (void)	setDescription : (NSString*) input;
- (void)	setCode : (NSString*) input;

@end
