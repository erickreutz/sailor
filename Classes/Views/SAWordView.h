//
//  CCWordView.h
//  Creative Curses
//
//  Created by Eric K. on 1/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SAWordView : UIControl {
	UILabel* _wordLabel;
}

- (void) setWord:(NSString*)word animated:(BOOL)animated;
- (NSString*) word;

@end
