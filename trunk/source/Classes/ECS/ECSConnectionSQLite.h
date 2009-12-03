//
//  ECSConnectionSQLite.h
//  MobileHIS
//
//  Created by T.J. Boberek on 12/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "ECSConnection.h"



@interface ECSConnectionSQLite : NSObject <ECSConnection>
{
	sqlite3* database;
}

- (BOOL) initDatabaseConnection : (NSString*) filename;
- (BOOL) doesEditableFileExist : (NSString*) filename;
- (BOOL) createEditableFileCopy : (NSString*) filename;

- (NSString*) getEditablePath : (NSString*) filename;

@end
