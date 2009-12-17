//
//  SecondViewController.m
//  MobileHISLookUp
//
//  Created by Evan Lonergan on 12/6/09.
//  Copyright 2009 Phoenix. All rights reserved.
//

#import "SecondViewController.h"
#import "ECSInterface.h"

@implementation SecondViewController
@synthesize listData;
//@synthesize search;

#pragma mark Table View Controller Methods
-(void)viewDidLoad
{
	// Create a connection to the database
	ECSInterface* ecs = [ECSInterface alloc];
	
	// Log In with test data
	[ecs logIn: @"Test Doctor" password: @"Test Password"];
	
	// Get the list of patients
	NSDictionary* patientList = [ecs getPatientList];	
	
	self.listData = [patientList allValues];
	
	[patientList dealloc];
	[super viewDidLoad];
}

-(BOOL)shouldAutororateToInterfaceOrientation:
					  (UIInterfaceOrientation)interfaceOrientation{
					  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
					  
-(void)didReceiveMemoryWarning{
					  [super didReceiveMemoryWarning];
					  }
					  
					  
-(void)dealloc{
	[listData release];
	[super dealloc];
 }
					  
#pragma mark - 
#pragma mark Table View Data Source Methods					  
-(NSInteger)tableView:(UITableView *)tableView
					  numberOfRowsInSection:(NSInteger)section
					  {
					  return [self.listData count];
					  }
-(UITableViewCell *)tableView:(UITableView *)tableView
cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero 
									   reuseIdentifier:SimpleTableIdentifier]autorelease];
		
	}
									
	NSUInteger row = [indexPath row];
	cell.text = [listData objectAtIndex:row];
	UIImage *image = [UIImage imageNamed:@"red-cross-24x24.png"];
	cell.image = image;
	return cell;
}
	
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
	search.text=@"";
	[self resetSearch];
	
	[searchBar resignFirstResponder];
}

@end
