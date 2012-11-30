//
//  Icon.h
//  Stylometer
//
//  Created by Saad Shams on 4/21/11.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIButtonDraggableTransparent.h"

@protocol IconDelegate <NSObject>

- (void)setIconID:(int)id;
- (int)getIconID;
- (void)resetIcons;
- (BOOL)checkCollision:(int)id;
- (void)submerge:(int)id;

@end

@interface Icon : UIButtonDraggableTransparent {
    CGRect originalFrame;
    id<IconDelegate>delegate;
    int id;
    int rating;
}

@property (readwrite, assign) int id;
@property (readwrite, assign) int rating;
@property (nonatomic, retain) id<IconDelegate>delegate;

- (void)reset;

@end
