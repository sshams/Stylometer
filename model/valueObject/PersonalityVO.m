//
//  PersonalityVO.m
//  Stylometer
//
//  Created by Saad Shams on 4/26/11.
//  All rights reserved.
//

#import "PersonalityVO.h"


@implementation PersonalityVO

@synthesize personalityEnum;

- (id)init {
    self = [super init];
    if (self) {
        // Custom initialization
        personalityEnum = [[PersonalityEnum alloc] init];
    }
    return self;
}

@end
