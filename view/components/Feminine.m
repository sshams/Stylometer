//
//  Feminine.m
//  Stylometer
//
//  Created by Saad Shams on 4/18/11.
//  All rights reserved.
//

#import "Feminine.h"
#import "Animations.h"
#import "Icon.h"
#import "PersonalityVO.h"
#import "CGRects.h"
#import "NSArrays.h"


@implementation Feminine

@synthesize objects, ratings, gender, delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        gender = [[Gender alloc] init];
        [gender setDelegate:self];
        kTotalObjects = 8;
        
        [self setRatings:[NSArray arrayWithObjects:
                          [NSNumber numberWithInt:3], [NSNumber numberWithInt:6], 
                          [NSNumber numberWithInt:3], [NSNumber numberWithInt:3],
                          [NSNumber numberWithInt:6], [NSNumber numberWithInt:6],
                          [NSNumber numberWithInt:3], [NSNumber numberWithInt:6],
                          nil]];
    }
    return self;
}

- (void)transitionIn {
}

- (void)transitionInDidComplete {
}

- (void)animateIn {
    [Animations animateViewFrom:genderBackground x:0 y:0 width:0 height:0 relative:YES alpha:0 duration:1 delay:1 options:UIViewAnimationCurveEaseIn delegate:nil selector:nil];
    
    [Animations animateViewFrom:target x:0 y:0 width:0 height:0 relative:YES alpha:0 duration:.5 delay:.5 options:UIViewAnimationCurveEaseOut delegate:nil selector:nil];
    
    [gender animateIn:objects delegate:nil selector:nil];
}

- (void)animateInDidComplete {
    
}

- (void)animateOut {
    
}

- (void)animateOutDidComplete {
    
}

- (void)transitionOut {
    [Animations animateViewTo:self.view x:0 y:0 width:0 height:0 relative:YES alpha:0 duration:.5 delay:0 options:UIViewAnimationCurveLinear delegate:self selector:@selector(transitionOutDidComplete)];
}

- (void)transitionOutDidComplete {
    [self.view removeFromSuperview];
    [self reset];
}

- (void)reset {
    [gender reset];
    [gender resetIcons:objects];
    self.view.alpha = 1;
}

- (void)next:(PersonalityEnum *)personalityEnum {
    PersonalityVO *personalityVO = [[PersonalityVO alloc] init];
    personalityVO.personalityEnum = personalityEnum;
    [delegate next:[personalityVO autorelease]];
}

#pragma mark - IconDelegate Methods

- (BOOL)checkCollision:(int)id {
    return [gender checkCollision:((Icon *)[objects objectAtIndex:id]).frame rect2:target.frame];
}

- (void)submerge:(int)id {
    [gender submerge:((Icon *)[objects objectAtIndex:id])];
}

- (void)setIconID:(int)id { //id of the icon that was touched
    [gender setIconID:id];
}

- (int)getIconID {
    return [gender getIconID];
}

- (void)resetIcons {
    [gender resetIcons:objects];
}

- (void)dealloc
{
    [super dealloc];
    [objects release];
    [ratings release];
    [gender release];
    objects = nil;
    ratings = nil;
    gender = nil;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setObjects:[NSArrays sort:objects initWithKey:@"tag" ascending:YES]]; //sort objects tag wise
    
    [gender viewDidLoad:self objects:objects ratings:ratings];
    
    iconFrames = [CGRects getCGRects:objects]; //store their original frames for resetting them back.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
