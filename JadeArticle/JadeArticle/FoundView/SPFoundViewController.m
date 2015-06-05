//
//  SPFoundViewController.m
//  JadeArticle
//
//  Created by Roselifeye on 15/6/4.
//  Copyright (c) 2015年 Roselifeye. All rights reserved.
//

#import "SPFoundViewController.h"

@interface SPFoundViewController ()

@end

@implementation SPFoundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initBeginView];
}

- (void)initBeginView {
    UIImage *bgImage = [UIImage imageNamed:@"LeftMenuBG"];
    self.view.layer.contents = (id) bgImage.CGImage;
    [self.navigationController setNavigationBarHidden:YES];
    
    
    [self curtainRevealViewFromView:[self createDoorViewWithBGImageName:@"MainMenuBG" andDoorknobImageName:@"doorknob"]
                  ToDestinationView:self.view
                   andLogoImageView:[self createDoorViewWithBGImageName:@"MainMenuBG" andDoorknobImageName:@"foundDoorKnob"]
                    transitionStyle:SPCurtainTransitionHorizontal];
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
