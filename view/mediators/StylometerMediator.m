//
//  StylometerMediator.m
//  Stylometer
//
//  Created by Saad Shams on 4/13/11.
//  All rights reserved.
//

#import "StylometerMediator.h"
#import "Stylometer.h"
#import "ApplicationFacade.h"


@implementation StylometerMediator

+ (NSString *)NAME {
    return @"StylometerMediator";
}

- (Stylometer *)viewComponent {
    return viewComponent;
}

- (void)initializeMediator {
    self.mediatorName = [StylometerMediator NAME];
}

- (NSArray *)listNotificationInterests {
    return [NSArray arrayWithObjects:ShowBio, ShowMasculine, ShowFeminine, ShowResult, ShowIntro, nil];
}

- (void)handleNotification:(id<INotification>)notification {
    if([[notification name] isEqualToString:ShowBio]){
        [viewComponent removeInstructions];
        [viewComponent addBio];
    } else if([[notification name] isEqualToString:ShowMasculine]) {
        [viewComponent removeBio];
        [viewComponent addMasculine];
    }  else if([[notification name] isEqualToString:ShowFeminine]) {
        [viewComponent removeBio];
        [viewComponent addFeminine];
    } else if([[notification name] isEqualToString:ShowResult]){
        [viewComponent removeMasculine];
        [viewComponent removeFeminine];
        [viewComponent addResult];
    } else if([[notification name] isEqualToString:ShowIntro]) {
        [viewComponent removeResult];
        [viewComponent addInstructions];
    }
}


@end
