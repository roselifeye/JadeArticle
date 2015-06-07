//
//  SPFindListenViewController.m
//  JadeArticle
//
//  Created by Roselifeye on 15/6/6.
//  Copyright (c) 2015年 Roselifeye. All rights reserved.
//

#import "SPFindListenViewController.h"
#import "SPFindSayViewController.h"

@implementation SPFindListenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initBeginView];
    [self updateNavigationViewControllers];
}

/**
 *  Update NavigationController ViewControllers Array when the parent class is SPFindSayViewController.
 */
- (void)updateNavigationViewControllers {
    NSMutableArray *viewArray = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
    if ([[viewArray objectAtIndex:[viewArray count]-2] isKindOfClass:[SPFindSayViewController class]]) {
        [viewArray removeObjectAtIndex:[viewArray count]-2];
        self.navigationController.viewControllers = viewArray;
    }
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

@end
