//
//  SPMileInsideViewController.m
//  
//
//  Created by Roselifeye on 2015-06-12.
//
//

#import "SPMileInsideViewController.h"
#import "SPFoundChatViewController.h"

@implementation SPMileInsideViewController

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
