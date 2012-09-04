//
//  GridLayer.h
//  kkTilemapTest001
//
//  Created by Randall Nickerson on 8/22/12.
//
//

#import "CCLayer.h"
#import "cocos2d.h"
#import "UILayer.h"

@interface GridLayer : CCLayer
{
    int gridRowCount;
    int gridColumnCount;
    float gridOriginX;
    float gridOriginY;
    float gridWidthInPixels;
	float gridHeightInPixels;
    float gridLineWidth;
    float gridLineColorRed;
    float gridLineColorGreen;
    float gridLineColorBlue;
    float gridLineColorAlpha;
    
    float tileWidthInPixels;
    float tileHeightInPixels;
    
    CGPoint gridOrigin;
    
    NSMutableArray *gridTiles;
    
    UILongPressGestureRecognizer *longPressGR;
}

+(id) node;
-(id) initWithUILayer:(UILayer*) layer;
-(void) drawGrid;

@property (nonatomic) int gridRowCount;
@property (nonatomic) int gridColumnCount;
@property (nonatomic) float gridOriginX;
@property (nonatomic) float gridOriginY;
@property (nonatomic) float gridWidthInPixels;
@property (nonatomic) float gridHeightInPixels;
@property (nonatomic) float gridLineWidth;
@property (nonatomic) float gridLineColorRed;
@property (nonatomic) float gridLineColorGreen;
@property (nonatomic) float gridLineColorBlue;
@property (nonatomic) float gridLineColorAlpha;

@property (nonatomic) float tileWidthInPixels;
@property (nonatomic) float tileHeightInPixels;

@property (nonatomic) CGPoint gridOrigin;
@property (nonatomic,strong) NSMutableArray *gridTiles;

@property (nonatomic,retain) UILongPressGestureRecognizer *longPressGR;

@end

