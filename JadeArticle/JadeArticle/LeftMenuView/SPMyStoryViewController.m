//
//  SPMyStoryViewController.m
//  JadeArticle
//
//  Created by Roselifeye on 15/6/6.
//  Copyright (c) 2015年 Roselifeye. All rights reserved.
//

#import "SPMyStoryViewController.h"
#import <RESideMenu.h>

@interface SPMyStoryViewController ()<UIScrollViewDelegate> {
    UIView *headerView;
    UIView *footerView;
    
    UIScrollView *myStoryScrollView;
}
//@property (weak, nonatomic) IBOutlet UIScrollView *myStoryScrollView;

@end

@implementation SPMyStoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBeginView];
    
    [self initScrollView];
    [self initHeaderView];
    [self initFooterView];
    [self initStoryViewWithText:@"你妹" andTitle:@"HHHH" andAuthor:@"zzzz" andTime:@"2015" andTag:@"njshdkj"];
    [self initStoryViewWithText:@"你妹" andTitle:@"HHHH" andAuthor:@"zzzz" andTime:@"2015" andTag:@"njshdkj"];
}

- (IBAction)leftMenu:(id)sender {
    [self.sideMenuViewController presentLeftMenuViewController];
}

- (void)initBeginView {
    UIImage *bgImage = [UIImage imageNamed:@"MainMenuBG"];
    self.view.layer.contents = (id) bgImage.CGImage;
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)addBorderToView:(UIView *)view {
    [view.layer setBorderColor:RGBA(0, 127, 85, 1).CGColor];
    [view.layer setBorderWidth:2.0f];
}

- (void)initScrollView {
    myStoryScrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    [myStoryScrollView setBackgroundColor:[UIColor clearColor]];
    [myStoryScrollView setPagingEnabled:YES];
    [myStoryScrollView setShowsVerticalScrollIndicator:NO];
    [myStoryScrollView setDelegate:self];
    [self.view addSubview:myStoryScrollView];
}

- (void)initHeaderView {
    NSLog(@"kuan%f", self.view.frame.size.width);
    headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 80)];
    [headerView setBackgroundColor:RGBA(0, 127, 85, 1)];
    
    UILabel *headerNoticeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, CGRectGetWidth(headerView.frame), 30)];
    [headerNoticeLabel setTextAlignment:NSTextAlignmentCenter];
    [headerNoticeLabel setTextColor:[UIColor whiteColor]];
    [headerNoticeLabel setFont:[UIFont systemFontOfSize:20.f]];
    [headerNoticeLabel setText:@"已经没有更多"];
    [headerView addSubview:headerNoticeLabel];
    
    UIImageView *noMoreImageView = [[UIImageView alloc] initWithFrame:CGRectMake((CGRectGetWidth(headerView.frame) - 40)/2, 10, 40, 40)];
    [noMoreImageView setImage:[UIImage imageNamed:@"okBtn"]];
    [headerView addSubview:noMoreImageView];
    
    headerView.hidden = YES;
    [self.view addSubview:headerView];
}

- (void)initFooterView {
    footerView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame) - 80, CGRectGetWidth(self.view.frame), 80)];
    [footerView setBackgroundColor:[UIColor blackColor]];
    [footerView setAlpha:0.8f];
    
    UILabel *headerNoticeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, CGRectGetWidth(footerView.frame), 30)];
    [headerNoticeLabel setTextAlignment:NSTextAlignmentCenter];
    [headerNoticeLabel setTextColor:[UIColor whiteColor]];
    [headerNoticeLabel setFont:[UIFont systemFontOfSize:20.f]];
    [headerNoticeLabel setText:@"不同的故事从下拉开始"];
    [footerView addSubview:headerNoticeLabel];
    
    footerView.hidden = YES;
    [self.view addSubview:footerView];
}

- (void)initStoryViewWithText:(NSString *)text andTitle:(NSString *)title andAuthor:(NSString *)author andTime:(NSString *)time andTag:(NSString *)tag {
    int offset = myStoryScrollView.contentSize.height/self.view.frame.size.height;
    CGRect frame = CGRectMake(10, 20 + CGRectGetHeight(self.view.frame)*offset, CGRectGetWidth(self.view.frame) - 20, (CGRectGetHeight(self.view.frame) - 80 - 80 - 20));
    if (0 == offset) {
        frame.origin.y += 80;
    }
    UIView *storyView = [[UIView alloc] initWithFrame:frame];
    [storyView setBackgroundColor:[UIColor clearColor]];
    [self addBorderToView:storyView];
    [myStoryScrollView addSubview:storyView];
    
    NSLog(@"高度1%f", myStoryScrollView.contentSize.height);
    myStoryScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)*(offset+1));
    NSLog(@"高度2%f", myStoryScrollView.contentSize.height);
}

#pragma mark -
#pragma mark - UIScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int offset = scrollView.contentOffset.y/scrollView.frame.size.width;
    if (0 == offset) {
        [headerView setHidden:NO];
        [footerView setHidden:YES];
    } else {
        [headerView setHidden:YES];
        [footerView setHidden:NO];
    }
}

@end
