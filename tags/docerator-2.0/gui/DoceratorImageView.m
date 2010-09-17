/*
 
 Docerator Mac OS X application -- GUI for docerator.py
 
 MIT License
 
 Copyright (C) 2010 Sveinbjorn Thordarson  
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 
 */

#import "DoceratorImageView.h"


@implementation DoceratorImageView

#pragma mark Delegate

- (void)setDelegate: (id)theDelegate
{
	delegate = theDelegate;
}

- (id)delegate
{
	return delegate;
}

#pragma mark Dragging

// make image view accept dropped file via delegate

- (NSDragOperation)draggingEntered:(id <NSDraggingInfo>)sender
{
	if (delegate && [delegate respondsToSelector:@selector(draggingEntered:)]) 
		return [delegate draggingEntered:sender];
	else
		return [super draggingEntered:sender];
}

- (void)draggingExited:(id <NSDraggingInfo>)sender;
{
	if (delegate && [delegate respondsToSelector:@selector(draggingExited:)]) 
		return [delegate draggingExited:sender];
	else
		return [super draggingExited:sender];
}

- (NSDragOperation)draggingUpdated:(id <NSDraggingInfo>)sender
{
	if (delegate && [delegate respondsToSelector:@selector(draggingUpdated:)]) 
		return [delegate draggingUpdated:sender];
	else
		return [super draggingUpdated:sender];
}

- (BOOL)prepareForDragOperation:(id <NSDraggingInfo>)sender
{
	if (delegate && [delegate respondsToSelector:@selector(prepareForDragOperation:)]) 
		return [delegate prepareForDragOperation:sender];
	else
		return [super prepareForDragOperation:sender];
}

- (BOOL)performDragOperation:(id <NSDraggingInfo>)sender
{
	if (delegate && [delegate respondsToSelector:@selector(performDragOperation:)])
		return [delegate performDragOperation:sender];
	else
		return [super performDragOperation:sender];
}

- (void)concludeDragOperation:(id <NSDraggingInfo>)sender
{
	if (delegate && [delegate respondsToSelector:@selector(concludeDragOperation:)])
		[delegate concludeDragOperation:sender];
	else
		[super concludeDragOperation:sender];
}

#pragma mark Set image behaviour

-(void)setImage:(NSImage *)newImage
{
	// get best representation
	NSArray *reps = [newImage representations];
	int i, highestRep = 0;
	for (i = 0; i < [reps count]; i++)
	{
		int height = [[reps objectAtIndex: i] pixelsHigh];
		if (height > highestRep)
			highestRep = height;
	}

	// make sure never larger than 256
	if (highestRep > 256)
		highestRep = 256;
	 
	[newImage setSize: NSMakeSize(highestRep,highestRep)];
	[super setImage: newImage];
}

-(void)clear
{
	[super setImage: nil];
}


@end
