//
//  ECSConnectionSQLite.m
//  MobileHIS
//
//  Created by T.J. Boberek on 12/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ECSDBInterfaceSQLite.h"

@implementation ECSDBInterfaceSQLite
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


- (ECSRoleID) verifyLogin: (NSString*) username password: (NSString*) password
{
	ECSRoleID result = ECS_ROLE_INVALID;
	
	if ([self isConnected])
	{
		const char* sql = "SELECT password, role_id FROM HOSPITAL_STAFF WHERE name='Test Doctor'";
		sqlite3_stmt* statement = nil;
		
		if (SQLITE_OK == sqlite3_prepare_v2 (database, sql, -1, &statement, nil))
		{
			// Bind our username to the statement
			//sqlite3_bind_text (statement, 1, [username UTF8String], -1,	SQLITE_TRANSIENT);
			
			// Attempt to execute the statement, which should only return a
			// single row
			int sqlResult = sqlite3_step (statement);
			if (SQLITE_ROW == sqlResult)
			{
				// TODO: We should be one-way hashing these passwords
				NSString* dbPassword = [[NSString alloc] initWithCString: 
										(char*) sqlite3_column_text (statement, 0)];
				
				// If the dbPassword equals the input password, then get the role
				// ID to determine our login result
				if ([dbPassword isEqualToString: password])
				{
					result = sqlite3_column_int (statement, 1);
				}
			}
		}
	}
	
	return result;	
}



- (NSDictionary*) retrieveAllPatients
{
	NSMutableDictionary* patients = [NSMutableDictionary new];
	
	// Get the list of patient IDs
	NSArray* patientIDs = [[self retrieveAllPatientIDs] retain];
	
	// Create an enumerator and an enumeration object
	NSEnumerator* idEnumberator = [patientIDs objectEnumerator];
	NSNumber* patientID = nil;
	
	// Iterator through the ids and get the patient chart for
	// each one
	while (patientID = [idEnumberator nextObject])
	{
		[patients setObject: [self retrievePatient: [patientID intValue]] 
					 forKey: patientID];
	}
	
	return patients;	
}

- (NSArray*) retrieveAllPatientIDs
{
	NSMutableArray* ids = nil;
	
	if ([self isConnected])
	{
		const char*	sql = "SELECT ID FROM PATIENTS";
		sqlite3_stmt* statement = nil;
		
		if (SQLITE_OK == sqlite3_prepare_v2 (database, sql, -1, &statement, nil))
		{
			// Attempt to execute the statement, which should only return a single row
			while (SQLITE_ROW == sqlite3_step (statement))
			{
				NSNumber* pid = 
					[NSNumber numberWithInt: sqlite3_column_int (statement, 0)];
				
				// Create the array if we need too
				if (nil == ids)
				{
					ids = [NSMutableArray arrayWithObject: pid];
				}
				else 
				{
					[ids addObject: pid];
				}
			}
			// Clean up the sqlite resources
			sqlite3_finalize (statement);
		}
	}
	
	return ids;	
}

- (DBPatientVital*) retrievePatientVital : (int) vid
{
	DBPatientVital* vitals = nil;
	
	if ([self isConnected])
	{
		const char*	sql = "SELECT PATIENT_ID,TEMP,BLOOD_PRESSURE,PULSE,COMMENTS,TAKEN_BY FROM PATIENT_VITALS WHERE ID=?";
		sqlite3_stmt* statement = nil;
		
		if (SQLITE_OK == sqlite3_prepare_v2 (database, sql, -1, &statement, nil))
		{
			// Bind our vid to the sql statement
			sqlite3_bind_int (statement, 1, vid);
			// Attempt to execute the statement, which should only return a single row
			if (SQLITE_ROW == sqlite3_step (statement))
			{
				vitals = [DBPatientVital alloc];
				[vitals setPid: sqlite3_column_int (statement, 0)];
				[vitals setTemp: [[NSString alloc] initWithCString: (char*) sqlite3_column_text (statement, 1)]];
				[vitals setBloodPressure: [[NSString alloc] initWithCString: (char*) sqlite3_column_text (statement, 2)]];
				[vitals setPulse: [[NSString alloc] initWithCString: (char*) sqlite3_column_text (statement, 3)]];
				[vitals setComment: [[NSString alloc] initWithCString: (char*) sqlite3_column_text (statement, 4)]];
				[vitals setTakenBy: [[NSString alloc] initWithCString: (char*) sqlite3_column_text (statement, 5)]];
			}
			
			// Clean up the sqlite resources
			sqlite3_finalize (statement);
			
		}	
	}
	
	return vitals;
}

// Functions to load from the database
- (DBPatient*) retrievePatient: (PatientID) pid
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


- (int) addPatientVital : (DBPatientVital*) vitals
{
	int vid = -1;
	
	if ([self isConnected])
	{
		const char*	sql = "INSERT INTO PATIENT_VITALS (PATIENT_ID,TEMP,BLOOD_PRESSURE,PULSE,COMMENTS,TAKEN_BY) VALUES(?,?,?,?,?,?)";
		sqlite3_stmt* statement = nil;
		
		if (SQLITE_OK == sqlite3_prepare_v2(database, sql, -1, &statement, nil))
		{
			// Bind our variables
			sqlite3_bind_int (statement, 1, [vitals pid]);
			sqlite3_bind_text (statement, 2, [[vitals temp] UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text (statement, 3, [[vitals bloodPressure] UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text (statement, 4, [[vitals pulse] UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text (statement, 5, [[vitals comment] UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text (statement, 6, [[vitals takenBy] UTF8String], -1, SQLITE_TRANSIENT);
			
			// Attempt to insert our statement
			if (SQLITE_DONE == sqlite3_step (statement))
			{
				vid = sqlite3_last_insert_rowid (database);
			}
			
			// Finalize our sqlite statement to clean it up
			sqlite3_finalize (statement);
		}
	}
	
	return vid;	
}

- (MedicationID) addMedication : (DBMedication*) medication
{
	MedicationID mid = -1;
	
	if ([self isConnected])
	{
		const char*	sql = "INSERT INTO MEDICATIONS (NAME,DESCRIPTION,DRUG_INTERACTIONS,SIDE_EFFECTS) VALUES(?,?,?,?)";
		sqlite3_stmt* statement = nil;
		
		if (SQLITE_OK == sqlite3_prepare_v2(database, sql, -1, &statement, nil))
		{
			// Bind our variables
			sqlite3_bind_text (statement, 1, [[medication name] UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text (statement, 2, [[medication description] UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text (statement, 3, [[medication drugInteractions] UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text (statement, 4, [[medication sideEffects] UTF8String], -1, SQLITE_TRANSIENT);
			
			// Attempt to insert our statement
			if (SQLITE_DONE == sqlite3_step (statement))
			{
				mid = sqlite3_last_insert_rowid (database);
			}
			
			// Finalize our sqlite statement to clean it up
			sqlite3_finalize (statement);
		}
	}
	
	return mid;
}

// Functions to update the database
- (BOOL) updatePatient : (DBPatient*) patient
{
	bool updateSuccessful = NO;
	
	if ([self isConnected])
	{
		const char*	sql = "UPDATE PATIENTS SET NAME=?,SEX=?,DATE_OF_BIRTH=?,PASSWORD=?,ADDRESS=?,CITY=?,STATE=?,ZIP=?,PHONE=?,EMAIL=? WHERE ID=?";
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
			sqlite3_bind_int (statement, 11, [patient pid]);
			
			// Attempt to insert our statement
			if (SQLITE_DONE == sqlite3_step (statement))
			{
				updateSuccessful = YES;
			}
			
			// Finalize our sqlite statement to clean it up
			sqlite3_finalize (statement);
		}
	}
	
	return updateSuccessful;
}

@end
