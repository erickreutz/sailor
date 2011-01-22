//
//  CCWordStore.m
//  Creative Curses
//
//  Created by Eric K. on 1/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SAWordStore.h"


@implementation SAWordStore

#pragma mark -
#pragma mark Constructors
- (id) init {
	if (self = [super init]) {
		_firstWords = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"FirstWords" ofType:@"plist"]];
		_secondWords = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"SecondWords" ofType:@"plist"]];
		
		_firstEnumerator = [[_firstWords objectEnumerator] retain];
		_secondEnumerator = [[_secondWords objectEnumerator] retain];
	}
	return self;
}

- (void) dealloc {
	[super dealloc];
	[_firstEnumerator release];
	[_secondEnumerator release];
	[_firstWords release];
	[_secondWords release];
}

#pragma mark -
#pragma mark Methods
- (NSString*) nextFirstWord {
	NSString* nextWord = [_firstEnumerator nextObject];
	if (!nextWord) {
		[_firstEnumerator release];
		_firstEnumerator = [[_firstWords objectEnumerator] retain];
		nextWord = [_firstEnumerator nextObject];
	}
	
	return nextWord;
}

- (NSString*) nextSecondWord {
	NSString* nextWord = [_secondEnumerator nextObject];
	if (!nextWord) {
		[_secondEnumerator release];
		_secondEnumerator = [[_secondWords objectEnumerator] retain];
		nextWord = [_secondEnumerator nextObject];
	}
	
	return nextWord;
}

@end
