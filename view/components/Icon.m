//
//  Icon.m
//  Stylometer
//
//  Created by Saad Shams on 4/21/11.
// All rights reserved.
//

#import "Icon.h"
#import "Animations.h"
#import "Logs.h"


@implementation Icon

@synthesize id, rating, delegate;

- (void)initialize {
    [super initialize];
    originalFrame = self.frame;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [delegate setIconID:self.id];
    [delegate resetIcons];
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if([delegate getIconID] == self.id){
        [super touchesMoved:touches withEvent:event];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {    
    if ([delegate checkCollision:self.id]) {
        [delegate submerge:self.id];
    } else {
        [self reset];
    }
}

- (void)reset {
    [Animations animateViewTo:self frame:originalFrame alpha:1 duration:.15 delay:0 options:UIViewAnimationCurveEaseIn delegate:nil selector:nil];
}

@end
