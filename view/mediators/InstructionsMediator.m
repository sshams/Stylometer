//
//  InstructionsMediator.m
//  Stylometer
//
//  Created by Saad Shams on 4/14/11.
//  All rights reserved.
//

#import "InstructionsMediator.h"
#import "ApplicationFacade.h"


@implementation InstructionsMediator

+ (NSString *)NAME {
    return @"InstructionsMediator";
}

- (Instructions *)viewComponent {
    return viewComponent;
}

- (void)initializeMediator {
    [super initializeMediator];
    self.mediatorName = [InstructionsMediator NAME];
}

- (void)onRegister {
    [viewComponent setDelegate:self];
}

- (void)next {
    [facade sendNotification:ShowBio];
}

@end
