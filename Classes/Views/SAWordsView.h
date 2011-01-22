//
//  CCWordsView.h
//  Creative Curses
//
//  Created by Eric K. on 1/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SAWordView.h"

@class SAWordsView;

@protocol CCWordsViewDelegate
@optional - (void) wordsView:(SAWordsView*)wordsView wordPane:(SAWordView*)wordPane wantsNewWord:(NSString*)currentWord; 
@end

@interface SAWordsView : UIView {
	SAWordView* _firstPane;
	SAWordView* _secondPane;
	
	NSObject<CCWordsViewDelegate>* _delegate;
}

@property (nonatomic, readonly) SAWordView* firstPane;
@property (nonatomic, readonly) SAWordView* secondPane;
@property (nonatomic, assign) NSObject<CCWordsViewDelegate>* delegate;

@end
