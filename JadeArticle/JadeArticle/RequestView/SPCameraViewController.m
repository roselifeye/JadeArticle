//
//  SPCameraViewController.m
//  JadeArticle
//
//  Created by Roselifeye on 15/6/5.
//  Copyright (c) 2015年 Roselifeye. All rights reserved.
//

#import "SPCameraViewController.h"
#import "SPCameraView.h"

@interface SPCameraViewController () {
    SPCameraView *cameraView;
    IBOutlet UIImageView *displayImageView;
    NSString *thePngPath;
}

@end

@implementation SPCameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    cameraView = [[SPCameraView alloc] initWithFrame:self.view.frame positionDevice:CameraPositonBack andCameraButtonFrame:self.view.frame andImageName:@"cameraButton"];
    [self.view addSubview:cameraView];
    
    
    
    __weak UIImageView *weakImage = displayImageView;
    __weak SPCameraView *weakCamera = cameraView;
    
    cameraView.blockCameraEnd = ^(BOOL result, NSString *resultMessage, id object){
        if (result) {
            NSString *pngPath = [NSHomeDirectory() stringByAppendingPathComponent:object];
            thePngPath = pngPath;
            [weakImage setImage:[UIImage imageWithContentsOfFile:pngPath]];
            [weakCamera removeFromSuperview];
        }
    };
}

- (IBAction)publishPhoto:(UIButton *)sender {
    switch (sender.tag) {
        case 0:
            [cameraView deleteWithContentPath:thePngPath];
            [self.navigationController popViewControllerAnimated:YES];
            break;
        case 1:
            
            break;
        default:
            break;
    }
}

@end
