//
//  SPAnywhereViewController.m
//  
//
//  Created by Roselifeye on 2015-06-12.
//
//

#import "SPAnywhereViewController.h"

@implementation SPAnywhereViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBeginView];
}

- (void)goBack {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
