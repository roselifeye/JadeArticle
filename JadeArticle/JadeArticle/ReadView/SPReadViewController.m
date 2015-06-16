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
    
    UIImageView *starImageView;
    CGRect starImageFrame;
    CGRect endImageFrame;
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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (nil != starImageView) {
        NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
        int tag = [[userdefaults objectForKey:@"btnTag"] intValue];
        int index = [[userdefaults objectForKey:@"starIndex"] intValue];
        [self setStarMapImageWithTag:tag andIndex:index];
        //[self setStarImageWithTag:n];
        starImageFrame.size  = endImageFrame.size = starImageView.frame.size;
        [starImageView setFrame:starImageFrame];
        
        [self setRoundBtnSubImageWithTag:tag];
        starImageView.makeFrame(endImageFrame).animateWithCompletion(1.f, JHAnimationCompletion() {
            [starImageView setAlpha:0.f];
            [_beginBtn setHidden:NO];
        });
    }
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
    [btn1 setAlpha:0.f];
    [btn2 setAlpha:0.f];
    [btn3 setAlpha:0.f];
    [btn4 setAlpha:0.f];
    [btn5 setAlpha:0.f];
    [btn6 setAlpha:0.f];
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
        
        //[btn1 setImage:[UIImage imageNamed:@"zhongBtn_highlighted"]];
        [self setRoundBtnSubImageWithTag:n];
        [sender setHidden:YES];
        [self setStarImageWithTag:n];
    });
}

- (void)setRoundBtnSubImageWithTag:(int)tag {
    switch (tag) {
        case 0: {
            [btn1 setImage:[UIImage imageNamed:@"zhongBtn_highlighted"]];
            [btn2 setImage:[UIImage imageNamed:@"diBtn"]];
            [btn3 setImage:[UIImage imageNamed:@"seBtn"]];
            [btn4 setImage:[UIImage imageNamed:@"shuiBtn"]];
            [btn5 setImage:[UIImage imageNamed:@"yiBtn"]];
            [btn6 setImage:[UIImage imageNamed:@"yangBtn"]];
        }
            break;
        case 1: {
            [btn1 setImage:[UIImage imageNamed:@"diBtn_highlighted"]];
            [btn2 setImage:[UIImage imageNamed:@"seBtn"]];
            [btn3 setImage:[UIImage imageNamed:@"shuiBtn"]];
            [btn4 setImage:[UIImage imageNamed:@"yiBtn"]];
            [btn5 setImage:[UIImage imageNamed:@"yangBtn"]];
            [btn6 setImage:[UIImage imageNamed:@"zhongBtn"]];
        }
            break;
        case 2: {
            [btn1 setImage:[UIImage imageNamed:@"seBtn_highlighted"]];
            [btn2 setImage:[UIImage imageNamed:@"shuiBtn"]];
            [btn3 setImage:[UIImage imageNamed:@"yiBtn"]];
            [btn4 setImage:[UIImage imageNamed:@"yangBtn"]];
            [btn5 setImage:[UIImage imageNamed:@"zhongBtn"]];
            [btn6 setImage:[UIImage imageNamed:@"diBtn"]];
        }
            break;
        case 3: {
            [btn1 setImage:[UIImage imageNamed:@"shuiBtn_highlighted"]];
            [btn2 setImage:[UIImage imageNamed:@"yiBtn"]];
            [btn3 setImage:[UIImage imageNamed:@"yangBtn"]];
            [btn4 setImage:[UIImage imageNamed:@"zhongBtn"]];
            [btn5 setImage:[UIImage imageNamed:@"diBtn"]];
            [btn6 setImage:[UIImage imageNamed:@"seBtn"]];
        }
            break;
        case 4: {
            [btn1 setImage:[UIImage imageNamed:@"yiBtn_highlighted"]];
            [btn2 setImage:[UIImage imageNamed:@"yangBtn"]];
            [btn3 setImage:[UIImage imageNamed:@"zhongBtn"]];
            [btn4 setImage:[UIImage imageNamed:@"diBtn"]];
            [btn5 setImage:[UIImage imageNamed:@"seBtn"]];
            [btn6 setImage:[UIImage imageNamed:@"shuiBtn"]];
        }
            break;
        case 5: {
            [btn1 setImage:[UIImage imageNamed:@"yangBtn_highlighted"]];
            [btn2 setImage:[UIImage imageNamed:@"zhongBtn"]];
            [btn3 setImage:[UIImage imageNamed:@"diBtn"]];
            [btn4 setImage:[UIImage imageNamed:@"seBtnBtn"]];
            [btn5 setImage:[UIImage imageNamed:@"shuiBtn"]];
            [btn6 setImage:[UIImage imageNamed:@"yiBtn"]];
        }
            break;
            
        default:
            break;
    }
}

- (void)setStarImageWithTag:(int)tag {
    starImageView = [[UIImageView alloc] init];
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    if (nil == [userdefaults objectForKey:@"starIndex"]) {
        [userdefaults setObject:@"0" forKey:@"starIndex"];
    }
    int n = [[userdefaults objectForKey:@"starIndex"] intValue];
    [self setStarMapImageWithTag:tag andIndex:n];
    
    [starImageView setAlpha:0.f];
    [self.view addSubview:starImageView];
    endImageFrame = starImageView.frame;
    [UIView animateWithDuration:0.5f animations:^{
        [starImageView setAlpha:1.f];
    } completion:^(BOOL finished) {
        CGRect frame = starImageView.frame;
        frame.origin.x = CGRectGetWidth(self.view.frame) - CGRectGetWidth(starImageView.frame) - 8;
        frame.origin.y = 8;
        starImageFrame = frame;
        starImageView.makeFrame(frame).animateWithCompletion(1, JHAnimationCompletion() {
            SPReadDetailViewController *readDetailView = [self.storyboard instantiateViewControllerWithIdentifier:@"readDetailView"];
            [self.navigationController pushViewController:readDetailView animated:NO];
        });
    }];
}

- (void)setStarMapImageWithTag:(int)starTag andIndex:(int)index {
    UIImage *starImage = [[UIImage alloc] init];
    switch (starTag) {
        case 0: {
            starImageView.frame = CGRectMake((CGRectGetWidth(self.view.frame) - 139)/2.f, 232, 139, 104);
            if (0 == index) {
                starImage = [UIImage imageNamed:@"zhongStar"];
            } else
                starImage = [UIImage imageNamed:[NSString stringWithFormat:@"zhongStar%d", index+1]];
        }
            break;
        case 1: {
            starImageView.frame = CGRectMake((CGRectGetWidth(self.view.frame) - 65)/2.f, 210, 65, 168);
            if (8 == index) {
                starImage = [UIImage imageNamed:@"diStar"];
            } else
                starImage = [UIImage imageNamed:[NSString stringWithFormat:@"diStar%d", index-8+1]];
        }
            break;
        case 2: {
            starImageView.frame = CGRectMake((CGRectGetWidth(self.view.frame) - 89)/2.f, 230, 89, 117);
            if (14 == index) {
                starImage = [UIImage imageNamed:@"seStar"];
            } else
                starImage = [UIImage imageNamed:[NSString stringWithFormat:@"seStar%d", index-14+1]];
        }
            break;
        case 3: {
            starImageView.frame = CGRectMake((CGRectGetWidth(self.view.frame) - 80)/2.f, 210, 80, 169);
            if (22 == index) {
                starImage = [UIImage imageNamed:@"shuiStar"];
            } else
                starImage = [UIImage imageNamed:[NSString stringWithFormat:@"shuiStar%d", index-22+1]];
        }
            break;
        case 4: {
            starImageView.frame = CGRectMake((CGRectGetWidth(self.view.frame) - 74)/2.f, 220, 74, 144);
            if (28 == index) {
                starImage = [UIImage imageNamed:@"yiStar"];
            } else
                starImage = [UIImage imageNamed:[NSString stringWithFormat:@"yiStar%d", index-28+1]];
        }
            break;
        case 5: {
            starImageView.frame = CGRectMake((CGRectGetWidth(self.view.frame) - 145)/2.f, 232, 145, 111);
            if (32 == index) {
                starImage = [UIImage imageNamed:@"yangStar"];
            } else
                starImage = [UIImage imageNamed:[NSString stringWithFormat:@"yangStar%d", index-32+1]];
        }
            break;
            
        default:
            break;
    }
    [starImageView setImage:starImage];
    [starImageView setFrame:CGRectMake(starImageView.frame.origin.x, starImageView.frame.origin.y, starImage.size.width, starImage.size.height)];
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
