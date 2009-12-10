//
//  UTBasicTests.m
//  MobileHIS
//
//  Created by T.J. Boberek on 12/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "UTBasicTests.h"
#import "DBClasses.h"
#import "ECSConnection.h"

@implementation UTBasicTests
bool UTResultsValidation (bool testResult, NSMutableString* resultString)
{
	if (testResult)
	{
		[resultString appendString:@"Passed"];
	}
	else 
	{
		[resultString appendString:@"Failed"];
	}
	
	return testResult;
}
		

bool UTTestConnection (ECSConnectionSQLite* connection, NSMutableString* resultString)
{
	// Label the test
	[resultString appendString:@"DB Connection: "];
	
	// Return the result of the test and add the result to the string
	return UTResultsValidation ([sqlConnection open: @"test-database.sqlite"], resultString);
}
@end