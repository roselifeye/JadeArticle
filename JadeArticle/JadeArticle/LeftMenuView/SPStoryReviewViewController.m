//
//  SPStoryReviewViewController.m
//  
//
//  Created by Roselifeye on 2015-06-11.
//
//

#import "SPStoryReviewViewController.h"
#import "SPReviewTableViewCell.h"

@interface SPStoryReviewViewController () {
    NSMutableArray *reviewData;
}

@end

@implementation SPStoryReviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initBeginView];
    [self initReviewData];
}

- (void)initReviewData {
    reviewData = [[NSMutableArray alloc] init];
    
    NSDictionary *dic1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"reviewICON1", @"image", @"与心情沉没", @"author", @"很喜欢。", @"content", @"刚刚", @"time", nil];
    [reviewData addObject:dic1];
    NSDictionary *dic2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"reviewICON2", @"image", @"林新余", @"author", @"难道评论的都是被伤过的或留遗憾的", @"content", @"两小时前", @"time", nil];
    [reviewData addObject:dic2];
    NSDictionary *dic3 = [[NSDictionary alloc] initWithObjectsAndKeys:@"reviewICON3", @"image", @"饶不了你", @"author", @"故事只有这样才会一点一点流传下来", @"content", @"三小时前", @"time", nil];
    [reviewData addObject:dic3];
}

- (void)goBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SPReviewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSDictionary *dic = [reviewData objectAtIndex:indexPath.row];
    [cell.iconImage setImage:[UIImage imageNamed:[dic objectForKey:@"image"]]];
    [cell.authorLabel setText:[dic objectForKey:@"author"]];
    [cell.contentLabel setText:[dic objectForKey:@"content"]];
    
    NSString *timeStr = [dic objectForKey:@"time"];
    CGRect rect = [timeStr boundingRectWithSize:CGSizeMake(MAXFLOAT, 21)//限制最大的宽度和高度
                                       options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading  |NSStringDrawingUsesLineFragmentOrigin//采用换行模式
                                    attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.f]}//传人的字体字典
                                       context:nil];
    [cell.timeLabel setText:timeStr];
    cell.timeLabelWidth.constant = rect.size.width;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
