//
//  SPReviewTableViewCell.h
//  
//
//  Created by Roselifeye on 2015-06-12.
//
//

#import <UIKit/UIKit.h>

@interface SPReviewTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *iconImage;
@property (nonatomic, weak) IBOutlet UILabel *authorLabel;
@property (nonatomic, weak) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *timeLabelWidth;

@end
