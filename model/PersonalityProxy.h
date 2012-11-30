//
//  PersonalityProxy.h
//  Stylometer
//
//  Created by Saad Shams on 4/26/11.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Proxy.h"
#import "PersonalityVO.h"


@interface PersonalityProxy : Proxy {
    
}

- (void)setPersonalityVO:(PersonalityVO *)personalityVO;
- (PersonalityVO *)getPersonalityVO;

@end
