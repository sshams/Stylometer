//
//  ApplicationFacade.h
//  Stylometer
//
//  Created by Saad Shams on 4/13/11.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Facade.h"

#define Startup @"startup"
#define ShowIntro @"showIntro"
#define ShowBio @"showBio"
#define ShowMasculine @"showMasculine"
#define ShowFeminine @"showFeminine"
#define ShowResult @"showResult"


@interface ApplicationFacade : Facade {
    
}

+ (ApplicationFacade *)getInstance;
- (void)startup:(id)app;

@end
