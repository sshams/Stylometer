//
//  Stylometer.m
//  Stylometer
//
//  Created by Saad Shams on 4/13/11.
//  All rights reserved.
//

#import "Stylometer.h"


@implementation Stylometer

@synthesize instructions, bio, masculine, feminine, result;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        instructions = [[Instructions alloc] init];
        bio = [[Bio alloc] init];
        masculine = [[Masculine alloc] init];
        feminine = [[Feminine alloc] init];
        result = [[Result alloc] init];
        
        [self addInstructions];
        //[self addMasculine];
        
    }
    return self;
}

- (void)addInstructions {
    [self.view addSubview:instructions.view];
    [instructions animateIn];
}

- (void)removeInstructions {
    [instructions.view removeFromSuperview];
    [instructions reset];
}

- (void)addBio {
    [self.view addSubview:bio.view];
    [bio animateIn];
}

- (void)removeBio {
    [bio.view removeFromSuperview];
    [bio reset];
}

- (void)addMasculine {
    [self.view addSubview:masculine.view];
    [masculine animateIn];
}

- (void)removeMasculine {
    [masculine transitionOut];
}

- (void)addFeminine {
    [self.view addSubview:feminine.view];
    [feminine animateIn];
}

- (void)removeFeminine {
    [feminine transitionOut];
}

- (void)addResult {
    [self.view addSubview:result.view];
    [result transitionIn];
}

- (void)removeResult {
    [result.view removeFromSuperview];
    [result reset];
}

- (void)dealloc
{
    [super dealloc];
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
	return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) || (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

@end
