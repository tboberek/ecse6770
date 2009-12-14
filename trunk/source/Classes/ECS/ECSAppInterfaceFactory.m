//
//  ECSAppInterfaceFactory.m
//  MobileHIS
//
//  Created by T.J. Boberek on 12/12/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ECSAppInterfaceFactory.h"

@implementation ECSAppInterfaceFactory

+ (ECSAppInterface*) createAppInterface
{
	// We currently only have one kind of app interface,
	// so we return that
	return [ECSAppInterface alloc];
}

@end
