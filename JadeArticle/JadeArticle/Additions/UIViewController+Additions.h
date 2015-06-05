//
//  UIViewController+Additions.h
//  JadeArticle
//
//  Created by Roselifeye on 15/6/4.
//  Copyright (c) 2015年 Roselifeye. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum _SPCurtainTransitionStyle {
    SPCurtainTransitionHorizontal = 0,
    SPCurtainTransitionVertical = 1
} SPCurtainTransitionStyle;

@interface UIViewController (Additions)

/**
 *  Create DoorView For the FromView of Open Door Animation
 *
 *  @param BGImageName       Background Image Name
 *  @param DoorknobImageName Doorknob Image Name in the Center of the View
 *
 *  @return The Created View
 */
- (UIImageView *)createDoorViewWithBGImageName:(NSString *)BGImageName andDoorknobImageName:(NSString *)DoorknobImageName;

/**
 *  Open Door Animation
 *
 *  @param fromView        Door View
 *  @param toView          End View
 *  @param LogoImageName   The Logo Image Name
 *  @param transitionStyle Horizontal: Up and Down, Vertical: Left and Right
 */
- (void)curtainRevealViewFromView:(UIView *)fromView ToDestinationView:(UIView *)toView andLogoImageView:(UIView *)LogoImageView transitionStyle:(SPCurtainTransitionStyle)transitionStyle;

- (void)curtainCloseViewFromView:(UIView *)fromView ToDestinationView:(UIView *)toView transitionStyle:(SPCurtainTransitionStyle)transitionStyle;

@end
