//
//  SPLauchViewController.m
//  
//
//  Created by Roselifeye on 2015-06-14.
//
//

#import "SPLauchViewController.h"
#import "ViewController.h"

#define show_time 12.0f

@interface SPLauchViewController ()  {
    BOOL isScal1;
    BOOL isScal2;
    BOOL isScal0;
}

@end

@implementation SPLauchViewController
@synthesize animating = _animating;
//@synthesize lauchScroll = _lauchScroll;

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:KEY_USER_DEFAULT];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self initBeginView];
    
    isScal1 = NO;
    isScal2 = NO;
    isScal0 = NO;
    
    _lauchScroll = [[UIScrollView alloc] initWithFrame:self.view.frame];
    [_lauchScroll setDelegate:self];
    [_lauchScroll setPagingEnabled:YES];
    [_lauchScroll setBounces:NO];
    [_lauchScroll setShowsVerticalScrollIndicator:NO];
    _lauchScroll.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 3);
    [self.view addSubview:_lauchScroll];
    
    [self scaleOne];
    isScal0 = YES;
}

- (void)initBeginView {
    UIImage *bgImage = [UIImage imageNamed:@"MainMenuBG"];
    self.view.layer.contents = (id) bgImage.CGImage;
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)scaleOne {
    UIView *view1 = [[UIView alloc] initWithFrame:self.view.frame];
    [view1 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Symbol1"]]];
    [_lauchScroll addSubview:view1];
    
    CGRect frame = view1.frame;
    frame.origin.y -= view1.frame.size.height;
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:frame];
    [imageView1 setImage:[UIImage imageNamed:@"Stone"]];
    [view1 addSubview:imageView1];
    imageView1.makeFrame(view1.frame).animate(1.f);
}

- (void)scaleTwo {
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame), CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    [view2 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Symbol2"]]];
    [_lauchScroll addSubview:view2];
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame) - 118)/2.f, (CGRectGetHeight(self.view.frame) - 267)/2.f - 20, 118, 267)];
    [imageView1 setImage:[UIImage imageNamed:@"LauchWords"]];
    [imageView1 setAlpha:0.f];
    [view2 addSubview:imageView1];
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame) - 118)/2.f, CGRectGetHeight(self.view.frame) - 49 - 20, 118, 49)];
    [imageView2 setImage:[UIImage imageNamed:@"SubLauchWords"]];
    [imageView2 setAlpha:0.f];
    [view2 addSubview:imageView2];
    
    [UIView animateWithDuration:1.f animations:^{
        [imageView1 setAlpha:1.f];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5f animations:^{
            [imageView2 setAlpha:1.f];
        }];
    }];
}

- (void)scaleThree {
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame)*2  , CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    [view3 setBackgroundColor:[UIColor clearColor]];
    [_lauchScroll addSubview:view3];
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.frame) - 175, 25, 175, 121)];
    [imageView1 setImage:[UIImage imageNamed:@"Crane"]];
    [imageView1 setAlpha:0.f];
    [view3 addSubview:imageView1];
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame) - 173, 235, 173)];
    [imageView2 setImage:[UIImage imageNamed:@"Landscape"]];
    [imageView2 setAlpha:0.f];
    [view3 addSubview:imageView2];
    
    UIButton *enterMainViewBtn = [[UIButton alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame) - 93)/2.f, (CGRectGetHeight(self.view.frame) - 93)/2.f, 93, 93)];
    [enterMainViewBtn setBackgroundImage:[UIImage imageNamed:@"EnterBtn"] forState:UIControlStateNormal];
    [enterMainViewBtn addTarget:self action:@selector(hideGuide) forControlEvents:UIControlEventTouchUpInside];
    [enterMainViewBtn setAlpha:0.f];
    [view3 addSubview:enterMainViewBtn];
    
    [UIView animateWithDuration:0.5f animations:^{
        [imageView1 setAlpha:1.f];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5f animations:^{
            [imageView2 setAlpha:2.f];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5f animations:^{
                [enterMainViewBtn setAlpha:1.f];
            }];
        }];
    }];
}

#pragma mark
#pragma UIScrollView Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int index = fabs(scrollView.contentOffset.y) /scrollView.frame.size.width;
    
    switch (index) {
        case 0:
        {
            if (!isScal0) {
                [self scaleOne];
                isScal0 = YES;
            }
        }
            break;
        case 1:
        {
            if (!isScal1) {
                [self scaleTwo];
                isScal1 = YES;
            }
        }
            break;
        case 2:
        {
            if (!isScal2) {
                [self scaleThree];
                isScal2 = YES;
            }
        }
            break;
        default:
            break;
    }
}

- (CGRect)onscreenFrame {
    CGRect frame = [UIScreen mainScreen].bounds;
    //frame.origin.y -= 20;
    return frame;
}

- (CGRect)offscreenFrame {
    CGRect frame = [self onscreenFrame];
    switch ([UIApplication sharedApplication].statusBarOrientation) {
        case UIInterfaceOrientationPortrait:
            frame.origin.y = frame.size.height;
            break;
        case UIInterfaceOrientationPortraitUpsideDown:
            frame.origin.y = -frame.size.height;
            break;
        case UIInterfaceOrientationLandscapeLeft:
            frame.origin.x = frame.size.width;
            break;
        case UIInterfaceOrientationLandscapeRight:
            frame.origin.x = -frame.size.width;
            break;
    }
    return frame;
}

- (void)showGuide {
    if (!_animating && self.view.superview == nil) {
        [SPLauchViewController sharedGuide].view.frame = [self offscreenFrame];
        [[self mainWindow] addSubview:[SPLauchViewController sharedGuide].view];
        
        _animating = YES;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.0];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(guideShown)];
        [SPLauchViewController sharedGuide].view.frame = [self onscreenFrame];
        [UIView commitAnimations];
    }
}

- (void)guideShown {
    _animating = NO;
}

- (void)hideGuide {
    if (!_animating && self.view.superview != nil) {
        _animating = YES;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.4];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(guideHidden)];
        [SPLauchViewController sharedGuide].view.frame = [self offscreenFrame];
        [UIView commitAnimations];
        
        [self setLauchScroll:nil];
        [self setView:nil];
    }
}

- (void)guideHidden {
    _animating = NO;
    [[[SPLauchViewController sharedGuide] view] removeFromSuperview];
}

- (UIWindow *)mainWindow
{
    UIApplication *app = [UIApplication sharedApplication];
    if ([app.delegate respondsToSelector:@selector(window)]) {
        return [app.delegate window];
    } else {
        return [app keyWindow];
    }
}

+ (void)show {
    [[SPLauchViewController sharedGuide].lauchScroll setContentOffset:CGPointMake(0.f, 0.f)];
    [[SPLauchViewController sharedGuide] showGuide];
}

+ (void)hide {
    [[SPLauchViewController sharedGuide] hideGuide];
}

#pragma mark -

+ (SPLauchViewController *)sharedGuide {
    @synchronized(self) {
        static SPLauchViewController *sharedGuide = nil;
        if (sharedGuide == nil) {
            sharedGuide = [[self alloc] init];
        }
        return sharedGuide;
    }
}



@end
