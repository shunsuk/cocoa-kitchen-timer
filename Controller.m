//
//  Controller.m
//  KitchenTimer
//
//  Created by miyazaki on 09/05/06.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Controller.h"


@implementation Controller

// 初期化ね。。
- (void)applicationDidFinishLaunching:(NSNotification *)notification {
	min = 0;
	sec = 0;
	[self display];
	
	// Interface Builderでフォントサイズ指定する方法がわからん。。。
	[textField	setFont:[NSFont userFontOfSize:36]];
}

- (void)display {
	[textField setStringValue:[NSString stringWithFormat:@"%02d:%02d", min, sec]];
}

- (void)start {
	if ((min > 0) || (sec > 0)) {
		timer = [[NSTimer scheduledTimerWithTimeInterval:1
												  target:self
												selector:@selector(countDown:)
												userInfo:nil
												 repeats:YES
				  ] retain];
	}
}

- (void)stop {
	if (timer != nil) {
		[timer invalidate];
		[timer release];
		timer = nil;
	}
}

- (void)countDown:(NSTimer *)theTimer {
	sec--;
	if ((sec == 0) && (min == 0)) {
		[self stop];
		NSSound *sound = [NSSound soundNamed : @"Glass"];
		[sound play];
	} else if (sec < 0) {
		min--;
		sec = 59;
	}
	[self display];
}

- (IBAction)minButtonPushed:(id)sender {
	if (min < 60) {
		min++;
		[self display];
	}
}

- (IBAction)secButtonPushed:(id)sender {
	if (sec < 60) {
		sec++;
		[self display];
	}
}

- (IBAction)startButtonPushed:(id)sender {
	[self start];
}

- (IBAction)resetButtonPushed:(id)sender{
	[self stop];
	min = 0;
	sec = 0;
	[self display];
}

// これ必要？
- (void)dealloc {
	[super dealloc];
}

@end
