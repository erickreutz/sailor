//
//  CCWordStore.h
//  Creative Curses
//
//  Created by Eric K. on 1/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SAWordStore : NSObject {
	NSArray* _firstWords;
	NSEnumerator* _firstEnumerator;
	NSArray* _secondWords;
	NSEnumerator* _secondEnumerator;
}

- (NSString*) nextFirstWord;
- (NSString*) nextSecondWord;

@end
