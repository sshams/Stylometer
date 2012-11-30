//
//  Bio.m
//  stylometer
//
//  Created by Saad Shams on 2/7/11.
//  All rights reserved.
//

#import "Bio.h"
#import "Animations.h"
#import "NSArrays.h"


@implementation Bio

@synthesize age, delegate, objects;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        ageLimit = 18;
        audioPlayer = [[AudioPlayer alloc] init:@"click" ofType:@"mp3"];
    }
    return self;
}

- (void)transitionIn {
}

- (void)transitionInDidComplete {
}

- (void)animateIn {
    [Animations animateViewsFrom:objects x:0 y:10 width:0 height:0 relative:YES alpha:0 duration:.5 delay:0 stagger:.1 options:UIViewAnimationCurveEaseOut delegate:nil selector:nil];
}

- (void)animateInDidComplete {
    
}

- (void)animateOut {
    [Animations animateViewsTo:objects x:0 y:-10 width:0 height:0 relative:YES alpha:0 duration:.5 delay:0 stagger:.1 options:UIViewAnimationCurveEaseOut delegate:self selector:@selector(animateOutDidComplete)];
}

- (void)animateOutDidComplete {
    if(gender == 1){
        [delegate masculine];
    } else {
        [delegate feminine];
    }
}

- (void)transitionOut {
}

- (void)transitionOutDidComplete {
}

- (void)reset {
    [age setText:@""];
    [Animations animateViewsTo:objects x:0 y:10 width:0 height:0 relative:YES alpha:1 duration:.1 delay:0 stagger:0 options:UIViewAnimationCurveLinear delegate:nil selector:nil];
}

- (IBAction)masculine:(id)sender {
    if([self verifyAge]){
        [self backgroundTouch:nil];
        gender = 1;
        [self animateOut];
        [audioPlayer play];
    }
}

- (IBAction)feminin:(id)sender {
    if([self verifyAge]){
        [self backgroundTouch:nil];
        gender = 0;
        [self animateOut];
        [audioPlayer play];
    }
}

- (BOOL)verifyAge {
    UIAlertView *error;
    
    if([age.text intValue] < ageLimit) {
        error = [[UIAlertView alloc] initWithTitle:@"Désolé" message:[NSString stringWithFormat:@"Vous devez être âgé de %d ans ou plus pour jouer au Stylometer.", ageLimit] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [error show];
        [error release];
        return NO;
    } else {
        return YES;
    }
}

- (BOOL)textField:(UITextField *)theTextField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if(range.length == 1){ //for the backspace
        return YES;
    }
    
    NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];

    for (int i = 0; i < [string length]; i++) {
        unichar c = [string characterAtIndex:i];
        if ([myCharSet characterIsMember:c]) {
            return YES;
        }
    }
    
    return NO;
}

- (IBAction)backgroundTouch:(id)sender {
    [age resignFirstResponder];
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
    
    age.delegate = self;
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
