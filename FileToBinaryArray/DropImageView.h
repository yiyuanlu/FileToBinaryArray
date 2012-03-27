//
//  DropImageView.h
//  FileToBinaryArray
//
//  Created by umeng on 3/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol DropImageViewDelegate
- (void)dragFinished:(NSString *)filePath;
@end

@interface DropImageView : NSImageView
{
    BOOL highlight;
    __unsafe_unretained id <DropImageViewDelegate> _delegate;
}
@property (unsafe_unretained)    id <DropImageViewDelegate> delegate;
@end
