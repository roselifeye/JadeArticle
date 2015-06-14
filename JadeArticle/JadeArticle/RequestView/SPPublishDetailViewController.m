//
//  SPPublishDetailViewController.m
//  
//
//  Created by Roselifeye on 2015-06-14.
//
//

#import "SPPublishDetailViewController.h"

@interface SPPublishDetailViewController () {
    UILabel *titleLabel;
    UILabel *subTitleLabel;
    UILabel *tagLabel;
    UITextView *contentTextView;
    UIImageView *jadeImageView;
    UIView *sendTextView;
}

@end

@implementation SPPublishDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initBeginView];
    
    [self initTitle];
    [self initTagLabel];
    [self initTextView];
    [self initImageView];
    [self initSendTextView];
}

- (void)goBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)initTitle {
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, CGRectGetWidth(self.view.frame) - 30, 60)];
    [titleLabel setTextAlignment:NSTextAlignmentLeft];
    [titleLabel setTextColor:RGBA(0, 127, 85, 1)];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:25.f]];
    [titleLabel setNumberOfLines:2];
    [titleLabel setText:@"一个老手镯，年代久远，求鉴赏"];
    [_contentScroll addSubview:titleLabel];
    
    subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 70 + 10, 150, 23)];
    [subTitleLabel setTextAlignment:NSTextAlignmentLeft];
    [subTitleLabel setTextColor:RGBA(0, 127, 85, 1)];
    [subTitleLabel setFont:[UIFont systemFontOfSize:13.f]];
    [subTitleLabel setText:@"发布者 远方的远方"];
    [_contentScroll addSubview:subTitleLabel];
}

- (void)initTagLabel {
    tagLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, subTitleLabel.frame.origin.y + CGRectGetHeight(subTitleLabel.frame) + 20, 150, 90)];
    [tagLabel setTextAlignment:NSTextAlignmentLeft];
    [tagLabel setTextColor:RGBA(166, 59, 62, 1)];
    [tagLabel setFont:[UIFont systemFontOfSize:15.f]];
    [tagLabel setNumberOfLines:4];
    [tagLabel setText:@"物件名称/老手镯/n瑕疵描述/无/n尺寸/内径54，厚8/n重量56g"];
    [_contentScroll addSubview:tagLabel];
}

- (void)initTextView {
    NSString *contentStr = @"这是手镯是奶奶的奶奶传下来的，很久远，但一直保存完好，无瑕疵。只是包浆非常厚重，想知道这个是否为翡翠？然后现在市场价如何？我是继续留着还是出售呢？";
    CGRect frame = CGRectMake(0, tagLabel.frame.origin.y + CGRectGetHeight(tagLabel.frame) + 15, CGRectGetWidth(titleLabel.frame), 10);
    contentTextView = [[UITextView alloc] initWithFrame:frame];
    [contentTextView setText:contentStr];
    [contentTextView setFont:[UIFont systemFontOfSize:17.f]];
    [contentTextView setTextColor:RGBA(102, 102, 102, 1)];
    [contentTextView setBackgroundColor:[UIColor clearColor]];
    [contentTextView setScrollEnabled:NO];
    
    CGSize textViewSize = [contentTextView sizeThatFits:CGSizeMake(CGRectGetWidth(contentTextView.frame), FLT_MAX)];
    frame.size = textViewSize;
    [contentTextView setFrame:frame];
    
    [_contentScroll addSubview:contentTextView];
    CGSize scrollContentSize = _contentScroll.contentSize;
    scrollContentSize.height += textViewSize.height + 150;
    _contentScroll.contentSize = scrollContentSize;
}

- (void)initImageView {
    jadeImageView = [[UIImageView alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame) - 320 - 30)/2.f, contentTextView.frame.origin.y + CGRectGetHeight(contentTextView.frame) + 15, 320, 453)];
    [jadeImageView setImage:[UIImage imageNamed:@"jadeArticleExaple"]];
    [_contentScroll addSubview:jadeImageView];
    
    CGSize scrollContentSize = _contentScroll.contentSize;
    scrollContentSize.height += 453 + 110;
    _contentScroll.contentSize = scrollContentSize;
}

- (void)initSendTextView {
    UILabel *sendTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, jadeImageView.frame.origin.y + CGRectGetHeight(jadeImageView.frame) + 15, 100, 23)];
    [sendTitle setTextAlignment:NSTextAlignmentLeft];
    [sendTitle setFont:[UIFont systemFontOfSize:14.f]];
    [sendTitle setTextColor:RGBA(0, 127, 85, 1)];
    [sendTitle setText:@"我来解惑"];
    [_contentScroll addSubview:sendTitle];
    
    sendTextView = [[UIView alloc] initWithFrame:CGRectMake(0, sendTitle.frame.origin.y + CGRectGetHeight(sendTitle.frame) + 5, CGRectGetWidth(self.view.frame) - 30, 80)];
    [sendTextView.layer setBorderColor:RGBA(0, 127, 85, 1).CGColor];
    [sendTextView.layer setBorderWidth:2.0f];
    [_contentScroll addSubview:sendTextView];
    
    UIImageView *iconImage = [[UIImageView alloc]  initWithFrame:CGRectMake(8, 8, 40, 40)];
    [iconImage setImage:[UIImage imageNamed:@"foundICON1"]];
    [sendTextView addSubview:iconImage];
    
    UITextField *sendTextField = [[UITextField alloc] initWithFrame:CGRectMake(iconImage.frame.origin.x + CGRectGetWidth(iconImage.frame) + 10, 8, 100, 30)];
    [sendTextField setBorderStyle:UITextBorderStyleNone];
    [sendTextField setPlaceholder:@"请输入文字"];
    [sendTextView addSubview:sendTextField];
    
    UIButton *sendBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(sendTextView.frame) - 30 - 8, CGRectGetHeight(sendTextView.frame) - 30 - 8, 30, 30)];
    [sendBtn setImage:[UIImage imageNamed:@"reviewBtnGreen"] forState:UIControlStateNormal];
    [sendTextView addSubview:sendBtn];
    
    CGSize scrollContentSize = _contentScroll.contentSize;
    scrollContentSize.height += 80 + 50;
    _contentScroll.contentSize = scrollContentSize;
}

@end
