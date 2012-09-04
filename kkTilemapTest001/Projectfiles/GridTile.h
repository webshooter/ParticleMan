//
//  GridTile.h
//  kkTilemapTest001
//
//  Created by Randall Nickerson on 8/24/12.
//
//

#import "CCLayer.h"
#import "cocos2d.h"

@interface GridTile : CCLayer 

@property bool highlighted;
@property CGPoint tilePoint1, tilePoint2;
@property float tileOriginX, tileOriginY;

-(id) initWithX:(float)x andWithY:(float)y andWithWidth:(float)w andWithHeight:(float)h;
-(BOOL)isPointInTile:(CGPoint*)location;
-(void)toggleHighlight;


@end