//
//  DBDiagnosticResult.h
//  MobileHIS
//
//  Created by T.J. Boberek on 12/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBTypes.h"

@interface DBDiagnosticResult : NSObject 
{
	PatientID			pid;
	DiagnosticTestID	did;
	NSString*			result;
	NSString*			normalData;
	NSDate*				testDate;
	NSString*			orderedBy;
}

- (PatientID)			pid;
- (DiagnosticTestID)	did;
- (NSString*)			result;
- (NSString*)			normalData;
- (NSDate*)				testDate;
- (NSString*)			orderedBy;

- (void) setPid : (PatientID) input;
- (void) setDid : (DiagnosticTestID) input;
- (void) setResult : (NSString*) input;
- (void) setNormalData : (NSString*) input;
- (void) setTestDate : (NSDate*) input;
- (void) setOrderedBy : (NSString*) input;

@end
