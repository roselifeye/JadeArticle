//
//  SPZhongViewController.h
//  JadeArticle
//
//  Created by Roselifeye on 15/6/5.
//  Copyright (c) 2015年 Roselifeye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPReadDetailViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIImageView *groundBG;

@property (weak, nonatomic) IBOutlet UIScrollView *contentScroll;

@property (weak, nonatomic) IBOutlet UIImageView *wordImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *wordsHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *wordWidth;
@end
