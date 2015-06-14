//
//  SPFoundChatViewController.m
//  
//
//  Created by Roselifeye on 2015-06-14.
//
//

#import "SPFoundChatViewController.h"
#import "SPMyStoryViewController.h"

@implementation SPFoundChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBeginView];
    
    [self setLabelBG:_testImage1];
    [self setLabelBG:_testImage2];
    [self setLabelBG:_testImage3];
    
    if (_iconNumber > 10) {
        _iconNumber  = 10;
    }
    [_testICON1 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"foundBIGICON%ld", (long)_iconNumber]] forState:UIControlStateNormal];
}

- (void)goBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)iconBtnClicked:(id)sender {
    SPMyStoryViewController *myStoryView = [self.storyboard instantiateViewControllerWithIdentifier:@"myStoryView"];
    [self.navigationController pushViewController:myStoryView animated:YES];
}

- (void)setLabelBG:(UIImageView *)labelBG {
    if (0 == labelBG.tag) {
        [labelBG setImage:[[UIImage imageNamed:@"charRightBG"]stretchableImageWithLeftCapWidth:20 topCapHeight:30]];
    } else
        [labelBG setImage:[[UIImage imageNamed:@"chatLeftBG"]stretchableImageWithLeftCapWidth:20 topCapHeight:30]];
}

@end
