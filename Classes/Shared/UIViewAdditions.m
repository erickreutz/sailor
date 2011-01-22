//
//  UIView+RoundedRect.m
//  Mobile Disco
//
//  Created by Eric on 3/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "UIViewAdditions.h"

@implementation UIView (RoundedRect)


CGPoint demoLGStart(CGRect bounds) {
	return CGPointMake(bounds.origin.x, bounds.origin.y + bounds.size.height * 0.25);
}


CGPoint demoLGEnd(CGRect bounds) {
	return CGPointMake(bounds.origin.x, bounds.origin.y + bounds.size.height * 0.75);
}

CGPoint demoRGCenter(CGRect bounds) {
	return CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds));
}

CGFloat demoRGInnerRadius(CGRect bounds) {
	CGFloat r = bounds.size.width < bounds.size.height ? bounds.size.width : bounds.size.height;
	return r * 0.125;
}

+ (void) drawLinearGradientInRect:(CGRect)rect colors:(CGFloat[])colours {
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGContextSaveGState(context);
	
	CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
	CGGradientRef gradient = CGGradientCreateWithColorComponents(rgb, colours, NULL, 2);
	CGColorSpaceRelease(rgb);
	CGPoint start, end;
	
	start = demoLGStart(rect);
	end = demoLGEnd(rect);
	
	
	
	CGContextClipToRect(context, rect);
	CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
	
	CGGradientRelease(gradient);
	
	CGContextRestoreGState(context);
	
}

+ (void) drawRoundRectangleInRect:(CGRect)rect withRadius:(CGFloat)radius color:(UIColor*)color {
	CGContextRef context = UIGraphicsGetCurrentContext();
	[color set];
	
	CGRect rrect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height );
	
	CGFloat minx = CGRectGetMinX(rrect), midx = CGRectGetMidX(rrect), maxx = CGRectGetMaxX(rrect);
	CGFloat miny = CGRectGetMinY(rrect), midy = CGRectGetMidY(rrect), maxy = CGRectGetMaxY(rrect);
	CGContextMoveToPoint(context, minx, midy);
	CGContextAddArcToPoint(context, minx, miny, midx, miny, radius);
	CGContextAddArcToPoint(context, maxx, miny, maxx, midy, radius);
	CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius);
	CGContextAddArcToPoint(context, minx, maxy, minx, midy, radius);
	CGContextClosePath(context);
	CGContextDrawPath(context, kCGPathFill);
}

@end
