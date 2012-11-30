//
//  Result.m
//  Stylometer
//
//  Created by Saad Shams on 4/26/11.
//  All rights reserved.
//

#import "Result.h"
#import "NSArrays.h"
#import "Animations.h"


@implementation Result

@synthesize objects, delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        audioPlayer = [[AudioPlayer alloc] init:@"click" ofType:@"mp3"];
    }
    return self;
}

- (void)transitionIn {
    [Animations animateViewFrom:self.view x:0 y:0 width:0 height:0 relative:YES alpha:0 duration:.5 delay:0 options:UIViewAnimationCurveEaseOut delegate:self selector:@selector(transitionInDidComplete)];
    [self animateIn];
}

- (void)transitionInDidComplete {
}

- (void)animateIn {
    [self setPersonality:[delegate getPersonality]];
    [Animations animateViewsFrom:objects x:0 y:10 width:0 height:0 relative:YES alpha:0 duration:.5 delay:.25 stagger:.1 options:UIViewAnimationCurveEaseOut delegate:self selector:@selector(animateInDidComplete)];
}

- (void)animateInDidComplete {
    
}

- (void)animateOut {
    [Animations animateViewsTo:objects x:0 y:-10 width:0 height:0 relative:YES alpha:0 duration:.5 delay:0 stagger:.1 options:UIViewAnimationCurveEaseOut delegate:self selector:@selector(animateOutDidComplete)];
}

- (void)animateOutDidComplete {
    [delegate next];
}

- (void)transitionOut {
}

- (void)transitionOutDidComplete {
}

- (void)reset {
    [Animations animateViewsTo:objects x:0 y:10 width:0 height:0 relative:YES alpha:1 duration:.1 delay:0 stagger:0 options:UIViewAnimationCurveLinear delegate:nil selector:nil];
}

- (void)setPersonality:(enum PERSONALITY)personality {

    switch (personality) {
        case TOP:
            [heading setImage:[UIImage imageNamed:@"top.png"]];
            [description setImage:[UIImage imageNamed:@"top_description.png"]];
            break;
        case STYLISH:
            [heading setImage:[UIImage imageNamed:@"stylish.png"]];
            [description setImage:[UIImage imageNamed:@"stylish_description.png"]];
            break;
            
        case TRENDY:
            [heading setImage:[UIImage imageNamed:@"trendy.png"]];
            [description setImage:[UIImage imageNamed:@"trendy_description.png"]];
            break;
            
        default:
            break;
    }
}

- (IBAction)terminer {
    [audioPlayer play];
    [self animateOut];
}

- (void)dealloc
{
    [super dealloc];
    [audioPlayer release];
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
    [self setObjects:[NSArrays sort:objects initWithKey:@"tag" ascending:YES]];
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
