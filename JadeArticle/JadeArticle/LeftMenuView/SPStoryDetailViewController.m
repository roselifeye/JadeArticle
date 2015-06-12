//
//  SPStoryDetailViewController.m
//  
//
//  Created by Roselifeye on 2015-06-11.
//
//

#import "SPStoryDetailViewController.h"
#import "SPShareView.h"

@interface SPStoryDetailViewController () {
    UILabel *titleLabel;
    UILabel *subTitleLabel;
    UILabel *tagLabel;
    UITextView *contentTextView;
}

@end

@implementation SPStoryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initBeginView];
    
    [self initTitle];
    [self initTagLabel];
    [self initTextView];
}

- (void)initBeginView {
    UIImage *bgImage = [UIImage imageNamed:@"MainMenuBG"];
    self.view.layer.contents = (id) bgImage.CGImage;
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)initTitle {
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame) - 30, 60)];
    [titleLabel setTextAlignment:NSTextAlignmentLeft];
    [titleLabel setTextColor:RGBA(0, 127, 85, 1)];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:25.f]];
    [titleLabel setNumberOfLines:2];
    [titleLabel setText:[_contentDic objectForKey:@"title"]];
    [_contentScroll addSubview:titleLabel];
    
    subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 60 + 10, 150, 23)];
    [subTitleLabel setTextAlignment:NSTextAlignmentLeft];
    [subTitleLabel setTextColor:RGBA(0, 127, 85, 1)];
    [subTitleLabel setFont:[UIFont systemFontOfSize:13.f]];
    [subTitleLabel setText:[NSString stringWithFormat:@"作者 %@", [_contentDic objectForKey:@"author"]]];
    [_contentScroll addSubview:subTitleLabel];
}

- (void)initTagLabel {
    tagLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, subTitleLabel.frame.origin.y + CGRectGetHeight(subTitleLabel.frame) + 20, 150, 23)];
    [tagLabel setTextAlignment:NSTextAlignmentLeft];
    [tagLabel setTextColor:RGBA(166, 59, 62, 1)];
    [tagLabel setFont:[UIFont systemFontOfSize:15.f]];
    [tagLabel setText:[NSString stringWithFormat:@"标签/%@", [_contentDic objectForKey:@"tag"]]];
    [_contentScroll addSubview:tagLabel];
}

- (void)initTextView {
    NSString *contentStr = [_contentDic objectForKey:@"content"];
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

- (IBAction)backBtnClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)collectBtnClicked:(UIButton *)sender {
    sender.selected = !sender.selected;
}

- (IBAction)shareBtnClicked:(id)sender {
    SPShareView *shareView = [[SPShareView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:shareView];
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
