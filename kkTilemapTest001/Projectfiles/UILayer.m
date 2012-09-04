//
//  UILayer.m
//  kkTilemapTest001
//
//  Created by Randall Nickerson on 8/25/12.
//
//

#import "UILayer.h"


float labelWidth, labelHeight;

@implementation UILayer

@synthesize labelWidthInPixels, labelHeightInPixels;
@synthesize labelFontName;
@synthesize labelFontSize;

CCLabelTTF *label;

-(id) init
{
	if ((self = [super init]))
	{
        
        [KKConfig injectPropertiesFromKeyPath:@"UILayerSettings" target:self];
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        label = [[CCLabelTTF alloc] init];
        
//        CCLOG(@"font name: %s", &labelFontName);
        
        [label setString:@"My UI text"];
        [label setFontName:labelFontName];
        [label setFontSize:labelFontSize];
        [label setPosition:ccp(winSize.width - labelWidthInPixels, 30)];
        //[label setHorizontalAlignment:CCTextAlignmentRight];
        
        [self addChild:label];
        
	}
    
	return self;
}

-(void) updateLabel:(NSString*) labelText
{
    [label setString:labelText];
}

@end
