//
//  SPReadViewController.m
//  JadeArticle
//
//  Created by Roselifeye on 15/6/4.
//  Copyright (c) 2015年 Roselifeye. All rights reserved.
//

#import "SPReadViewController.h"
#import "SPReadDetailViewController.h"
#import "SPMainViewController.h"

@interface SPReadViewController () {
    /**
     *  I used AutoLayout UIButtons before, But this time we need animation of Path. So I just made the iPhone 6 screen suit.
     *
     */
    UIImageView *btn1;
    UIImageView *btn2;
    UIImageView *btn3;
    UIImageView *btn4;
    UIImageView *btn5;
    UIImageView *btn6;
}

@end

@implementation SPReadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initBeginView];
    [self initNavigationViewArray];
    [self initButtons];
    
    
}

/**
 *  169.5, 139
    271.5, 195
    271.5, 326
    169.5, 379
    67.5, 326
    67.5, 195
 */

- (void)initNavigationViewArray {
    SPMainViewController *mainView = [self.storyboard instantiateViewControllerWithIdentifier:@"mainMenuVIew"];
    NSArray *viewArray = [NSArray arrayWithObjects:mainView, self, nil];
    self.navigationController.viewControllers = viewArray;
}

- (void)initBeginView {
    UIImage *bgImage = [UIImage imageNamed:@"LeftMenuBG"];
    self.view.layer.contents = (id) bgImage.CGImage;
    [self.navigationController setNavigationBarHidden:YES];
    
    [self curtainRevealViewFromView:[self createDoorViewWithBGImageName:@"MainMenuBG" andDoorknobImageName:@"doorknob"]
                  ToDestinationView:self.view
                   andLogoImageView:[self createDoorViewWithBGImageName:@"MainMenuBG" andDoorknobImageName:@"readDoorKnob"]
                    transitionStyle:SPCurtainTransitionHorizontal];
}

- (void)initButtons {
    btn1 = [[UIImageView alloc] initWithFrame:CGRectMake(169, 161, 36, 36)];
    [btn1 setImage:[UIImage imageNamed:@"zhongBtn"]];
//    [btn1 setImage:[UIImage imageNamed:@"zhongBtn_highlighted"] forState:UIControlStateSelected];
    [btn1 setTag:0];
    [btn1 setAlpha:0];
    [self.view addSubview:btn1];
    
    btn2 = [[UIImageView alloc] initWithFrame:CGRectMake(274, 222, 36, 36)];
    [btn2 setImage:[UIImage imageNamed:@"diBtn"]];
//    [btn2 setImage:[UIImage imageNamed:@"diBtn_highlighted"] forState:UIControlStateSelected];
    [btn2 setTag:1];
    [btn2 setAlpha:0];
    [self.view addSubview:btn2];
    
    btn3 = [[UIImageView alloc] initWithFrame:CGRectMake(274, 341, 36, 36)];
    [btn3 setImage:[UIImage imageNamed:@"seBtn"]];
//    [btn3 setImage:[UIImage imageNamed:@"seBtn_highlighted"	] forState:UIControlStateSelected];
    [btn3 setTag:2];
    [btn3 setAlpha:0];
    [self.view addSubview:btn3];
    
    btn4 = [[UIImageView alloc] initWithFrame:CGRectMake(169, 400, 36, 36)];
    [btn4 setImage:[UIImage imageNamed:@"shuiBtn"]];
//    [btn4 setImage:[UIImage imageNamed:@"shuiBtn_highlighted"] forState:UIControlStateSelected];
    [btn4 setTag:3];
    [btn4 setAlpha:0];
    [self.view addSubview:btn4];
    
    btn5 = [[UIImageView alloc] initWithFrame:CGRectMake(66, 341, 36, 36)];
    [btn5 setImage:[UIImage imageNamed:@"yiBtn"]];
//    [btn5 setImage:[UIImage imageNamed:@"yiBtn_highlighted"] forState:UIControlStateSelected];
    [btn5 setTag:4];
    [btn5 setAlpha:0];
    [self.view addSubview:btn5];
    
    btn6 = [[UIImageView alloc] initWithFrame:CGRectMake(66, 222, 36, 36)];
    [btn6 setImage:[UIImage imageNamed:@"yangBtn"]];
//    [btn6 setImage:[UIImage imageNamed:@"yangBtn_highlighted"] forState:UIControlStateSelected];
    [btn6 setTag:5];
    [btn6 setAlpha:0];
    [self.view addSubview:btn6];
}

- (IBAction)beginReadBtnClicked:(UIButton *)sender {
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    if (nil == [userdefaults objectForKey:@"btnTag"]) {
        [userdefaults setObject:@"0" forKey:@"btnTag"];
    }
    int n = [[userdefaults objectForKey:@"btnTag"] intValue];
    _roundBtn.rotate(-60*n).animateWithCompletion(1*n, JHAnimationCompletion() {
        [btn1 setAlpha:1.f];
        [btn2 setAlpha:1.f];
        [btn3 setAlpha:1.f];
        [btn4 setAlpha:1.f];
        [btn5 setAlpha:1.f];
        [btn6 setAlpha:1.f];
        
        [btn1 setImage:[UIImage imageNamed:@"zhongBtn_highlighted"]];
        [sender setHidden:YES];
        [self setStarImageWithTag:n];
    });
}

- (void)setStarImageWithTag:(int)tag {
    UIImageView *starImageView = [[UIImageView alloc] init];
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    if (nil == [userdefaults objectForKey:@"starIndex"]) {
        [userdefaults setObject:@"0" forKey:@"starIndex"];
    }
    int n = [[userdefaults objectForKey:@"starIndex"] intValue];
    switch (tag) {
        case 0: {
            starImageView.frame = CGRectMake((CGRectGetWidth(self.view.frame) - 139)/2.f, 232, 139, 104);
            if (0 == n) {
                [starImageView setImage:[UIImage imageNamed:@"zhongStar"]];
            } else
                [starImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"zhongStar%d", n+1]]];
            [starImageView setAlpha:0.f];
            [self.view addSubview:starImageView];
        }
            break;
        case 1: {
            starImageView.frame = CGRectMake((CGRectGetWidth(self.view.frame) - 65)/2.f, 210, 65, 168);
            if (0 == n) {
                [starImageView setImage:[UIImage imageNamed:@"diStar"]];
            } else
                [starImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"diStar%d", n+1]]];
            [starImageView setAlpha:0.f];
            [self.view addSubview:starImageView];
        }
            break;
        case 2: {
            starImageView.frame = CGRectMake((CGRectGetWidth(self.view.frame) - 89)/2.f, 230, 89, 117);
            if (0 == n) {
                [starImageView setImage:[UIImage imageNamed:@"seStar"]];
            } else
                [starImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"seStar%d", n+1]]];
            [starImageView setAlpha:0.f];
            [self.view addSubview:starImageView];
        }
            break;
        case 3: {
            starImageView.frame = CGRectMake((CGRectGetWidth(self.view.frame) - 80)/2.f, 210, 80, 169);
            if (0 == n) {
                [starImageView setImage:[UIImage imageNamed:@"shuiStar"]];
            } else
                [starImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"shuiStar%d", n+1]]];
            [starImageView setAlpha:0.f];
            [self.view addSubview:starImageView];
        }
            break;
        case 4: {
            starImageView.frame = CGRectMake((CGRectGetWidth(self.view.frame) - 74)/2.f, 220, 74, 144);
            if (0 == n) {
                [starImageView setImage:[UIImage imageNamed:@"yiStar"]];
            } else
                [starImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"yiStar%d", n+1]]];
            [starImageView setAlpha:0.f];
            [self.view addSubview:starImageView];
        }
            break;
        case 5: {
            starImageView.frame = CGRectMake((CGRectGetWidth(self.view.frame) - 145)/2.f, 232, 145, 111);
            if (0 == n) {
                [starImageView setImage:[UIImage imageNamed:@"yangStar"]];
            } else
                [starImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"yangStar%d", n+1]]];
            [starImageView setAlpha:0.f];
            [self.view addSubview:starImageView];
        }
            break;
            
        default:
            break;
    }
    [UIView animateWithDuration:0.5f animations:^{
        [starImageView setAlpha:1.f];
    } completion:^(BOOL finished) {
        CGRect frame = starImageView.frame;
        frame.origin.x = CGRectGetWidth(self.view.frame) - CGRectGetWidth(starImageView.frame) - 8;
        frame.origin.y = 8;
        starImageView.makeFrame(frame).animateWithCompletion(1, JHAnimationCompletion() {
            SPReadDetailViewController *readDetailView = [self.storyboard instantiateViewControllerWithIdentifier:@"readDetailView"];
            [self.navigationController pushViewController:readDetailView animated:NO];
        });
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
