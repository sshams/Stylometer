//
//  ResultMediator.m
//  Stylometer
//
//  Created by Saad Shams on 4/26/11.
//  All rights reserved.
//

#import "ResultMediator.h"
#import "Result.h"
#import "PersonalityProxy.h"
#import "PersonalityEnum.h"
#import "ApplicationFacade.h"


@implementation ResultMediator

- (NSString *)NAME {
    return @"ResultMediator";
}

- (Result *)viewComponent {
    return viewComponent;
}

- (void)initializeMediator {
    self.mediatorName = [ResultMediator NAME];
}

- (void)onRegister {
    [viewComponent setDelegate:self];
}

- (enum PERSONALITY)getPersonality {
    PersonalityProxy *personalityProxy = ((PersonalityProxy *)[facade retrieveProxy:[PersonalityProxy NAME]]);
    return [personalityProxy getPersonalityVO].personalityEnum.personality;
}

- (void)next {
    [facade sendNotification:ShowIntro];
}

@end
