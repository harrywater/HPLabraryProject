//
//  HPImageSequence.m
//  YXGJ
//
//  Created by 王辉平 on 16/1/1.
//  Copyright © 2016年 王辉平. All rights reserved.
//


#import "HPImageSequence.h"

@implementation HPImageSequence
@synthesize prefix, numberOfImages, extension, increment;

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	if(increment == 0)
		increment = 1;
	[super touchesBegan:touches withEvent:event];
	
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    
	previous = touchLocation.x;

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	[super touchesMoved:touches withEvent:event];
	
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:self];
	
	int location = touchLocation.x;
	
	if(location < previous)
		current += increment;
	else
		current -= increment;
	
	previous = location;
   
    if(current > numberOfImages){
     
       current=_revolveModel==Revolve_180?numberOfImages:0;
    }
    
    if(current < 0){
        
        current=_revolveModel==Revolve_180?0:numberOfImages;
    }
    //执行block
    if (_setButtonAppearblock) {
        _setButtonAppearblock(current);
    }
	NSString *path = [NSString stringWithFormat:@"%@%d.%@", prefix, current,extension];
	DLog(@"图片的按下====%@", path);
//	NSString *path = [NSString stringWithFormat:@"%@%d", prefix, current];
//	path = [[NSBundle mainBundle] pathForResource:path ofType:extension];
//    UIImage* img =  [[UIImage alloc] initWithContentsOfFile:imgPath];
	UIImage* img =  getTouchImage(path);
	[self setImage:img];
}

@end
