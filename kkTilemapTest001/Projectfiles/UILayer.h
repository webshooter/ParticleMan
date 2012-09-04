//
//  UILayer.h
//  kkTilemapTest001
//
//  Created by Randall Nickerson on 8/25/12.
//
//

#import "CCLayer.h"

@interface UILayer : CCLayer

@property (nonatomic) float labelWidthInPixels, labelHeightInPixels;
@property (nonatomic) NSString *labelFontName;
@property (nonatomic) float labelFontSize;

-(void) updateLabel:(NSString*) labelText;

@end
