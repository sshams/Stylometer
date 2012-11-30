//
//  Result.h
//  Stylometer
//
//  Created by Saad Shams on 4/26/11.
//  All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimationDelegate.h"
#import "PersonalityEnum.h"
#import "AudioPlayer.h"


@protocol ResultDelegate <NSObject>

- (enum PERSONALITY)getPersonality;
- (void)next;

@end


@interface Result : UIViewController<AnimationDelegate> {
    IBOutletCollection(id)NSArray *objects;
    
    IBOutlet UIImageView *heading;
    IBOutlet UIImageView *description;
    
    AudioPlayer *audioPlayer;
    
    id<ResultDelegate>delegate;
}

@property (nonatomic, retain) IBOutletCollection(id)NSArray *objects;
@property (nonatomic, retain) id<ResultDelegate>delegate;

- (void)setPersonality:(enum PERSONALITY)personality;
- (IBAction)terminer;

@end
