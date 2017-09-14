
#import <MediaPlayer/MediaPlayer.h>

@protocol VedioPlayViewDelegate <NSObject>

-(void)VedioPlayViewClosed;

@end

@interface VedioPlayView : UIView
{
    MPMoviePlayerController* player;
}

@property(nonatomic,assign) id<VedioPlayViewDelegate> delegate;

@property (nonatomic,assign) BOOL showEnter;

-(void)stop;
-(void)pause;
-(void)updateInfo:(id)aUserInfo;


@end
