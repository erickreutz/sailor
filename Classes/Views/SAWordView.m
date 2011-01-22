//
//  CCWordView.m
//  Creative Curses
//
//  Created by Eric K. on 1/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SAWordView.h"
#import <QuartzCore/QuartzCore.h>
#include <stdlib.h>

@interface SAWordView (PrivateInterface)

typedef enum {
	CCWordViewStyleTypeYellow = 0,
	CCWordViewStyleTypeWhite = 1,
	CCWordViewStyleTypeBlue = 2
} CCWordViewViewStyleType;

@end


@implementation SAWordView
#define WORD_LABEL_OFFSET 10.0f
#define WORD_LABEL_HEIGHT 75.0f

#define WORD_LABEL_FADE_ANIMATION @"wordLabelFadeAnimation"

- (id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		//self stuff
		self.layer.cornerRadius = 7.0f;
		self.clipsToBounds = YES;
		
		//contained views
		_wordLabel = [[UILabel alloc] init];
		[_wordLabel setTextColor:[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.70f]];
		[_wordLabel setShadowColor:[UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.25f]];
		[_wordLabel setShadowOffset:CGSizeMake(0.0f, 1.0f)];
		[_wordLabel setBackgroundColor:[UIColor clearColor]];
		[_wordLabel setTextAlignment:UITextAlignmentCenter];
		[_wordLabel setFont:[UIFont fontWithName:@"Coolvetica" size:40.0f]];
		[self addSubview:_wordLabel];
	}
	return self;
}

- (void)dealloc {
	[super dealloc];
}

#pragma mark -
#pragma mark UIControl Overrides

#pragma mark -
#pragma mark UIView Overrides
- (void) layoutSubviews {

	CGRect wordLabelFrame = CGRectZero;
	wordLabelFrame.size.width = self.bounds.size.width - WORD_LABEL_OFFSET;
	wordLabelFrame.size.height = WORD_LABEL_HEIGHT; 
	wordLabelFrame.origin.x = self.bounds.origin.x + (WORD_LABEL_OFFSET * 0.5f);
	wordLabelFrame.origin.y = self.bounds.origin.y + ( (self.bounds.size.height * 0.5f) - (WORD_LABEL_HEIGHT * 0.5f) );
	[_wordLabel setFrame:wordLabelFrame];
}

- (void) drawRect:(CGRect)rect {
	#define BLUE_COLOR [UIColor colorWithRed:(32.0f / 255.0f) green:(76.0f / 255.0f) blue:(203.0f / 255.0f) alpha:1.0f]
	#define RED_COLOR [UIColor colorWithRed:(203.0f / 255.0f) green:(44.0f / 255.0f) blue:(32.0f / 255.0f) alpha:1.0f]


	CGContextRef c = UIGraphicsGetCurrentContext();
	CGContextSaveGState(c);
	CGContextClearRect(c, self.bounds);
	
	NSInteger style = arc4random() % 3;
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();  
	CGPoint startPoint = CGPointMake(self.bounds.origin.x, self.bounds.origin.y);
	CGPoint endPoint = CGPointMake(self.bounds.origin.x, self.bounds.size.height);
	CGFloat components[8], locations[2];
	
	locations[0] = 0.0f;
	locations[1] = 1.0f;
	
	if (style == CCWordViewStyleTypeYellow) {
		//Color RGBA
		components[0] = 252.0f/255.0f;
		components[1] = 207.0f/255.0f;
		components[2] = 53.0f/255.0f;
		components[3] = 1.0f;
		
		//Color RGBA
		components[4] = 227.0f/255.0f;
		components[5] = 156.0f/255.0f;
		components[6] = 56.0f/255.0f;
		components[7] = 1.0f;
	} else if (style == CCWordViewStyleTypeBlue) {
		//Color RGBA
		components[0] = 36.0f/255.0f;
		components[1] = 75.0f/255.0f;
		components[2] = 186.0f/255.0f;
		components[3] = 1.0f;
		
		//Color RGBA
		components[4] = 14.0f/255.0f;
		components[5] = 34.0f/255.0f;
		components[6] = 101.0f/255.0f;
		components[7] = 1.0f;
	} else {
		//Color RGBA
		components[0] = 220.0f/255.0f;
		components[1] = 220.0f/255.0f;
		components[2] = 220.0f/255.0f;
		components[3] = 1.0f;
		
		//Color RGBA
		components[4] = 120.0f/255.0f;
		components[5] = 120.0f/255.0f;
		components[6] = 120.0f/255.0f;
		components[7] = 1.0f;
	}

	CGGradientRef colorGradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, 2);
	CGContextDrawLinearGradient(c, colorGradient, startPoint, endPoint, kCGGradientDrawsAfterEndLocation);
}

#pragma mark -
#pragma mark Methods
- (NSString*) word {
	return [_wordLabel text];
}

- (void) setWord:(NSString*)word animated:(BOOL)animated {
	if (animated) {
		[UIView beginAnimations:WORD_LABEL_FADE_ANIMATION context:nil];
		[UIView setAnimationDuration:0.5f];
		[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self cache:YES];
	}

	[self setNeedsDisplay];
	[_wordLabel setText:word];
	
	if (animated) {
		[UIView commitAnimations];
	}
}

@end
