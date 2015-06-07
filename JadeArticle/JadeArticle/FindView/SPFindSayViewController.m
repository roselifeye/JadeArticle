//
//  SPFindSayViewController.m
//  JadeArticle
//
//  Created by Roselifeye on 15/6/6.
//  Copyright (c) 2015年 Roselifeye. All rights reserved.
//

#import "SPFindSayViewController.h"
#import "SPFindListenViewController.h"

@interface SPFindSayViewController () <UITextViewDelegate> {
    UITextView *contentTitleTextView;
    UITextView *contentDetailTextView;
    
    UILabel *titleLabel;
    UILabel *contentLabel;
}

@property (weak, nonatomic) IBOutlet UIView *findSayTitleICONView;
@property (weak, nonatomic) IBOutlet UIView *findSayTitleView;
@property (weak, nonatomic) IBOutlet UIView *findSaySubTitleICONView;
@property (weak, nonatomic) IBOutlet UIView *findSaySubTitleView;
@property (weak, nonatomic) IBOutlet UIView *findSayTagICONView;
@property (weak, nonatomic) IBOutlet UIView *findSayTagView;
@property (weak, nonatomic) IBOutlet UIScrollView *findSayContentView;

@end

@implementation SPFindSayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initBeginView];
    
    [self addBorderToView:_findSayTitleICONView];
    [self addBorderToView:_findSayTitleView];
    [self addBorderToView:_findSaySubTitleICONView];
    [self addBorderToView:_findSaySubTitleView];
    [self addBorderToView:_findSayTagICONView];
    [self addBorderToView:_findSayTagView];
    [self addBorderToView:_findSayContentView];
    
    [self initContentLabel];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self initContentTextView];
}

/**
 *  Rewrite the BaseViewController Function
 */
- (void)goBack {
    [self.navigationController popViewControllerAnimated:YES];
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

- (IBAction)publishBtnClicked:(id)sender {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CGRect frame = window.bounds;
    UIView *successView = [[UIView alloc] initWithFrame:frame];
    [successView setBackgroundColor:[UIColor grayColor]];
    [successView setAlpha:0.8f];
    [window addSubview:successView];
    
    UIImageView *successImageView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 147)/2, (frame.size.height - 147)/2, 147, 147)];
    [successImageView setImage:[UIImage imageNamed:@"publishSuccess"]];
    [window addSubview:successImageView];
    
    [UIView animateWithDuration:.5f delay:1.5f options:UIViewAnimationOptionTransitionNone animations:^{
        [successImageView setAlpha:0.0f];
        [successView setAlpha:0.0f];
    } completion:^(BOOL finished){
        [successImageView removeFromSuperview];
        [successView removeFromSuperview];
        
        SPFindListenViewController *findListenView = [self.storyboard instantiateViewControllerWithIdentifier:@"findListenView"];
        [self.navigationController pushViewController:findListenView animated:YES];
    }];
}

- (void)initContentLabel {
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 8, 51, 21)];
    [titleLabel setTextColor:RGBA(0, 127, 85, 1)];
    [titleLabel setText:@"题记："];
    [_findSayContentView addSubview:titleLabel];
    
    contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 104, 51, 21)];
    [contentLabel setTextColor:RGBA(0, 127, 85, 1)];
    [contentLabel setText:@"正文："];
    [_findSayContentView addSubview:contentLabel];
}

- (void)initContentTextView {
    
    contentTitleTextView = [[UITextView alloc] initWithFrame:CGRectMake(8, 34, _findSayContentView.frame.size.width - 16, 55)];
    contentTitleTextView.delegate = self;
    [contentTitleTextView setTextColor:[UIColor lightGrayColor]];
    [contentTitleTextView setBackgroundColor:[UIColor clearColor]];
    [contentTitleTextView setText:@"请输入题记"];
    [_findSayContentView addSubview:contentTitleTextView];
    
    contentDetailTextView = [[UITextView alloc] initWithFrame:CGRectMake(8, 130, _findSayContentView.frame.size.width - 16, _findSayContentView.frame.size.height - 130 - 8)];
    contentDetailTextView.delegate = self;
    [contentDetailTextView setTextColor:[UIColor lightGrayColor]];
    [contentDetailTextView setBackgroundColor:[UIColor clearColor]];
    [contentDetailTextView setText:@"请输入正文"];
    [_findSayContentView addSubview:contentDetailTextView];
}

#pragma mark UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView {
    
    NSLog(@"宽度%f", textView.bounds.size.width);
    NSLog(@"View宽度%f", _findSayContentView.bounds.size.width);
    CGRect bounds = textView.bounds;
    // 计算 text view 的高度
    CGSize maxSize = CGSizeMake(bounds.size.width, CGFLOAT_MAX);
    CGSize newSize = [textView sizeThatFits:maxSize];
    bounds.size = newSize;
    
    textView.bounds = bounds;
}

@end
