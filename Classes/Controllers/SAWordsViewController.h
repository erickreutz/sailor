//
//  CCWordsViewController.h
//  Creative Curses
//
//  Created by Eric K. on 1/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SAWordsView.h"
#import "SAWordStore.h"

@interface SAWordsViewController : UIViewController <CCWordsViewDelegate> {
	SAWordStore* _wordStore;
}

- (SAWordsView*) contentView;

@end
