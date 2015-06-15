//
//  SPMainViewController.m
//  JadeArticle
//
//  Created by Roselifeye on 15/6/4.
//  Copyright (c) 2015年 Roselifeye. All rights reserved.
//

#import "SPMainViewController.h"
#import "CustomBarItem.h"

#import "SPRequestViewController.h"
#import "SPSearchViewController.h"
#import "SPReadViewController.h"
#import "SPFindViewController.h"
#import "SPFoundViewController.h"

#import "SPLauchViewController.h"

@interface SPMainViewController () {
}

@end

@implementation SPMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *bgImage = [UIImage imageNamed:@"MainMenuBG"];
    self.view.layer.contents = (id) bgImage.CGImage;
    [self.navigationController setNavigationBarHidden:YES];
    
    [SPLauchViewController show];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
}

- (IBAction)leftMenu:(id)sender {
    [self.sideMenuViewController presentLeftMenuViewController];
}

- (IBAction)menuBtnSelecter:(UIButton *)button {
    switch (button.tag) {
        case 0: {
            SPRequestViewController *requestView = [self.storyboard instantiateViewControllerWithIdentifier:@"requestView"];
            [self.navigationController pushViewController:requestView animated:NO];
        }
            break;
        case 1: {
            SPSearchViewController *searchView = [self.storyboard instantiateViewControllerWithIdentifier:@"searchView"];
            [self.navigationController pushViewController:searchView animated:NO];
        }
            break;
        case 2: {
            SPReadViewController *readView = [self.storyboard instantiateViewControllerWithIdentifier:@"readView"];
            [self.navigationController pushViewController:readView animated:NO];
        }
            break;
        case 3: {
            SPFindViewController *findView = [self.storyboard instantiateViewControllerWithIdentifier:@"findView"];
            [self.navigationController pushViewController:findView animated:NO];
        }
            break;
        case 4: {
            SPFoundViewController *foundView = [self.storyboard instantiateViewControllerWithIdentifier:@"foundView"];
            [self.navigationController pushViewController:foundView animated:NO];
        }
            break;
        default:
            break;
    }
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
