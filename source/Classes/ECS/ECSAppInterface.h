//
//  ECSAppInterface.h
//  MobileHIS
//
//  Created by T.J. Boberek on 12/8/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBClasses.h"


@interface ECSAppInterface : NSObject
{

}

- (NSArray*) getAvailableActions: (ECSResult) loginResult;

@end
