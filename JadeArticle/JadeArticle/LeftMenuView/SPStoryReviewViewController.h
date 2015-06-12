//
//  SPStoryReviewViewController.h
//  
//
//  Created by Roselifeye on 2015-06-11.
//
//

#import "SPBaseViewController.h"

@interface SPStoryReviewViewController : SPBaseViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *reviewTable;

@end
