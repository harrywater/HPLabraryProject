//
//  PanoWebVC.h
//  REShow
//
//  Created by loufq on 11-12-1.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

@interface PanoWebVC : UIView<UIWebViewDelegate>{
    UIWebView* myWebView;
}
@property(nonatomic,retain)NSString* filePath;
+(PanoWebVC*)createWithFilePath:(NSString*)aFilePath;
-(id)initWithFilePath:(NSString*)aFilePath;
-(void)updateWithFilePath:(NSString*)aFilePath;
-(void)show720View;
@end
