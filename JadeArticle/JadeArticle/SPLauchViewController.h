//
//  SPLauchViewController.h
//  
//
//  Created by Roselifeye on 2015-06-14.
//
//

#import <UIKit/UIKit.h>

@interface SPLauchViewController : UIViewController <UIScrollViewDelegate> {
    BOOL _animating;
    
    UIScrollView *_lauchScroll;
}

@property (nonatomic, assign) BOOL animating;

@property (nonatomic, strong) UIScrollView *lauchScroll;


+ (SPLauchViewController *)sharedGuide;

+ (void)show;
+ (void)hide;

@end
