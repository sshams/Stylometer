//
//  PersonalityProxy.m
//  Stylometer
//
//  Created by Saad Shams on 4/26/11.
//  All rights reserved.
//

#import "PersonalityProxy.h"
#import "PersonalityVO.h"
#import "PersonalityEnum.h"


@implementation PersonalityProxy

+ (NSString *)NAME {
    return @"PersonalityProxy";
}

- (PersonalityVO *)data {
    return data;
}

- (void)initializeProxy {
    [super initializeProxy];
    data = [[PersonalityVO alloc] init];
}

- (void)setPersonalityVO:(PersonalityVO *)personalityVO {
    [data release];
    [personalityVO retain];
    data = personalityVO;
}

- (PersonalityVO *)getPersonalityVO {
    return data;
}

@end
