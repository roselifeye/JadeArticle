//
//  UILabel+Additions.m
//  
//
//  Created by Roselifeye on 2015-06-12.
//
//

#import "UILabel+Additions.h"

@implementation UILabel (Additions)

- (CGRect)caculateLabelSizeWithContent:(NSString *)content andOrientation:(LabelSizeOrientation)orientation {
    CGRect rect;
    if (horizontal == orientation) {
        rect = [content boundingRectWithSize:CGSizeMake(MAXFLOAT, self.frame.size.height)
                                            options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin//采用换行模式
                                         attributes:@{NSFontAttributeName:self.font}
                                            context:nil];
    } else {
        rect = [content boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT)
                                            options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin//采用换行模式
                                         attributes:@{NSFontAttributeName:self.font}
                                            context:nil];
    }
    return rect;
}

@end
