//
//  SPAnywhereViewController.m
//  
//
//  Created by Roselifeye on 2015-06-12.
//
//

#import "SPAnywhereViewController.h"
#import "SPFoundChatViewController.h"

@implementation SPAnywhereViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBeginView];
}

- (void)goBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)iconBtnClicked:(UIButton *)sender {
    SPFoundChatViewController *chatView = [self.storyboard instantiateViewControllerWithIdentifier:@"chatView"];
    chatView.iconNumber = sender.tag;
    [self.navigationController pushViewController:chatView animated:YES];
}

@end
