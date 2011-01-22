//
//  UIView+RoundedRect.h
//  Mobile Disco
//
//  Created by Eric on 3/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIView (RoundedRect)

+ (void) drawLinearGradientInRect:(CGRect)rect colors:(CGFloat[])colours;
+ (void) drawRoundRectangleInRect:(CGRect)rect withRadius:(CGFloat)radius color:(UIColor*)color;

@end
