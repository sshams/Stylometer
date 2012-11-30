//
//  Bio.h
//  stylometer
//
//  Created by Saad Shams on 2/7/11.
//   All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimationDelegate.h"
#import "AudioPlayer.h"


@protocol BioDelegate

- (void)masculine;
- (void)feminine;

@end


@interface Bio : UIViewController<UITextFieldDelegate, AnimationDelegate> {
@private
    IBOutlet UITextField *age;
    int ageLimit;
    id<BioDelegate>delegate;
    IBOutletCollection(id) NSArray *objects;
    int gender;
    AudioPlayer *audioPlayer;
}

@property (nonatomic, retain) IBOutlet UITextField *age;
@property (nonatomic, retain) id<BioDelegate>delegate;
@property (nonatomic, retain) IBOutletCollection(id) NSArray *objects;

- (IBAction)masculine:(id)sender;
- (IBAction)feminin:(id)sender;
- (BOOL)verifyAge;
- (IBAction)backgroundTouch:(id)sender;
- (void)reset;

@end
