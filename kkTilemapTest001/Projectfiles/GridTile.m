//
//  GridTile.m
//  kkTilemapTest001
//
//  Created by Randall Nickerson on 8/24/12.
//
//

#import "GridTile.h"

@implementation GridTile

@synthesize tileOriginX, tileOriginY;
@synthesize highlighted;
@synthesize tilePoint1, tilePoint2;

float tileWidthInPixels, tileHeightInPixels;
bool highlighted;

-(id) init
{
	if ((self = [super init]))
	{
        self.highlighted = false;
	}
    
	return self;
}

-(id) initWithX:(float)x andWithY:(float)y andWithWidth:(float)w andWithHeight:(float)h {
    self = [self init];
    if ((self = [self init])) {
        self.tileOriginX = x;
        self.tileOriginY = y;
        tileWidthInPixels = w+1;
        tileHeightInPixels = h+1;
        tilePoint1 = ccp(tileOriginX, tileOriginY);
        tilePoint2 = ccp(tilePoint1.x + tileWidthInPixels, tilePoint1.y + tileHeightInPixels);
    }
    return self;
}

-(BOOL)isPointInTile:(CGPoint*)location {
    if (location->x > self.tileOriginX &&
        location->x < self.tileOriginX + tileWidthInPixels) {
        
        if (location->y > tileOriginY &&
            location->y < tileOriginY + tileHeightInPixels) {
            
            return TRUE;
            
        }
        
    }
    return FALSE;
}

-(void)toggleHighlight
{
    self.highlighted = !self.highlighted;
}

//-(void)draw
//{
//    //
//}

@end
