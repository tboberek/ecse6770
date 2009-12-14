//
//  ECSDBInterfaceFactory.m
//  MobileHIS
//
//  Created by T.J. Boberek on 12/12/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ECSDBInterfaceFactory.h"

// The concrete ECS interface classes we will
// be returning
#import "ECSDBInterfaceSQLite.h"



@implementation ECSDBInterfaceFactory

+ (ECSDBInterface*) createDBInterface : (NSString*) connectionName
{
	// Determine the type of connection we have
	// TODO: Currently assuming an SQLite connection
	ECSDBInterface* dbInt = [ECSDBInterfaceSQLite alloc];
	
	// Attempt to open the connection.  If we fail, we will return
	// nil
	if (![dbInt open: connectionName])
	{
		dbInt = nil;
	}
	
	// Create and return the new DB connection
	return dbInt;
}

@end
