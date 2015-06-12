//
//  UILabel+Additions.h
//  
//
//  Created by Roselifeye on 2015-06-12.
//
//

#import <UIKit/UIKit.h>
typedef enum{
    horizontal,
    vertical,
} LabelSizeOrientation;

@interface UILabel (Additions)

/**
 *  Automatically Caculate the Width or Height of the UILabel
 *
 *  @param content     content of UILabel
 *  @param orientation Select Horizontal or Vertical for caculating
 *
 *  @return the New Frame. In general, we only use the size.width or size.height.
 */
- (CGRect)caculateLabelSizeWithContent:(NSString *)content andOrientation:(LabelSizeOrientation)orientation;

@end
