//
//  SPMyQuestionViewController.m
//  JadeArticle
//
//  Created by Roselifeye on 15/6/6.
//  Copyright (c) 2015年 Roselifeye. All rights reserved.
//

#import "SPMyQuestionViewController.h"

@implementation SPMyQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *bgImage = [UIImage imageNamed:@"MainMenuBG"];
    self.view.layer.contents = (id) bgImage.CGImage;
    [self.navigationController setNavigationBarHidden:YES];
}

- (IBAction)leftMenu:(id)sender {
    [self.sideMenuViewController presentLeftMenuViewController];
}

@end
