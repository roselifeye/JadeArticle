//
//  SPMyStoryViewController.m
//  JadeArticle
//
//  Created by Roselifeye on 15/6/6.
//  Copyright (c) 2015年 Roselifeye. All rights reserved.
//

#import "SPMyStoryViewController.h"
#import <RESideMenu.h>
#import "SPStoryDetailViewController.h"
#import "SPStoryReviewViewController.h"

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
    
    if (nil == _defaultFootStr) {
        _defaultFootStr = @"不同的故事，从下拉开始";
    }
    [self initScrollView];
    [self initHeaderView];
    [self initFooterView];
    [self initStoryViewWithText:@"你妹" andTitle:@"HHHH" andAuthor:@"zzzz" andTime:@"2015" andTag:@"njshdkj"];
    [self initStoryViewWithText:@"你妹" andTitle:@"HHHH" andAuthor:@"zzzz" andTime:@"2015" andTag:@"njshdkj"];
    
    [myStoryScrollView setContentOffset:CGPointMake(0, myStoryScrollView.contentSize.height-myStoryScrollView.frame.size.height)];
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
    [myStoryScrollView setBounces:NO];
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
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 20, 45, 45)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"backBtn"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:backBtn];
    
    [myStoryScrollView addSubview:headerView];
}

- (void)goBack {
    NSArray *viewArray = self.navigationController.viewControllers;
    if (viewArray.count > 1) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self.sideMenuViewController presentLeftMenuViewController];
    }
}

- (void)initFooterView {
    footerView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame) - 80, CGRectGetWidth(self.view.frame), 80)];
    [footerView setBackgroundColor:[UIColor blackColor]];
    [footerView setAlpha:0.8f];
    
    UILabel *headerNoticeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, CGRectGetWidth(footerView.frame), 30)];
    [headerNoticeLabel setTextAlignment:NSTextAlignmentCenter];
    [headerNoticeLabel setTextColor:[UIColor whiteColor]];
    [headerNoticeLabel setFont:[UIFont systemFontOfSize:20.f]];
    [headerNoticeLabel setText:_defaultFootStr];
    [footerView addSubview:headerNoticeLabel];
    
    [self.view addSubview:footerView];
}

- (void)initStoryViewWithText:(NSString *)text andTitle:(NSString *)title andAuthor:(NSString *)author andTime:(NSString *)time andTag:(NSString *)tag {
    int offset = myStoryScrollView.contentSize.height/self.view.frame.size.height;
    CGRect frame = CGRectMake(10, 20 + CGRectGetHeight(self.view.frame)*offset, CGRectGetWidth(self.view.frame) - 20, (CGRectGetHeight(self.view.frame) - 80 - 60 - 20));
    if (0 == offset) {
        frame.origin.y += 80;
    }
    UIView *storyView = [[UIView alloc] initWithFrame:frame];
    [storyView setBackgroundColor:[UIColor clearColor]];
    [self addBorderToView:storyView];
    [myStoryScrollView addSubview:storyView];
    
    [self addGestureToView:storyView];
    
    frame = CGRectMake(0, storyView.frame.origin.y + CGRectGetHeight(storyView.frame), CGRectGetWidth(self.view.frame), 60);
    [self initAdditionViewWithFrame:frame];
    
    myStoryScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)*(offset+1));
}

- (void)addGestureToView:(UIView *)view {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(popToDetailView:)];
    [view addGestureRecognizer:tapGesture];
}

- (void)popToDetailView:(id)sender {
    NSLog(@"NIMEI");
    SPStoryDetailViewController *detailView = [self.storyboard instantiateViewControllerWithIdentifier:@"storyDetailView"];
    [self.navigationController presentViewController:detailView animated:YES completion:nil];
}

- (void)initAdditionViewWithFrame:(CGRect)frame {
    UIView *additionView = [[UIView alloc] initWithFrame:frame];
    [additionView setBackgroundColor:[UIColor clearColor]];
    [myStoryScrollView addSubview:additionView];
    
    UIButton *shareBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, (CGRectGetHeight(additionView.frame) - 35)/2.f, 35, 35)];
    [shareBtn setImage:[UIImage imageNamed:@"shareBtn"] forState:UIControlStateNormal];
    [shareBtn addTarget:self action:@selector(shareBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [additionView addSubview:shareBtn];
    
    UIButton *collectBtn = [[UIButton alloc] initWithFrame:CGRectMake(shareBtn.frame.origin.x + CGRectGetWidth(shareBtn.frame) + 10, (CGRectGetHeight(additionView.frame) - 35)/2.f, 35, 35)];
    [collectBtn setImage:[UIImage imageNamed:@"collectionBtn"] forState:UIControlStateNormal];
    [collectBtn setImage:[UIImage imageNamed:@"collectionBtn_highlighted"] forState:UIControlStateSelected];
    [collectBtn addTarget:self action:@selector(collectBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [additionView addSubview:collectBtn];
    
    UIButton *reviewBtn = [[UIButton alloc] initWithFrame:CGRectMake(collectBtn.frame.origin.x + CGRectGetWidth(collectBtn.frame) + 10, (CGRectGetHeight(additionView.frame) - 35)/2.f, 35, 35)];
    [reviewBtn setImage:[UIImage imageNamed:@"reviewBtn"] forState:UIControlStateNormal];
    [reviewBtn addTarget:self action:@selector(reviewBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [additionView addSubview:reviewBtn];
}

- (void)shareBtnClicked:(UIButton *)sender {
}

- (void)collectBtnClicked:(UIButton *)sender {
    sender.selected = !sender.selected;
}

- (void)reviewBtnClicked:(UIButton *)sender {
    SPStoryReviewViewController *reviewView = [self.storyboard instantiateViewControllerWithIdentifier:@"storyReviewView"];
    [self.navigationController presentViewController:reviewView animated:YES completion:nil];
}

#pragma mark -
#pragma mark - UIScrollView Delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = myStoryScrollView.frame.size.height;
    int currentPage = floor((myStoryScrollView.contentOffset.y - pageWidth / 2) / pageWidth) + 1;
    NSLog(@"END SCROLL AND PAGE:%d", currentPage);
    if (0 == currentPage) {
        footerView.makeOrigin(0, CGRectGetHeight(self.view.frame)).animate(0.2f);
    } else {
        footerView.makeOrigin(0, CGRectGetHeight(self.view.frame)-80).animate(0.2f);
    }
}

@end
