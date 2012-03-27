//
//  DropImageView.m
//  FileToBinaryArray
//
//  Created by umeng on 3/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DropImageView.h"

@implementation DropImageView
@synthesize delegate = _delegate;
- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
        //self.layer.layer
        [self setImageFrameStyle:NSImageFrameGrayBezel];
        [self registerForDraggedTypes:[NSArray arrayWithObjects:NSFilenamesPboardType, nil]];
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    if ( highlight ) {
        [[NSColor lightGrayColor] set];
        [NSBezierPath setDefaultLineWidth: 5];
        [NSBezierPath strokeRect: [self bounds]];
    }
}

- (NSDragOperation)draggingEntered:(id <NSDraggingInfo>)sender {

	NSPasteboard *pboard = [sender draggingPasteboard];
    
	if ([[pboard types] containsObject:NSFilenamesPboardType]) 
    {
        NSArray *draggedFilenames = [pboard propertyListForType:NSFilenamesPboardType];
        highlight=YES;
        NSLog(@"frame [%@] bouds [%@]",NSStringFromRect(self.frame),NSStringFromRect(self.bounds));
        self.image = [[NSWorkspace sharedWorkspace] iconForFile:[draggedFilenames objectAtIndex:0]];
        NSLog(@"size [%@]",NSStringFromSize(self.image.size));
        [self setNeedsDisplay: YES];
        return NSDragOperationGeneric;
	}

	return NSDragOperationNone;
}
- (void)draggingExited:(id <NSDraggingInfo>)sender{
    highlight=NO;
    self.image = nil;
    [self setNeedsDisplay: YES];
}
- (void)draggingEnded:(id <NSDraggingInfo>)sender
{
    highlight=NO;
    [self setNeedsDisplay: YES];
}

- (BOOL)performDragOperation:(id <NSDraggingInfo>)sender {
    
    NSPasteboard *pboard = [sender draggingPasteboard];
    
	if ([[pboard types] containsObject:NSFilenamesPboardType]) 
    {
        NSArray *draggedFilenames = [pboard propertyListForType:NSFilenamesPboardType];
        [self.delegate dragFinished:[draggedFilenames objectAtIndex:0]];
        [self setNeedsDisplay: YES];
	}
	return YES;
}
@end
