//
//  Controller.h
//  KitchenTimer
//
//  Created by miyazaki on 09/05/06.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Controller : NSObject {
	IBOutlet NSTextField *textField;
	int min;
	int sec;
	NSTimer	*timer;
}

- (void)display;
- (void)start;
- (void)stop;
- (void)countDown:(NSTimer *)theTimer;

- (IBAction)minButtonPushed:(id)sender;
- (IBAction)secButtonPushed:(id)sender;
- (IBAction)startButtonPushed:(id)sender;
- (IBAction)resetButtonPushed:(id)sender;

@end
