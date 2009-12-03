//
//  ECSConnectionSQLite.m
//  MobileHIS
//
//  Created by T.J. Boberek on 12/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ECSConnectionSQLite.h"


@implementation ECSConnectionSQLite
- (id) init
{
	if ( self = [super init])
	{
		database = nil;
	}
	
	return self;
}

- (void) dealloc
{
	// Close any open database connections
	[self close];
	
	// Call our base classes deallocate
	[super dealloc];
}

- (BOOL) open : (NSString*) filename
{
	// Assume that we're going to fail
	//BOOL success = NO;
	
	// Check to see if there is an editable copy of the database
	if (![self doesEditableFileExist : filename])
	{
		// If there is not an editable copy of the database, create one
		// from the default version
		[self createEditableFileCopy : filename];
	}
	
	// Create the connection from the database
	return [self initDatabaseConnection: filename];
}

- (void) close
{
	// Close the database connection
	sqlite3_close (database);

	// Make sure our database connection is
	// pointing to nil
	database = nil;
}

- (BOOL) initDatabaseConnection : (NSString*) filename
{
	// Assume that we're going to file
	BOOL success = NO;
	
	// Get the path from that database
	NSString* filePath = [self getEditablePath: filename];
	
	// Attempt to open the database connection
	if (sqlite3_open ([filePath UTF8String], &database) == SQLITE_OK)
	{
		success = YES;
	}
	
	return success;
}

- (BOOL) doesEditableFileExist: (NSString *) filename
{
	// Get the default file manager
	NSFileManager* fileManager = [NSFileManager defaultManager];

	// Get the destination editable path we want
	NSString* filePath = [self getEditablePath: filename];

	// Return whether or not we have the file in an editable path
	return [fileManager fileExistsAtPath: filePath];
}

- (BOOL) createEditableFileCopy: (NSString*) filename
{
	// Get the default file manager
	NSFileManager* fileManager = [NSFileManager defaultManager];
	
	// Get the default resource path in the bundle
	NSString* resourcePath = [[NSBundle mainBundle] resourcePath];
	
	// Append the name of the tile we want an editable copy of
	NSString* srcPath = [resourcePath stringByAppendingPathComponent: filename];
	
	// Get the destination editable path we want
	NSString* dstPath = [self getEditablePath: filename];
	
	// Try to copy the file, and return the result
	return [fileManager copyItemAtPath: srcPath toPath: dstPath error: nil];
	
}

- (BOOL) initEditableFileCopy: (NSString*) filename
{
	// Assume we're going to fail
	BOOL success = NO;
	
	// Get the default file manager
	NSFileManager* fileManager = [NSFileManager defaultManager];
		
	// Get the destination editable path we want
	NSString* dstPath = [self getEditablePath: filename];
	
	// Delete any file at the destination path
	if ([fileManager removeItemAtPath: dstPath error: nil])
	{
		success = [self createEditableFileCopy: filename];
	}
	
	return success;
	
}

- (NSString*) getEditablePath: (NSString*) filename
{
	// Get the documents directory from the list of document directories
	NSArray* paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
	NSString* editablePath = [paths objectAtIndex: 0];
	
	// Create the full path to the editable DB
	NSString* filePath = [editablePath stringByAppendingPathComponent: filename];
	
	return filePath;
}

- (BOOL) isConnected
{
	return (database != nil);
}

// Functions to load from the database
- (DBPatient*) getPatient : (PatientID) pid
{
	DBPatient* patient = nil;
	
	if ([self isConnected])
	{
		const char*	sql = "SELECT ID,NAME,SEX,DATE_OF_BIRTH,PASSWORD,ADDRESS,CITY,STATE,ZIP,PHONE,EMAIL FROM PATIENTS WHERE id=?";
		sqlite3_stmt* statement = nil;
		
		if (SQLITE_OK == sqlite3_prepare_v2 (database, sql, -1, &statement, nil))
		{
			// Bind our pid to the sql statement
			sqlite3_bind_int (statement, 1, pid);
			
			// Attempt to execute the statement, which should only return a single row
			if (SQLITE_ROW == sqlite3_step (statement))
			{
				patient = [DBPatient alloc];
				[patient setPid:  sqlite3_column_int (statement, 0)];
				[patient setName: [[NSString alloc] initWithCString: (char*)sqlite3_column_text (statement, 1)]];
				[patient setSex: [[NSString alloc] initWithCString: (char*)sqlite3_column_text (statement, 2)]];
				[patient setDob: [[NSDate alloc] initWithString: 
								  [[NSString alloc] initWithCString: (char*)sqlite3_column_text (statement, 3)]]];
				[patient setPassword: [[NSString alloc] initWithCString: (char*)sqlite3_column_text (statement, 4)]];
				[patient setAddress: [[NSString alloc] initWithCString: (char*)sqlite3_column_text (statement, 5)]];
				[patient setCity: [[NSString alloc] initWithCString: (char*)sqlite3_column_text (statement, 6)]];
				[patient setState: [[NSString alloc] initWithCString: (char*)sqlite3_column_text (statement, 7)]];
				[patient setZip: [[NSString alloc] initWithCString: (char*)sqlite3_column_text (statement, 8)]];
				[patient setPhone: [[NSString alloc] initWithCString: (char*)sqlite3_column_text (statement, 9)]];
				[patient setEmail: [[NSString alloc] initWithCString: (char*)sqlite3_column_text (statement, 10)]];
			}
			
			// Clean up the sqlite resources
			sqlite3_finalize (statement);
		}
	}
	
	return patient;
}

// Functions to add to the database
- (PatientID) addPatient : (DBPatient*) patient
{
	PatientID pid = -1;
	
	if ([self isConnected])
	{
		const char*	sql = "INSERT INTO PATIENTS (NAME,SEX,DATE_OF_BIRTH,PASSWORD,ADDRESS,CITY,STATE,ZIP,PHONE,EMAIL) VALUES(?,?,?,?,?,?,?,?,?,?)";
		sqlite3_stmt* statement = nil;
		
		if (SQLITE_OK == sqlite3_prepare_v2(database, sql, -1, &statement, nil))
		{
			// Bind our variables
			sqlite3_bind_text (statement, 1, [[patient name] UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text (statement, 2, [[patient sex] UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text (statement, 3, [[[patient dob] description] UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text (statement, 4, [[patient password] UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text (statement, 5, [[patient address] UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text (statement, 6, [[patient city] UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text (statement, 7, [[patient state] UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text (statement, 8, [[patient zip] UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text (statement, 9, [[patient phone] UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text (statement, 10, [[patient email] UTF8String], -1, SQLITE_TRANSIENT);
			
			// Attempt to insert our statement
			if (SQLITE_DONE == sqlite3_step (statement))
			{
				pid = sqlite3_last_insert_rowid (database);
			}
			
			// Finalize our sqlite statement to clean it up
			sqlite3_finalize (statement);
		}
	}
	
	return pid;
}

@end
