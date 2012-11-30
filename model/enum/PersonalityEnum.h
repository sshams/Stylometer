//
//  PersonalityEnum.h
//  Stylometer
//
//  Created by Saad Shams on 4/25/11.
//  All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PersonalityEnum : NSObject {
    enum PERSONALITY { 
        STYLISH, 
        TOP, 
        TRENDY 
    } personality;
}

@property (readwrite, assign)enum PERSONALITY personality;

@end
