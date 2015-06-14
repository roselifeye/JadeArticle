//
//  SPSearchViewController.m
//  JadeArticle
//
//  Created by Roselifeye on 15/6/4.
//  Copyright (c) 2015年 Roselifeye. All rights reserved.
//

#import "SPSearchViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface SPSearchViewController () <MPMediaPickerControllerDelegate>

@property (nonatomic, strong) MPMoviePlayerController *movie;

@end

@implementation SPSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initBeginView];
    
    //视频文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"searchVideo" ofType:@"mp4"];
    //视频URL
    NSURL *url = [NSURL fileURLWithPath:path];
    //视频播放对象
    _movie = [[MPMoviePlayerController alloc] initWithContentURL:url];
    [_movie prepareToPlay];
    [self.view addSubview:_movie.view];
    _movie.shouldAutoplay=YES;
    [_movie setControlStyle:MPMovieControlStyleNone];
    [_movie setFullscreen:YES];
    [_movie.view setFrame:self.view.bounds];
    
    // 注册一个播放结束的通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myMovieFinishedCallback:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:_movie];
    [_movie play];
}

- (void)initBeginView {
    UIImage *bgImage = [UIImage imageNamed:@"LeftMenuBG"];
    self.view.layer.contents = (id) bgImage.CGImage;
    [self.navigationController setNavigationBarHidden:YES];
    
    /*
    [self curtainRevealViewFromView:[self createDoorViewWithBGImageName:@"MainMenuBG" andDoorknobImageName:@"doorknob"]
                  ToDestinationView:self.view
                   andLogoImageView:[self createDoorViewWithBGImageName:@"MainMenuBG" andDoorknobImageName:@"searchDoorKnob"]
                    transitionStyle:SPCurtainTransitionHorizontal];*/
}

#pragma mark -------------------视频播放结束委托--------------------

/*
 @method 当视频播放完毕释放对象
 */
-(void)myMovieFinishedCallback:(NSNotification*)notify
{
    //视频播放对象
    MPMoviePlayerController* theMovie = [notify object];
    //销毁播放通知
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:theMovie];
    //[theMovie.view removeFromSuperview];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
