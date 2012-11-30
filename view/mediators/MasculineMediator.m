//
//  MasculineMediator.m
//  Stylometer
//
//  Created by Saad Shams on 4/19/11.
// All rights reserved.
//

#import "MasculineMediator.h"
#import "Masculine.h"
#import "ApplicationFacade.h"
#import "PersonalityProxy.h"


@implementation MasculineMediator

+ (NSString *)NAME {
    return @"MasculineMediator";
}

- (Masculine *)viewComponent {
    return viewComponent;
}

- (void)initializeMediator {
    self.mediatorName = [MasculineMediator NAME];
}

- (void)onRegister {
    [viewComponent setDelegate:self];
}

- (void)next:(PersonalityVO *)personalityVO {
    PersonalityProxy *personalityProxy = ((PersonalityProxy *)[facade retrieveProxy:[PersonalityProxy NAME]]);
    
    [personalityProxy setPersonalityVO:personalityVO];
    
    [facade sendNotification:ShowResult];
}

@end
