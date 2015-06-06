//
//  SPCameraView.m
//  JadeArticle
//
//  Created by Roselifeye on 15/6/5.
//  Copyright (c) 2015年 Roselifeye. All rights reserved.
//

#import "SPCameraView.h"

@interface SPCameraView () {
    UIButton *cameraButton;
}

/**
 *  Transfor Data From Camera to UIView
 */
@property (nonatomic, retain) AVCaptureSession *session;
/**
 *  Camera Input Data
 */
@property (nonatomic, retain) AVCaptureDeviceInput *input;
@property (nonatomic, retain) AVCaptureDevice *device;
/**
 *  Image Output
 */
@property (nonatomic, retain) AVCaptureStillImageOutput *imageOutput;
/**
 *  Preview Layer For Displaying the Photo
 */
@property (nonatomic, retain) AVCaptureVideoPreviewLayer *preview;

@end

@implementation SPCameraView

- (void)awakeFromNib {
    [self initCameraInPosition:CameraPositonBack];
}

- (instancetype)initWithFrame:(CGRect)frame positionDevice:(CameraPositon)position andCameraButtonFrame:(CGRect)buttonFrame andImageName:(NSString *)imageName {
    if (self = [super initWithFrame:frame]) {
        [self initCameraInPosition:position];
        [self initCameraButtonWithFrame:buttonFrame andImageName:imageName];
    }
    return self;
}

- (void)initCameraInPosition:(CameraPositon)position {

    self.session = [AVCaptureSession new];
    [self.session setSessionPreset:AVCaptureSessionPresetHigh];
    
    NSArray *devices = [NSArray new];
    devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for (AVCaptureDevice *device in devices) {
        if (position == CameraPositonBack) {
            if ([device position] == AVCaptureDevicePositionBack) {
                _device = device;
                break;
            }
        }else {
            if ([device position] == AVCaptureDevicePositionFront) {
                _device = device;
                break;
            }
        }
    }
    NSError *error;
    
    self.input = [[AVCaptureDeviceInput alloc] initWithDevice:self.device error:&error];
    if ([self.session canAddInput:self.input]) {
        [self.session addInput:self.input];
    }
    
    self.imageOutput = [AVCaptureStillImageOutput new];
    NSDictionary *outputSettings = @{AVVideoCodecKey:AVVideoCodecJPEG};
    [self.imageOutput setOutputSettings:outputSettings];
    [self.session addOutput:self.imageOutput];
    self.preview = [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.session];
    [self.preview setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [self.preview setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self.layer addSublayer:self.preview];
    [self.session startRunning];
}

- (void)initCameraButtonWithFrame:(CGRect)frame andImageName:(NSString *)imageName {
    cameraButton = [[UIButton alloc] initWithFrame:frame];
    [cameraButton setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [cameraButton addTarget:self action:@selector(takePhoto) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:cameraButton];
}

/**
 *  Take Photo
 */
- (void)takePhoto {
    AVCaptureConnection * videoConnection = [self.imageOutput connectionWithMediaType:AVMediaTypeVideo];
    if (!videoConnection) {
        NSLog(@"take photo failed!");
        if (_blockCameraEnd) {
            _blockCameraEnd(NO, nil, nil);
        }
        return;
    }
    
    [self.imageOutput captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
        if (imageDataSampleBuffer == NULL) {
            return;
        }
        NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
        UIImage *image = [UIImage imageWithData:imageData];
        NSLog(@"image size = %@",NSStringFromCGSize(image.size));
        UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
        NSString *pngName = [NSString stringWithFormat:@"Documents/%@.png", [NSDate date]];
        NSString *pngPath = [NSHomeDirectory() stringByAppendingPathComponent:pngName];
        [imageData writeToFile:pngPath atomically:YES];
        if (_blockCameraEnd) {
            _blockCameraEnd(YES, nil, pngName);
        }
    }];
}

- (BOOL)deleteWithContentPath:(NSString *)thePath {
    NSError *error=nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:thePath]) {
        [fileManager removeItemAtPath:thePath error:&error];
    }
    if (error) {
        NSLog(@"删除文件时出现问题:%@",[error localizedDescription]);
        return NO;
    }
    return YES;
}

@end
