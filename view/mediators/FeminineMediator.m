//
//  FeminineMediator.m
//  Stylometer
//
//  Created by Saad Shams on 4/19/11.
//  All rights reserved.
//

#import "FeminineMediator.h"
#import "Feminine.h"
#import "ApplicationFacade.h"
#import "PersonalityProxy.h"


@implementation FeminineMediator

+ (NSString *)NAME {
    return @"FeminineMediator";
}

- (Feminine *)viewComponent {
    return viewComponent;
}

- (void)initializeMediator {
    self.mediatorName = [FeminineMediator NAME];
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
