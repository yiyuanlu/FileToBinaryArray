//
//  AppDelegate.h
//  FileToBinaryArray
//
//  Created by umeng on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

{
    dispatch_io_t _channel;
}
@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSImageView *imageView;
@property (assign) IBOutlet NSTextField *textField;
@property (assign) dispatch_io_t channel;

-(IBAction)createAction:(id)sender;
- (BOOL)performDragOperation:(id <NSDraggingInfo>)sender;
@end
