//
//  Instructions.h
//  Stylometer
//
//  Created by Saad Shams on 4/13/11.
//  All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimationDelegate.h"
#import "AudioPlayer.h"


@protocol InstructionsDelegate <NSObject>

- (void)next;

@end

@interface Instructions : UIViewController <AnimationDelegate> {
    IBOutletCollection(UIImageView) NSArray *objects;
    AudioPlayer *audioPlayer;
    id<InstructionsDelegate>delegate;
}

@property (nonatomic, retain) IBOutletCollection(UIImageView) NSArray *objects;
@property (nonatomic, retain) id<InstructionsDelegate>delegate;

- (IBAction)click;

@end
