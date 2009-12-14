//
//  ECSDBInterfaceFactory.h
//  MobileHIS
//
//  Created by T.J. Boberek on 12/12/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

// The root ECSDBInterface types
#import "ECSDBInterface.h"

@interface ECSDBInterfaceFactory : NSObject 
{

}

+ (ECSDBInterface*) createDBInterface : (NSString*) connectionName;

@end
