//
//  SPShareView.m
//  
//
//  Created by Roselifeye on 2015-06-11.
//
//

#import "SPShareView.h"

@implementation SPShareView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        UIButton *coverBtn = [[UIButton alloc] initWithFrame:frame];
        [coverBtn setAlpha:0.8f];
        [coverBtn setBackgroundColor:[UIColor grayColor]];
        [coverBtn addTarget:self action:@selector(coverBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:coverBtn];
        
        [self initShareBtns];
    }
    return self;
}

- (void)initShareBtns {
    CGRect frame = CGRectMake((CGRectGetWidth(self.frame) - 72)/2.f, CGRectGetHeight(self.frame), 72, 72);
    
    UIButton *groupBtn = [[UIButton alloc] initWithFrame:frame];
    [groupBtn setImage:[UIImage imageNamed:@"shareGroupBtn"] forState:UIControlStateNormal];
    [self addSubview:groupBtn];
    
    UIButton *weChatBtn = [[UIButton alloc] initWithFrame:frame];
    [weChatBtn setImage:[UIImage imageNamed:@"shareWeChatBtn"] forState:UIControlStateNormal];
    [self addSubview:weChatBtn];
    
    UIButton *qqBtn = [[UIButton alloc] initWithFrame:frame];
    [qqBtn setImage:[UIImage imageNamed:@"shareQQBtn"] forState:UIControlStateNormal];
    [self addSubview:qqBtn];
    
    UIButton *sinaBtn = [[UIButton alloc] initWithFrame:frame];
    [sinaBtn setImage:[UIImage imageNamed:@"shareSinaBtn"] forState:UIControlStateNormal];
    [self addSubview:sinaBtn];
    
    frame.origin.y = CGRectGetHeight(self.frame) - (CGRectGetHeight(self.frame) - 72*4 - 25*3)/2 -72;
    [self moveButton:sinaBtn ToDestination:frame];
    
    frame.origin.y -= (72 + 25);
    [self moveButton:qqBtn ToDestination:frame];
    
    frame.origin.y -= (72 + 25);
    [self moveButton:weChatBtn ToDestination:frame];
    
    frame.origin.y -= (72 + 25);
    [self moveButton:groupBtn ToDestination:frame];
}

- (void)moveButton:(UIButton *)button ToDestination:(CGRect)frame {
    button.makeFrame(frame).animate(0.3f);
}

- (void)coverBtnClicked:(UIButton *)sender {
    [self removeFromSuperview];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
