//
//  Stylometer.h
//  Stylometer
//
//  Created by Saad Shams on 4/13/11.
//  All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Instructions.h"
#import "Bio.h"
#import "Masculine.h"
#import "Feminine.h"
#import "Result.h"


@interface Stylometer : UIViewController {
    Instructions *instructions;
    Bio *bio;
    Masculine *masculine;
    Feminine *feminine;
    Result *result;
}

@property (nonatomic, retain) Instructions *instructions;
@property (nonatomic, retain) Bio *bio;
@property (nonatomic, retain) Masculine *masculine;
@property (nonatomic, retain) Feminine *feminine;
@property (nonatomic, retain) Result *result;

- (void)addInstructions;
- (void)removeInstructions;
- (void)addBio;
- (void)removeBio;
- (void)addMasculine;
- (void)removeMasculine;
- (void)addFeminine;
- (void)removeFeminine;
- (void)addResult;
- (void)removeResult;

@end
