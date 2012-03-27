//
//  AppDelegate.m
//  FileToBinaryArray
//
//  Created by umeng on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize imageView = _imageView;
@synthesize textField = _textField;
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    self.imageView.delegate = self;
}
-(IBAction)createAction:(id)sender
{
    NSMutableString *outString = [[NSMutableString alloc] initWithFormat:@"const char *%@={",@"fileArray"];
    NSData *data = [NSData dataWithContentsOfFile:self.textField.stringValue];
    Byte *dataBytes = (Byte *)[data bytes];
    
    for(int i=0;i<[data length];i++)
    {
        if(i!=[data length]-1)
        {
            [outString appendFormat:@"0x%x, ",dataBytes[i]&0xff];
        }
        else {
            [outString appendFormat:@"0x%x",dataBytes[i]&0xff];
        }
    }
    
    [outString appendString:@"};"];
    
    NSLog(@"%@",outString);
}
- (void)dragFinished:(NSString *)filePath
{
    self.textField.stringValue = filePath;
}

@end
