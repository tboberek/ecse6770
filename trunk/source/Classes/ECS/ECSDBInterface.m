//
//  ECSDBInterface.m
//  MobileHIS
//
//  Created by T.J. Boberek on 12/8/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ECSDBInterface.h"

@implementation ECSDBInterface
- (ECSResult) verifyUserCredentials: (NSString*) username password: (NSString*) password
{
	return ECS_LOGIN_FAILURE;
}

@end
