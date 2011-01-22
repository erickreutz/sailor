//
//  CCWordsView.m
//  Creative Curses
//
//  Created by Eric K. on 1/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SAWordsView.h"

@interface SAWordsView (PrivateInterface)
- (void) _firstPaneTouched;
- (void) _secondPaneTouched;
@end


@implementation SAWordsView (PrivateInterface)
- (void) _firstPaneTouched {
	Log(@"FirstPane Touched");
	if (_delegate && [_delegate respondsToSelector:@selector(wordsView:wordPane:wantsNewWord:)]) {
		[_delegate wordsView:self wordPane:_firstPane wantsNewWord:[_firstPane word]];
	}
}

- (void) _secondPaneTouched {
	Log(@"SecondPane Touched");
	if (_delegate && [_delegate respondsToSelector:@selector(wordsView:wordPane:wantsNewWord:)]) {
		[_delegate wordsView:self wordPane:_secondPane wantsNewWord:[_secondPane word]];
	}
}
@end


@implementation SAWordsView

#pragma mark -
#pragma mark Constructors
- (id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		_firstPane = [[SAWordView alloc] init];
		_secondPane = [[SAWordView alloc] init];
		
		[_firstPane setBackgroundColor:[UIColor whiteColor]];
		[_secondPane setBackgroundColor:[UIColor whiteColor]];
		
		[self addSubview:_firstPane];
		[self addSubview:_secondPane];
		
		//register for events
		[_firstPane addTarget:self action:@selector(_firstPaneTouched) forControlEvents:UIControlEventTouchUpInside];
		[_secondPane addTarget:self action:@selector(_secondPaneTouched) forControlEvents:UIControlEventTouchUpInside];
	}
	return self;
}

- (void)dealloc {
    [super dealloc];
}

#pragma mark -
#pragma mark Accessors
@synthesize firstPane = _firstPane;
@synthesize secondPane = _secondPane;
@synthesize delegate = _delegate;

#pragma mark -
#pragma mark UIView Overrides
- (void) layoutSubviews {
	CGFloat inset = 7.0f;	
	CGRect paneFrame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height * 0.5f);
	CGRect insetFrame = CGRectInset(paneFrame, inset, inset);
	[_firstPane setFrame:insetFrame];
	
	paneFrame.origin.y = self.bounds.size.height * 0.5f;
	insetFrame = CGRectInset(paneFrame, inset, inset);
	[_secondPane setFrame:insetFrame];
	
	if ([[_firstPane word] length] == 0) {
		[self _firstPaneTouched];
	}
	
	if ([[_secondPane word] length] == 0) {
		[self _secondPaneTouched];
	}
}

#pragma mark -
#pragma mark Event Handlers


@end
