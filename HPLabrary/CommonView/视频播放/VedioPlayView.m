
#import "VedioPlayView.h"

@implementation VedioPlayView

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    if (player) {
        [player stop];
        [player.view removeFromSuperview];
        player = nil;
    }
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initLayoutView];
    }
    return self;
}
-(void)initLayoutView{
    self.backgroundColor =[UIColor blackColor];
    player = nil;
    //退出按钮
    UIButton* close = [[UIButton alloc]initWithFrame:CGDoubleRectMake(1878, 30, 170, 116)];
    [close setBackgroundImage:getAssetImageByName(@"closeBtn") forState:UIControlStateNormal];
    [close addTarget:self action:@selector(OutAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:close];
    if (isProPad) {
        close.frame = CGFitProRectMake(close.frame);
    }
}

-(void)updateInfo:(id)aUserInfo{
    
    if (player) {
        [player.view removeFromSuperview];
        player = nil;
    }
    NSString* path = aUserInfo;
    NSString* videoPath = path; 
    NSURL *url = [NSURL fileURLWithPath:videoPath]; 
    player = [[MPMoviePlayerController alloc] initWithContentURL:url];

    player.controlStyle = MPMovieControlStyleEmbedded;
    [player setFullscreen:YES animated:YES];
    //[self addGestureTapWithTarget:player.view sel:@selector(tapToChoose:)];
    player.view.frame = self.bounds;	
    [player play];
    //player.view.center = self.center;
    [self insertSubview:player.view atIndex:0];
    //[player prepareToPlay];
    if (_showEnter) {
        //开篇视频隐藏进度条
        [player setControlStyle:MPMovieControlStyleNone ];
    }
    
}
-(void)OutAction
{
    [self removeFromSuperview];
    if (player) {
        [player stop];
        [player.view removeFromSuperview];
        player = nil;
    }
}
-(void)stop{
    if (player) {
        [player stop];         
    }
    
}
-(void)pause{
    if (player) {
        [player pause];         
    }
    
}

@end
