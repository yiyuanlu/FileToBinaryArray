//
//  AppDelegate.h
//  FileToBinaryArray
//
//  Created by umeng on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DropImageView.h"

@interface AppDelegate : NSObject <NSApplicationDelegate,DropImageViewDelegate>
@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet DropImageView *imageView;
@property (assign) IBOutlet NSTextField *textField;

-(IBAction)createAction:(id)sender;
@end
