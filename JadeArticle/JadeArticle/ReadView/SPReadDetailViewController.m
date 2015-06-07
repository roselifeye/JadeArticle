//
//  SPZhongViewController.m
//  JadeArticle
//
//  Created by Roselifeye on 15/6/5.
//  Copyright (c) 2015年 Roselifeye. All rights reserved.
//

#import "SPReadDetailViewController.h"

@implementation SPReadDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initBeginView];
}

/**
 *  Rewrite the BaseViewController Function
 */
- (void)goBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)initBeginView {
    UIImage *bgImage = [UIImage imageNamed:@"LeftMenuBG"];
    self.view.layer.contents = (id) bgImage.CGImage;
    [self.navigationController setNavigationBarHidden:YES];
}


@end
