//
//  GridLayer.m
//  kkTilemapTest001
//
//  Created by Randall Nickerson on 8/22/12.
//
//

#import "GridLayer.h"
#import "GridTile.h"
#import "UILayer.h"

@implementation GridLayer {
    int tileOnCount;
    UILayer *uiLayer;
}

@synthesize gridOrigin;
@synthesize gridOriginX, gridOriginY, gridRowCount, gridColumnCount;
@synthesize gridWidthInPixels, gridHeightInPixels, tileWidthInPixels, tileHeightInPixels, gridLineWidth, gridLineColorRed, gridLineColorGreen, gridLineColorBlue, gridLineColorAlpha;
@synthesize gridTiles;
@synthesize longPressGR = longPressGR_;

+(id) node
{
	CCScene *scene = [CCScene node];
	GridLayer *layer = [GridLayer node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if ((self = [super init]))
	{
        
        self.longPressGR = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(_handleLongPressGesture:)];
        self.longPressGR.minimumPressDuration = 0;
        self.longPressGR.allowableMovement = 3; // if more than 3 pixels we want to start interpreting as a pan instead
        self.longPressGR.delegate = self;
        self.longPressGR.cancelsTouchesInView = NO; // without this, CC menu items and such won't work
        
        tileOnCount = 0;
        self.isTouchEnabled = YES;
        
        [KKConfig injectPropertiesFromKeyPath:@"GridLayoutSettings" target:self];
        gridOrigin = ccp(gridOriginX, gridOriginY);
        
        gridColumnCount = (gridColumnCount > 0) ? gridColumnCount : 1;
        gridRowCount = (gridRowCount > 0) ? gridRowCount : 1;
        tileWidthInPixels = gridWidthInPixels/gridColumnCount;
        tileHeightInPixels = gridHeightInPixels/gridRowCount;
        
        gridTiles = [[NSMutableArray alloc] init ];
        for (int c=0; c<gridColumnCount; c++) {
            for (int r=0; r<gridRowCount; r++) {
                GridTile *t = [[GridTile alloc] initWithX:gridOrigin.x + tileWidthInPixels*c
                                                 andWithY:gridOrigin.y + tileHeightInPixels*r
                                             andWithWidth:tileWidthInPixels
                                            andWithHeight:tileHeightInPixels];
                [gridTiles addObject:t];
            }
        }
	}
    
	return self;
}

-(id) initWithUILayer:(UILayer*) layer
{
    self = [self init];
    if ((self = [self init])) {
        uiLayer = layer;
        if (uiLayer) {
            NSString *uiLabelText = [NSString stringWithFormat:@"Tiles highlighted: %i\nTiles remaining: %i", tileOnCount, gridTiles.count - tileOnCount];
            [uiLayer updateLabel:uiLabelText];
        }
    }
    return self;
}

- (void)_handleLongPressGesture:(UILongPressGestureRecognizer *)recognizer {
    CCLOG(@"LONG TOUCH!");
    //CGPoint location = [recognizer locationInView:recognizer.view];
    //CGPoint locationInWorldSpace = [[CCDirector sharedDirector] convertToGL:location];
    //CGPoint locationInMySpriteSpace = [self.mySprite convertToNodeSpace:locationInWorldSpace];
    // ...handle the long press here...
}


-(void) gridTouchedAt:(CGPoint)location
{
    if (location.x > gridOriginX && location.x < gridOriginX + gridWidthInPixels) {
        if (location.y > gridOriginY && location.y < gridOriginY + gridHeightInPixels) {
            for (GridTile *t in gridTiles) {
                if ([t isPointInTile:&location]) {
                    [t toggleHighlight];
                    if (t.highlighted) {
                        tileOnCount++;
                    } else {
                        tileOnCount--;
                    }
                    if (uiLayer) {
                        NSString *uiLabelText = [NSString stringWithFormat:@"Tiles highlighted: %i\nTiles remaining: %i", tileOnCount, gridTiles.count - tileOnCount];
                        [uiLayer updateLabel:uiLabelText];
                    }
                }
            }
            
            // particle effect
            CCParticleSystem* system = [CCParticleSystemQuad particleWithFile:@"ExplodingRingMine.plist"];
			system.positionType = kCCPositionTypeFree;
            system.position = location;
            [self addChild:system z:11 tag:1];
        }
    }
}


-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	// get the position in tile coordinates from the touch location
	CGPoint location = [self locationFromTouch:[touches anyObject]];
	[self gridTouchedAt:location];
}

-(CGPoint) locationFromTouch:(UITouch*)touch
{
	CGPoint touchLocation = [touch locationInView:[touch view]];
	return [[CCDirector sharedDirector] convertToGL:touchLocation];
}

-(void)draw
{
    [self drawGrid];
    for(GridTile *t in gridTiles) {
        if (t.highlighted) {
            ccDrawSolidRect(t.tilePoint1, t.tilePoint2, ccc4f(255, 255, 255, 0.6));
        }
    }
}

-(void)drawGrid
{
    
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

    ccDrawColor4B(gridLineColorRed,gridLineColorGreen,gridLineColorBlue,gridLineColorAlpha);
    glLineWidth(gridLineWidth);
    
    // draw row lines
    for (float r = 0; r < gridRowCount + 1; r++) {
        ccDrawLine(ccp(gridOrigin.x, gridOrigin.y + tileHeightInPixels*r), ccp(gridOrigin.x + gridWidthInPixels, gridOrigin.y + tileHeightInPixels*r));
    }
    
    // draw column lines
    for (float c = 0; c < gridColumnCount + 1; c++) {
        ccDrawLine(ccp(gridOrigin.x + tileWidthInPixels * c, gridOrigin.y), ccp(gridOrigin.x + tileWidthInPixels * c, gridOrigin.y + gridHeightInPixels));
    }

}

@end
