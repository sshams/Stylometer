//
//  PersonalityVO.h
//  Stylometer
//
//  Created by Saad Shams on 4/26/11.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonalityEnum.h"


@interface PersonalityVO : NSObject {
    PersonalityEnum *personalityEnum;
}

@property (nonatomic, retain) PersonalityEnum *personalityEnum;

@end
