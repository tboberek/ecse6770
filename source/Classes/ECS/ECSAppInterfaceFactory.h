//
//  ECSAppInterfaceFactory.h
//  MobileHIS
//
//  Created by T.J. Boberek on 12/12/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ECSAppInterface.h"

@interface ECSAppInterfaceFactory : NSObject 
{

}

+ (ECSAppInterface*) createAppInterface;

@end
