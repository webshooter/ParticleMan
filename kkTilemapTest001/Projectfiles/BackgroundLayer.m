//
//  BackgroundLayer.m
//  kkTilemapTest001
//
//  Created by Randall Nickerson on 8/25/12.
//
//

#import "BackgroundLayer.h"
#import "GridLayer.h"
#import "GridTile.h"
#import "UILayer.h"


@implementation BackgroundLayer

@synthesize backgroundImage;

+(id) node
{
	CCScene *scene = [CCScene node];
	BackgroundLayer *layer = [BackgroundLayer node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if ((self = [super init]))
	{
        [KKConfig injectPropertiesFromKeyPath:@"BackgroundSettings" target:self];

        CGSize winSize = [[CCDirector sharedDirector] winSize];
        CGPoint centerPoint = ccpSub(ccp(winSize.width/2, winSize.height/2), [self position]);
        
        CCSprite *bg = [CCSprite spriteWithFile:backgroundImage];
        [bg setPosition:centerPoint];
        
        UILayer *ui = [[UILayer alloc] init];
        //GridLayer *gridLayer = [[GridLayer alloc] init];
        GridLayer *gridLayer = [[GridLayer alloc] initWithUILayer:ui];

        
        [self addChild:bg z:0];
        [self addChild:gridLayer z:1];
        [self addChild:ui z:5];
	}
    
	return self;
}

@end
