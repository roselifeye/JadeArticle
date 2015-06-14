//
//  SPPublishPhotoViewController.m
//  JadeArticle
//
//  Created by Roselifeye on 15/6/6.
//  Copyright (c) 2015年 Roselifeye. All rights reserved.
//

#import "SPPublishPhotoViewController.h"
#import "SPPublishDetailViewController.h"

@interface SPPublishPhotoViewController ()

@property (weak, nonatomic) IBOutlet UIView *questionICONView;
@property (weak, nonatomic) IBOutlet UIView *questionTitleView;
@property (weak, nonatomic) IBOutlet UIView *questionDetailView;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField
;

@property (weak, nonatomic) IBOutlet UITextField *stuffTextField;
@property (weak, nonatomic) IBOutlet UITextField *shortageTextField;
@property (weak, nonatomic) IBOutlet UITextField *sizeTextField;
@property (weak, nonatomic) IBOutlet UITextField *weightTextField;
@property (weak, nonatomic) IBOutlet UITextView *detailTextView;

@end

@implementation SPPublishPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initBeginView];
    
    [self addBorderToView:_questionICONView];
    [self addBorderToView:_questionTitleView];
    [self addBorderToView:_questionDetailView];
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
    SPPublishDetailViewController *detailView = [self.storyboard instantiateViewControllerWithIdentifier:@"publishDetailView"];
    [self.navigationController pushViewController:detailView animated:YES];
}


@end
