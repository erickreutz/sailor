    //
//  CCWordsViewController.m
//  Creative Curses
//
//  Created by Eric K. on 1/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SAWordsViewController.h"
#include <stdlib.h>

@implementation SAWordsViewController

#pragma mark -
#pragma mark Constructors
- (id) init {
	if (self = [super init]) {
		[self setWantsFullScreenLayout:YES];
		_wordStore = [[SAWordStore alloc] init];
	}
	return self;
}

- (void) dealloc {
	[super dealloc];
	[_wordStore release];
}

#pragma mark -
#pragma mark Methods
- (SAWordsView*) contentView {
	return (SAWordsView*)[self view];
}

#pragma mark -
#pragma mark UIViewController Overrides
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	SAWordsView* wordsView = [[SAWordsView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
	[wordsView setDelegate:self];
	[self setView: wordsView];
	[wordsView release];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

#pragma mark -
#pragma mark CCWordsViewDelegate Methods
- (void) wordsView:(SAWordsView *)wordsView wordPane:(SAWordView *)wordPane wantsNewWord:(NSString *)currentWord {
	if (wordPane == [[self contentView] firstPane]) {
		NSString* newWord = [_wordStore nextFirstWord];
		[wordPane setWord:newWord animated:YES];
	} else {
		NSString* newWord = [_wordStore nextSecondWord];
		[wordPane setWord:newWord animated:YES];
	}
}

@end
