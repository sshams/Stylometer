//
//  StartupCommand.m
//  Stylometer
//
//  Created by Saad Shams on 4/13/11.
// All rights reserved.
//

#import "StartupCommand.h"
#import "StylometerMediator.h"
#import "InstructionsMediator.h"
#import "BioMediator.h"
#import "MasculineMediator.h"
#import "FeminineMediator.h"
#import "ResultMediator.h"
#import "PersonalityProxy.h"


@implementation StartupCommand

- (void)execute:(id<INotification>)notification {
    Stylometer *app = [notification body];
    
    [facade registerProxy:[PersonalityProxy proxy]];
    
    [facade registerMediator:[StylometerMediator withViewComponent:app]];
    [facade registerMediator:[InstructionsMediator withViewComponent:app.instructions]];
    [facade registerMediator:[BioMediator withViewComponent:app.bio]];
    [facade registerMediator:[MasculineMediator withViewComponent:app.masculine]];
    [facade registerMediator:[FeminineMediator withViewComponent:app.feminine]];
    [facade registerMediator:[ResultMediator withViewComponent:app.result]];
}

@end
