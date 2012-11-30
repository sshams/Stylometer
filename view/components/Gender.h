//
//  Gender.h
//  Stylometer
//
//  Created by Saad Shams on 4/19/11.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Icon.h"
#import "PersonalityEnum.h"
#import "AudioPlayer.h"


@protocol GenderDelegate <NSObject>

- (void)next:(PersonalityEnum *)personalityEnum;

@end

@interface Gender : NSObject {
    int iconID;
    NSMutableArray *submergedIconIDs;
    
    int submergedTotal;
    int kSubmergedTotal;
    int ratingTotal;
    
    AudioPlayer *audioPlayer;
    
    id<GenderDelegate>delegate;
}

@property (nonatomic, retain) id<GenderDelegate>delegate;

- (void)animateIn:(NSArray *)images delegate:(id)delegate selector:(SEL)selector;
- (void)resetIcons:(NSArray *)objects;

- (void)setIconID:(int)id;
- (int)getIconID;

- (BOOL)checkCollision:(CGRect)rect1 rect2:(CGRect)rect2;
- (void)submerge:(Icon *)icon;
- (void)submergeDidComplete;
- (BOOL)isSubmerged:(int)id;

- (void)viewDidLoad:(id<IconDelegate>)iconDelegate objects:(NSArray *)objects ratings:(NSArray *)ratings;

- (PersonalityEnum *)personalityEnum;

- (void)reset;

@end
