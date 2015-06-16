//
//  SPZhongViewController.m
//  JadeArticle
//
//  Created by Roselifeye on 15/6/5.
//  Copyright (c) 2015年 Roselifeye. All rights reserved.
//

#import "SPReadDetailViewController.h"

// 8 + 6 + 8 + 6 + 4 + 5
#define totalScroll (8 + 6 + 8 + 6 + 4 + 5)

@interface SPReadDetailViewController () < UIScrollViewDelegate>{
    UIImageView *starMapImageView;
    
    int tag;
    int starIndex;
}

@end

@implementation SPReadDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initBeginView];
    [self initStarMapViewWithTag];
    [_contentScroll setContentSize:CGSizeMake(CGRectGetWidth(_contentScroll.frame)*totalScroll, CGRectGetHeight(_contentScroll.frame))];
}

/**
 *  Positon of GroundBG in iPhone6
 *  67.5, 157.0
 */

/**
 *  Rewrite the BaseViewController Function
 */
- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)initBeginView {
    UIImage *bgImage = [UIImage imageNamed:@"LeftMenuBG"];
    self.view.layer.contents = (id) bgImage.CGImage;
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)initStarMapViewWithTag {
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    tag = [[userdefaults objectForKey:@"btnTag"] intValue];
    if (nil == [userdefaults objectForKey:@"starIndex"]) {
        [userdefaults setObject:@"0" forKey:@"starIndex"];
    }
    starIndex = [[userdefaults objectForKey:@"starIndex"] intValue];

    starMapImageView = [[UIImageView alloc] init];
    for (int i = 0; i < 8; i++) {
        UIImageView *starImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"zhongImage%d", i+1]]];
        UIImageView *wordImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"zhongWords%d", i+1]]];
        [self addStarImage:starImageView andIndex:i];
        [self addWordImage:wordImageView andIndex:i];
    }
    for (int i = 8; i < 8 + 6; i++) {
        UIImageView *starImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"diImage%d", i-8+1]]];
        UIImageView *wordImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"diWords%d", i-8+1]]];
        [self addStarImage:starImageView andIndex:i];
        [self addWordImage:wordImageView andIndex:i];
    }
    for (int i = 14; i < 14 + 8; i++) {
        UIImageView *starImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"seImage%d", i-14+1]]];
        UIImageView *wordImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"seWords%d", i-14+1]]];
        [self addStarImage:starImageView andIndex:i];
        [self addWordImage:wordImageView andIndex:i];
    }
    for (int i = 22; i < 22 + 6; i++) {
        UIImageView *starImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"shuiImage%d", i-22+1]]];
        UIImageView *wordImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"shuiWords%d", i-22+1]]];
        [self addStarImage:starImageView andIndex:i];
        [self addWordImage:wordImageView andIndex:i];
    }
    for (int i = 28; i < 28 + 4; i++) {
        UIImageView *starImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"yiImage%d", i-28+1]]];
        UIImageView *wordImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"yiWords%d", i-28+1]]];
        [self addStarImage:starImageView andIndex:i];
        [self addWordImage:wordImageView andIndex:i];
    }
    for (int i = 32; i < 32 + 5; i++) {
        UIImageView *starImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"yangImage%d", i-32+1]]];
        UIImageView *wordImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"yangWords%d", i-32+1]]];
        [self addStarImage:starImageView andIndex:i];
        [self addWordImage:wordImageView andIndex:i];
    }
    [self setStarMapImageWithTag:tag andIndex:starIndex];
    [self.view addSubview:starMapImageView];
    [_contentScroll setContentOffset:CGPointMake(CGRectGetWidth(_contentScroll.frame) * starIndex, 0)];
}

- (void)setStarMapImageWithTag:(int)mapTag andIndex:(int)index{
    UIImage *starImage = [[UIImage alloc] init];
    switch (mapTag) {
        case 0: {
            starMapImageView.frame = CGRectMake(CGRectGetWidth(self.view.frame) - 139 - 8, 8, 139, 104);
            if (0 == index) {
                starImage = [UIImage imageNamed:@"zhongStar"];
//                [starMapImageView setImage:[UIImage imageNamed:@"zhongStar"]];
            } else
                starImage = [UIImage imageNamed:[NSString stringWithFormat:@"zhongStar%d", index+1]];
//                [starMapImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"zhongStar%d", starIndex+1]]];
        }
            break;
        case 1: {
            starMapImageView.frame = CGRectMake(CGRectGetWidth(self.view.frame) - 65 - 8, 8, 65, 168);
            if (8 == index) {
                starImage = [UIImage imageNamed:@"diStar"];
//                [starMapImageView setImage:[UIImage imageNamed:@"diStar"]];
            } else
                starImage = [UIImage imageNamed:[NSString stringWithFormat:@"diStar%d", index-8+1]];
                [starMapImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"diStar%d", starIndex+1]]];
        }
            break;
        case 2: {
            starMapImageView.frame = CGRectMake(CGRectGetWidth(self.view.frame) - 89 - 8, 8, 89, 117);
            if (14 == index) {
                starImage = [UIImage imageNamed:@"seStar"];
//                [starMapImageView setImage:[UIImage imageNamed:@"seStar"]];
            } else
                starImage = [UIImage imageNamed:[NSString stringWithFormat:@"seStar%d", index-14+1]];
//                [starMapImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"seStar%d", starIndex+1]]];
        }
            break;
        case 3: {
            starMapImageView.frame = CGRectMake(CGRectGetWidth(self.view.frame) - 80 - 8, 8, 80, 169);
            if (22 == index) {
                starImage = [UIImage imageNamed:@"shuiStar"];
//                [starMapImageView setImage:[UIImage imageNamed:@"shuiStar"]];
            } else
                starImage = [UIImage imageNamed:[NSString stringWithFormat:@"shuiStar%d", index-22+1]];
//                [starMapImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"shuiStar%d", starIndex+1]]];
        }
            break;
        case 4: {
            starMapImageView.frame = CGRectMake(CGRectGetWidth(self.view.frame) - 74 - 8, 8, 74, 144);
            if (28 == index) {
                starImage = [UIImage imageNamed:@"yiStar"];
//                [starMapImageView setImage:[UIImage imageNamed:@"yiStar"]];
            } else
                starImage = [UIImage imageNamed:[NSString stringWithFormat:@"yiStar%d", index-28+1]];
//                [starMapImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"yiStar%d", starIndex+1]]];
        }
            break;
        case 5: {
            starMapImageView.frame = CGRectMake(CGRectGetWidth(self.view.frame) - 145 - 8, 8, 145, 111);
            if (32 == index) {
                starImage = [UIImage imageNamed:@"yangStar"];
//                [starMapImageView setImage:[UIImage imageNamed:@"yangStar"]];
            } else
                starImage = [UIImage imageNamed:[NSString stringWithFormat:@"yangStar%d", index-32+1]];
//                [starMapImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"yangStar%d", starIndex+1]]];
        }
            break;
            
        default:
            break;
    }
    [starMapImageView setImage:starImage];
    [starMapImageView setFrame:CGRectMake(CGRectGetWidth(self.view.frame) - starImage.size.width - 8, 8, starImage.size.width, starImage.size.height)];
}

- (void)addStarImage:(UIImageView*)starImage andIndex:(int)index {
    
    [_contentScroll setContentSize:CGSizeMake(CGRectGetWidth(_contentScroll.frame) * 8, CGRectGetHeight(_contentScroll.frame))];
    [starImage setContentMode:UIViewContentModeScaleAspectFit];
    CGRect frame = starImage.frame;
    frame.origin.x = ((240 - CGRectGetWidth(starImage.frame))/2.f) + 240*index;
    frame.origin.y = (240 - CGRectGetHeight(starImage.frame))/2.f;
    [starImage setFrame:frame];
    NSLog(@"%f %f", CGRectGetWidth(starImage.frame), frame.origin.y);
    [_contentScroll addSubview:starImage];
}

- (void)addWordImage:(UIImageView *)wordImage andIndex:(int)index {
    [wordImage setContentMode:UIViewContentModeScaleAspectFit];
    CGRect frame = wordImage.frame;
    frame.origin.x = ((240 - CGRectGetWidth(wordImage.frame))/2.f) + 240*index;
    frame.origin.y = CGRectGetHeight(_contentScroll.frame) - CGRectGetHeight(wordImage.frame) - 80;
    [wordImage setFrame:frame];
    [_contentScroll addSubview:wordImage];
}

#pragma UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = _contentScroll.frame.size.width;
    int currentPage = floor((_contentScroll.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    [userdefaults setObject:[NSString stringWithFormat:@"%d", currentPage] forKey:@"starIndex"];
    starIndex = currentPage;
    if (currentPage >= 0) {
        [userdefaults setObject:@"0" forKey:@"btnTag"];
        if (currentPage >= 8) {
            [userdefaults setObject:@"1" forKey:@"btnTag"];
            if (currentPage >= 14) {
                [userdefaults setObject:@"2" forKey:@"btnTag"];
                if (currentPage >= 22) {
                    [userdefaults setObject:@"3" forKey:@"btnTag"];
                    if (currentPage >= 28) {
                        [userdefaults setObject:@"4" forKey:@"btnTag"];
                        if (currentPage >= 32) {
                            [userdefaults setObject:@"5" forKey:@"btnTag"];
                        }
                    }
                }
            }
        }
    }
    tag = [[userdefaults objectForKey:@"btnTag"] intValue];
    [self setStarMapImageWithTag:tag andIndex:currentPage];
}


@end
