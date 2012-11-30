//
//  Gender.m
//  Stylometer
//
//  Created by Saad Shams on 4/19/11.
//  All rights reserved.
//

#import "Gender.h"
#import "Animations.h"
#import "Icon.h"
#import "NSArrays.h"


@implementation Gender

@synthesize delegate;

- (id)init {
    self = [super init];
    if (self) {
        // Custom initialization
        iconID = 0;
        submergedTotal = 0;
        kSubmergedTotal = 4;
        ratingTotal = 0;
        submergedIconIDs = [[NSMutableArray alloc] init];
        
        audioPlayer = [[AudioPlayer alloc] init:@"click" ofType:@"mp3"];
    }
    return self;
}

- (void)setIconID:(int)id { //id of the icon that was touched
    iconID = id;
}

- (int)getIconID {
    return iconID;
}

#pragma mark - Collision-Submerge

- (BOOL)checkCollision:(CGRect)rect1 rect2:(CGRect)rect2 {
    return CGRectIntersectsRect(rect1, rect2);
}

- (void)submerge:(Icon *)icon {
    submergedTotal++;
    ratingTotal += icon.rating;
    
    [submergedIconIDs addObject:[NSNumber numberWithInt:icon.id]];
    CGRect frame = CGRectMake(400, 285, icon.frame.size.width/2, icon.frame.size.height/2);
    [Animations animateViewTo:icon frame:frame alpha:0 duration:.25 delay:0 options:UIViewAnimationCurveEaseIn delegate:self selector:@selector(submergeDidComplete)];
    
    [audioPlayer play];
}

- (void)submergeDidComplete {
    if(submergedTotal == kSubmergedTotal){
        [delegate next:[self personalityEnum]];
    }
}

- (BOOL)isSubmerged:(int)id {
    int count = [submergedIconIDs count];
    
    for(int i=0; i<count; i++){
        if(id == [[submergedIconIDs objectAtIndex:i] intValue]){
            return YES;
        }
    }
    return NO;
}

#pragma mark - Result

- (PersonalityEnum *)personalityEnum {
    
    PersonalityEnum *personalityEnum = [[PersonalityEnum alloc] init];
    
    if(ratingTotal <= 16){
        personalityEnum.personality = STYLISH;
    } else if(ratingTotal <= 20){
        personalityEnum.personality = TRENDY;
    } else if(ratingTotal > 20){
        personalityEnum.personality = TOP;
    }
    
    return [personalityEnum autorelease];
}

#pragma mark - Reset

- (void)resetIcons:(NSArray *)objects {
    int count = [objects count];
    
    for (int i=0; i<count; i++) {
        if (i == iconID || [self isSubmerged:i]) continue; //do not reset if icon is being dragged or was submerged earlier
        
        Icon *icon = [objects objectAtIndex:i];
        [icon reset];
    }
}

- (void)reset {
    iconID = -1;
    submergedTotal = 0;
    kSubmergedTotal = 4;
    ratingTotal = 0;
    
    [submergedIconIDs release];
    submergedIconIDs = [[NSMutableArray alloc] init];
}

#pragma mark - Animations

- (void)animateIn:(NSArray *)buttons delegate:(id)delegate1 selector:(SEL)selector {
    CGRect frame;
    int offset = 15;
    int count = [buttons count];
    
    float duration = 0.2;
    float delay = 0;
    
    for (int i=0; i<count; i++) {
        UIImageView *button = [buttons objectAtIndex:i];
        
        switch (i) {
            case 0:
            case 1:
                frame = CGRectMake(button.frame.origin.x, button.frame.origin.y + offset, button.frame.size.width, button.frame.size.height);
                break;
                
            case 2:
            case 3:
                frame = CGRectMake(button.frame.origin.x - offset, button.frame.origin.y, button.frame.size.width, button.frame.size.height);
                break;
                
            case 4:
            case 5:
                frame = CGRectMake(button.frame.origin.x, button.frame.origin.y - offset, button.frame.size.width, button.frame.size.height);
                break;
                
            case 6:
            case 7:
                frame = CGRectMake(button.frame.origin.x + offset, button.frame.origin.y, button.frame.size.width, button.frame.size.height);
                break;
                
            case 8:
                frame = CGRectMake(button.frame.origin.x, button.frame.origin.y, button.frame.size.width, button.frame.size.height);
                break;
                
            default:
                frame = CGRectMake(button.frame.origin.x, button.frame.origin.y, button.frame.size.width, button.frame.size.height);
                break;
        }
        
        [Animations animateViewFrom:button frame:frame alpha:0 duration:.5 delay:delay options:UIViewAnimationCurveEaseIn delegate:delegate1 selector:selector];
        
        delay += duration / 2;
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad:(id<IconDelegate>)iconDelegate objects:(NSArray *)objects ratings:(NSArray *)ratings {
    
    int count = [objects count];
     
    for (int i=0; i<count; i++) {
        Icon *icon = [objects objectAtIndex:i];
        [icon setDelegate:iconDelegate];
        icon.id = i;
        [icon setRating:[[ratings objectAtIndex:i] intValue]];
    }  
}


@end
