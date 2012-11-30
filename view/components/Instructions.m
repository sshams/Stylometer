//
//  Instructions.m
//  Stylometer
//
//  Created by Saad Shams on 4/13/11.
//  All rights reserved.
//

#import "Instructions.h"
#import "Animations.h"
#import "NSArrays.h"
#import "Logs.h"


@implementation Instructions

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
    [Animations animateViewTo:self.view x:0 y:0 width:0 height:0 relative:YES alpha:0 duration:.5 delay:0 options:UIViewAnimationCurveEaseOut delegate:self selector:@selector(transitionInDidComplete)];
    [self animateIn];
}

- (void)transitionInDidComplete {
}

- (void)animateIn {
    [Animations animateViewsFrom:objects x:0 y:10 width:0 height:0 relative:YES alpha:0 duration:0.5 delay:0 stagger:.1 options:UIViewAnimationCurveEaseOut delegate:nil selector:nil];
}

- (void)animateInDidComplete {
}

- (void)animateOut {
    [Animations animateViewsTo:objects x:0 y:-10 width:0 height:0 relative:YES alpha:0 duration:.5 delay:0 stagger:.1 options:UIViewAnimationCurveEaseOut delegate:self selector:@selector(animateOutDidComplete)];
}

- (void)animateOutDidComplete {
    [delegate next];
}

- (void)reset {
    [Animations animateViewsTo:objects x:0 y:10 width:0 height:0 relative:YES alpha:1 duration:0 delay:0 stagger:0 options:UIViewAnimationCurveEaseOut delegate:nil selector:nil];
}

- (void)transitionOut {
}

- (void)transitionOutDidComplete {
}

- (IBAction)click {
    [self animateOut];
    [audioPlayer play];
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
