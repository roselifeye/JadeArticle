//
//  UIViewController+Additions.m
//  JadeArticle
//
//  Created by Roselifeye on 15/6/4.
//  Copyright (c) 2015年 Roselifeye. All rights reserved.
//

#import "UIViewController+Additions.h"

@implementation UIViewController (Additions)

- (UIImageView *)createDoorViewWithBGImageName:(NSString *)BGImageName andDoorknobImageName:(NSString *)DoorknobImageName {
    UIImageView *doorImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [doorImageView setImage:[UIImage imageNamed:BGImageName]];
    NSLog(@"%f", self.view.frame.size.height);
    UIImageView *doorknobImageView = [[UIImageView alloc] initWithFrame:CGRectMake((doorImageView.frame.size.width - 185)/2.0f, (doorImageView.frame.size.height - 186)/2.0f, 185, 186)];
    [doorknobImageView setImage:[UIImage imageNamed:DoorknobImageName]];
    [doorImageView addSubview:doorknobImageView];
    return doorImageView;
}

/**
 *  Convert View to Image
 *
 *  @param view Need Convert View
 *
 *  @return Image of the View
 */
- (UIImage *)imageWithView:(UIView *)view {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (void)curtainRevealViewFromView:(UIView *)fromView ToDestinationView:(UIView *)toView andLogoImageView:(UIView *)LogoImageView transitionStyle:(SPCurtainTransitionStyle)transitionStyle {
    
    UIImage *selfPortrait = [self imageWithView:fromView];
    UIImage *controllerScreenshot = [self imageWithView:toView];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIView *coverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, controllerScreenshot.size.width, controllerScreenshot.size.height)];
    coverView.backgroundColor = [UIColor blackColor];
    [window addSubview:coverView];
    
    UIImageView *fadedView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, selfPortrait.size.width, selfPortrait.size.height)];
    fadedView.image = controllerScreenshot;
    fadedView.alpha = 0.5;
    [coverView addSubview:fadedView];
    
    UIImageView *leftCurtain = [[UIImageView alloc] initWithFrame:CGRectNull];
    leftCurtain.image = selfPortrait;
    leftCurtain.clipsToBounds = YES;
    
    UIImageView *rightCurtain = [[UIImageView alloc] initWithFrame:CGRectNull];
    rightCurtain.image = selfPortrait;
    rightCurtain.clipsToBounds = YES;
    
    if (transitionStyle == SPCurtainTransitionHorizontal) {
        leftCurtain.contentMode = UIViewContentModeLeft;
        leftCurtain.frame = CGRectMake(0, 0, selfPortrait.size.width / 2, selfPortrait.size.height);
        rightCurtain.contentMode = UIViewContentModeRight;
        rightCurtain.frame = CGRectMake(selfPortrait.size.width / 2, 0, selfPortrait.size.width / 2, selfPortrait.size.height);
    } else {
        leftCurtain.contentMode = UIViewContentModeTop;
        leftCurtain.frame = CGRectMake(0, 0, selfPortrait.size.width, selfPortrait.size.height / 2);
        rightCurtain.contentMode = UIViewContentModeBottom;
        rightCurtain.frame = CGRectMake(0, selfPortrait.size.height / 2, selfPortrait.size.width, selfPortrait.size.height / 2);
    }
    
    [coverView addSubview:leftCurtain];
    [coverView addSubview:rightCurtain];
    
    [coverView addSubview:LogoImageView];
    [UIView animateWithDuration:2.0f delay:0 options:UIViewAnimationOptionAllowAnimatedContent animations:^{
        [LogoImageView setAlpha:0.f];
    } completion:nil];
    
    [UIView animateWithDuration:0.8f delay:1.5f options:UIViewAnimationOptionCurveEaseIn animations:^{
        if (transitionStyle == SPCurtainTransitionHorizontal) {
            leftCurtain.frame = CGRectMake(- selfPortrait.size.width / 2, 0, selfPortrait.size.width / 2, selfPortrait.size.height);
            rightCurtain.frame = CGRectMake(selfPortrait.size.width, 0, selfPortrait.size.width / 2, selfPortrait.size.height);
        } else {
            leftCurtain.frame = CGRectMake(0, - selfPortrait.size.height / 2, selfPortrait.size.width, selfPortrait.size.height / 2);
            rightCurtain.frame = CGRectMake(0, selfPortrait.size.height, selfPortrait.size.width, selfPortrait.size.height / 2);
        }
    } completion:nil];
    
    [UIView animateWithDuration:0.3 delay:2.1f options:UIViewAnimationOptionCurveEaseIn animations:^{
        fadedView.frame = CGRectMake(0, 0, controllerScreenshot.size.width, controllerScreenshot.size.height);
        fadedView.alpha = 1;
    } completion:^(BOOL finished){
        [leftCurtain removeFromSuperview];
        [rightCurtain removeFromSuperview];
        [fadedView removeFromSuperview];
        [LogoImageView removeFromSuperview];
        [coverView removeFromSuperview];
    }];
}

- (void)curtainCloseViewFromView:(UIView *)fromView ToDestinationView:(UIView *)toView transitionStyle:(SPCurtainTransitionStyle)transitionStyle andEndBlock:(SPBlock)endBlock {
    UIImage *selfPortrait = [self imageWithView:fromView];
    UIImage *controllerScreenshot = [self imageWithView:toView];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIView *coverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, selfPortrait.size.width, selfPortrait.size.height)];
    coverView.backgroundColor = [UIColor blackColor];
    [window addSubview:coverView];
    
    UIImageView *fadedView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, controllerScreenshot.size.width, controllerScreenshot.size.height)];
    fadedView.image = controllerScreenshot;
    fadedView.alpha = 0.5f;
    [coverView addSubview:fadedView];
    
    UIImageView *leftCurtain = [[UIImageView alloc] initWithFrame:CGRectNull];
    leftCurtain.image = selfPortrait;
    leftCurtain.clipsToBounds = YES;
    
    UIImageView *rightCurtain = [[UIImageView alloc] initWithFrame:CGRectNull];
    rightCurtain.image = selfPortrait;
    rightCurtain.clipsToBounds = YES;
    
    if (transitionStyle == SPCurtainTransitionHorizontal) {
        leftCurtain.contentMode = UIViewContentModeLeft;
        leftCurtain.frame = CGRectMake(- selfPortrait.size.width / 2, 0, selfPortrait.size.width / 2, selfPortrait.size.height);
        rightCurtain.contentMode = UIViewContentModeRight;
        rightCurtain.frame = CGRectMake(selfPortrait.size.width, 0, selfPortrait.size.width / 2, selfPortrait.size.height);
    } else {
        leftCurtain.contentMode = UIViewContentModeTop;
        leftCurtain.frame = CGRectMake(0, - selfPortrait.size.height / 2, selfPortrait.size.width, selfPortrait.size.height / 2);
        rightCurtain.contentMode = UIViewContentModeBottom;
        rightCurtain.frame = CGRectMake(0, selfPortrait.size.height, selfPortrait.size.width, selfPortrait.size.height / 2);
    }
    
    [coverView addSubview:leftCurtain];
    [coverView addSubview:rightCurtain];
    
    
    [UIView animateWithDuration:0.8f delay:0.f options:UIViewAnimationOptionCurveEaseIn animations:^{
        if (transitionStyle == SPCurtainTransitionHorizontal) {
            leftCurtain.frame = CGRectMake(0, 0, selfPortrait.size.width / 2, selfPortrait.size.height);
            rightCurtain.frame = CGRectMake(selfPortrait.size.width / 2, 0, selfPortrait.size.width / 2, selfPortrait.size.height);
        } else {
            leftCurtain.frame = CGRectMake(0, 0, selfPortrait.size.width, selfPortrait.size.height / 2);
            rightCurtain.frame = CGRectMake(0, selfPortrait.size.height / 2, selfPortrait.size.width, selfPortrait.size.height / 2);
        }
    } completion:nil];
    
    [UIView animateWithDuration:0.3 delay:0.6f options:UIViewAnimationOptionCurveEaseIn animations:^{
        fadedView.frame = CGRectMake(0, 0, controllerScreenshot.size.width, controllerScreenshot.size.height);
        fadedView.alpha = 1;
    } completion:^(BOOL finished){
        [leftCurtain removeFromSuperview];
        [rightCurtain removeFromSuperview];
        [fadedView removeFromSuperview];
        [coverView removeFromSuperview];
        if (endBlock) {
            endBlock();
        }
    }];

}

@end
