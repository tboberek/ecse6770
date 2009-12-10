//
//  ECSConnectionSQLite.h
//  MobileHIS
//
//  Created by T.J. Boberek on 12/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "ECSDBInterface.h"



@interface ECSDBInterfaceSQLite : ECSDBInterface
{
	sqlite3* database;
}

- (BOOL) initDatabaseConnection : (NSString*) filename;
- (BOOL) doesEditableFileExist : (NSString*) filename;
- (BOOL) createEditableFileCopy : (NSString*) filename;
- (BOOL) initEditableFileCopy : (NSString*) filename;

- (NSString*) getEditablePath : (NSString*) filename;


@end
