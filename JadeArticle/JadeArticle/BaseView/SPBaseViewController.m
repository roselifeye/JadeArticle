//
//  SPBaseViewController.m
//  JadeArticle
//
//  Created by Roselifeye on 15/6/4.
//  Copyright (c) 2015年 Roselifeye. All rights reserved.
//

#import "SPBaseViewController.h"

@interface SPBaseViewController ()

@end

@implementation SPBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 20, 45, 45)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"backBtn"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
}

- (void)goBack {
    [self curtainCloseViewFromView:[self createDoorViewWithBGImageName:@"MainMenuBG" andDoorknobImageName:@"doorknob"]
                 ToDestinationView:self.view
                   transitionStyle:SPCurtainTransitionHorizontal
                       andEndBlock:^{
                           [self.navigationController popViewControllerAnimated:NO];
                       }];
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
