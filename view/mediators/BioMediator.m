//
//  BioMediator.m
//  stylometer
//
//  Created by Saad Shams on 2/7/11.
//  All rights reserved.
//

#import "BioMediator.h"
#import "Bio.h"
#import "ApplicationFacade.h"


@implementation BioMediator

+ (NSString *)NAME {
    return @"BioMediator";
}

- (Bio *)viewComponent {
    return viewComponent;
}

- (void)initializeMediator {
    self.mediatorName = [BioMediator NAME];
}

- (void)onRegister {
    [viewComponent setDelegate:self];
}

- (void)masculine {
    [self sendNotification:ShowMasculine];
}

- (void)feminine {
    [self sendNotification:ShowFeminine];
}

@end
