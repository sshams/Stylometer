//
//  Feminine.h
//  Stylometer
//
//  Created by Saad Shams on 4/18/11.
//  All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimationDelegate.h"
#import "Gender.h"
#import "Icon.h"
#import "PersonalityVO.h"


@protocol FeminineDelegate <NSObject>

- (void)next:(PersonalityVO *)personalityVO;

@end

@interface Feminine : UIViewController<AnimationDelegate, IconDelegate, GenderDelegate> {
    IBOutletCollection(Icon) NSArray *objects;
    IBOutlet UIImageView *genderBackground;
    IBOutlet UIImageView *target;
    
    Gender *gender;
    
    CGRect *iconFrames;
    int kTotalObjects;
    
    NSArray *ratings;
    
    id<FeminineDelegate>delegate;
}

@property (nonatomic, retain) IBOutletCollection(Icon) NSArray *objects;
@property (nonatomic, retain) NSArray *ratings;
@property (nonatomic, retain) Gender *gender;

@property (nonatomic, retain) id<FeminineDelegate>delegate;

@end
