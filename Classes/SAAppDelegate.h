//
//  Creative_CursesAppDelegate.h
//  Creative Curses
//
//  Created by Eric K. on 1/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SAWordsViewController.h"

@interface SAAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow* _window;
	SAWordsViewController* _wordsController;	
}

@end

