//
//  SPCameraView.h
//  JadeArticle
//
//  Created by Roselifeye on 15/6/5.
//  Copyright (c) 2015年 Roselifeye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

typedef NS_ENUM(NSInteger, CameraPositon) {
    CameraPositonFront,
    CameraPositonBack
};

@interface SPCameraView : UIView

@property (nonatomic, copy) SPBlockRequestEnd blockCameraEnd;

- (instancetype)initWithFrame:(CGRect)frame positionDevice:(CameraPositon)position andCameraButtonFrame:(CGRect)buttonFrame andImageName:(NSString *)imageName;

- (void)takePhoto;

- (BOOL)deleteWithContentPath:(NSString *)thePath;

@end
