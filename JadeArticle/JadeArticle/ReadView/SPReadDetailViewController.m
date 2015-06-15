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
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    int n = [[userdefaults objectForKey:@"btnTag"] intValue];
    [self initStarMapViewWithTag:n];
}

/**
 *  Positon of GroundBG in iPhone6
 *  67.5, 157.0
 */
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
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

- (void)initStarMapViewWithTag:(int)tag {
    UIImageView *starImageView = [[UIImageView alloc] init];
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    if (nil == [userdefaults objectForKey:@"starIndex"]) {
        [userdefaults setObject:@"0" forKey:@"starIndex"];
    }
    int n = [[userdefaults objectForKey:@"starIndex"] intValue];
    switch (tag) {
        case 0: {
            starImageView.frame = CGRectMake(CGRectGetWidth(self.view.frame) - 139 - 8, 8, 139, 104);
            if (0 == n) {
                [starImageView setImage:[UIImage imageNamed:@"zhongStar"]];
            } else
                [starImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"zhongStar%d", n+1]]];
            [self.view addSubview:starImageView];
        }
            break;
        case 1: {
            starImageView.frame = CGRectMake(CGRectGetWidth(self.view.frame) - 65 - 8, 210, 65, 168);
            if (0 == n) {
                [starImageView setImage:[UIImage imageNamed:@"diStar"]];
            } else
                [starImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"diStar%d", n+1]]];
            [self.view addSubview:starImageView];
        }
            break;
        case 2: {
            starImageView.frame = CGRectMake(CGRectGetWidth(self.view.frame) - 89 - 8, 230, 89, 117);
            if (0 == n) {
                [starImageView setImage:[UIImage imageNamed:@"seStar"]];
            } else
                [starImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"seStar%d", n+1]]];

            [self.view addSubview:starImageView];
        }
            break;
        case 3: {
            starImageView.frame = CGRectMake(CGRectGetWidth(self.view.frame) - 80 - 8, 210, 80, 169);
            if (0 == n) {
                [starImageView setImage:[UIImage imageNamed:@"shuiStar"]];
            } else
                [starImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"shuiStar%d", n+1]]];
            [self.view addSubview:starImageView];
        }
            break;
        case 4: {
            starImageView.frame = CGRectMake(CGRectGetWidth(self.view.frame) - 74 - 8, 220, 74, 144);
            if (0 == n) {
                [starImageView setImage:[UIImage imageNamed:@"yiStar"]];
            } else
                [starImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"yiStar%d", n+1]]];
            [self.view addSubview:starImageView];
        }
            break;
        case 5: {
            starImageView.frame = CGRectMake(CGRectGetWidth(self.view.frame) - 145 - 8, 232, 145, 111);
            if (0 == n) {
                [starImageView setImage:[UIImage imageNamed:@"yangStar"]];
            } else
                [starImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"yangStar%d", n+1]]];
            [self.view addSubview:starImageView];
        }
            break;
            
        default:
            break;
    }

}


@end
