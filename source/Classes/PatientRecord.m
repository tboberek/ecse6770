//
//  PatientRecord.m
//  MobileHIS
//
//  Created by Evan Lonergan on 10/25/09.
//  Copyright 2009 Phoenix. All rights reserved.
//

#import "PatientRecord.h"
#import "secondlevelviewcontroller.h"
#import "NavAppDelegate.h"




@implementation PatientRecord
@synthesize controllers;

-(id)initWithStyle:(UITableViewStyle)style{
	if (self = [super initWithStyle:style]) {
		
	}
	return self;
}

-(void)viewDidLoad {
	self.title = @"Patient";
	NSMutableArray *array = [[NSMutableArray alloc] init];
	self.controllers = array;
	[array release];
	[super viewDidLoad];
}

-(void)dealloc {
	[controllers release];
	[super dealloc];
}

#pragma mark -
#pragma mark Table Data Source Methods
-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section {
	return [self.controllers count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView
		cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *PatientRecordCell = @"PatientRecordCell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:PatientRecordCell];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier: PatientRecordCell] autorelease];
		
	}
	
	NSInteger row = [indexPath row];
	secondlevelviewcontroller *controller = [controllers objectAtIndex:row];
	cell.textLabel.text = controller.title;
	cell.imageView.image = controller.rowImage;
	return cell;
	
}	
	
#pragma mark -
#pragma mark Table View Delegate Methods
-(UITableViewCellAccessoryType)tableView:(UITableView *)tableView
accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath
{
	return UITableViewCellAccessoryDisclosureIndicator;
}	

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSUInteger row = [indexPath row];
	secondlevelviewcontroller *nextController = [self.controllers objectAtIndex:row];
	
	NavAppDelegate *delegate = 
	[[UIApplication sharedApplication]delegate];
	[delegate.navController pushViewController:nextController animated:YES];
}


@end



