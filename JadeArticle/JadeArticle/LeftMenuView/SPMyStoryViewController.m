//
//  SPMyStoryViewController.m
//  JadeArticle
//
//  Created by Roselifeye on 15/6/6.
//  Copyright (c) 2015年 Roselifeye. All rights reserved.
//

#import "SPMyStoryViewController.h"
#import <RESideMenu.h>
#import "SPStoryDetailViewController.h"
#import "SPStoryReviewViewController.h"

#import "SPShareView.h"

@interface SPMyStoryViewController ()<UIScrollViewDelegate> {
    NSMutableArray *testData;
    
    UIView *headerView;
    UIView *footerView;
    
    UIScrollView *myStoryScrollView;
    
    UILabel *badgeNumberLabel;
}
//@property (weak, nonatomic) IBOutlet UIScrollView *myStoryScrollView;

@end

@implementation SPMyStoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBeginView];
    
    if (nil == _defaultFootStr) {
        _defaultFootStr = @"不同的故事，从下拉开始";
    }
    [self initTestData];
    [self initScrollView];
    [self initHeaderView];
    [self initFooterView];
    [self initStoryViewWithText:@"你妹" andTitle:@"HHHH" andAuthor:@"zzzz" andTime:@"2015" andTag:@"njshdkj"];
    [self initStoryViewWithText:@"你妹" andTitle:@"HHHH" andAuthor:@"zzzz" andTime:@"2015" andTag:@"njshdkj"];
    [self initStoryViewWithText:@"你妹" andTitle:@"HHHH" andAuthor:@"zzzz" andTime:@"2015" andTag:@"njshdkj"];
    
    [myStoryScrollView setContentOffset:CGPointMake(0, myStoryScrollView.contentSize.height-myStoryScrollView.frame.size.height)];
}

- (IBAction)leftMenu:(id)sender {
    [self.sideMenuViewController presentLeftMenuViewController];
}

- (void)initBeginView {
    UIImage *bgImage = [UIImage imageNamed:@"MainMenuBG"];
    self.view.layer.contents = (id) bgImage.CGImage;
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)addBorderToView:(UIView *)view {
    [view.layer setBorderColor:RGBA(0, 127, 85, 1).CGColor];
    [view.layer setBorderWidth:2.0f];
}

- (void)initTestData {
    testData = [[NSMutableArray alloc] init];
    NSDictionary *dic1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"我奋力追\n追到没法追\n追到没法分清我是谁\n不止我一人感到疲累\n始终带不到墨尔本的翡翠", @"article", @"无所得：关于墨尔本的翡翠故事", @"title", @"远方的远方", @"author", @"心灵热度", @"tag", @"卖力地为你唱只迷人情歌\n慢慢地步入你的星座\n故事情节总会坎坷\n惟独有你靠在我身旁\n尽力地为你抹去眼角泪光\n尽力地避及猛风海浪\n烦俗世间太彷徨\n无奈青春不够耐看\n我深怕我会连累你\n让你翻山倒海般痛悲\n自问已经筋竭力疲\n没有力气竭斯底里\n我奋力追\n追到没法追\n追到没法分清我是谁\n不止我一人感到疲累\n翻天的雨水能令你我都粉碎\n我继续追\n伤痛亦要追\n跟接下去想不想都退\n不管你的人被谁占据\n都请你原谅我\n始终带不到墨尔本的翡翠\n\n尽力地为你抹去眼角泪光\n尽力地避及猛风海浪\n烦俗世间太彷徨\n惟独青春不够耐看\n我深怕我会连累你\n让你翻山倒海般痛悲\n自问已经筋竭力疲\n没有力气竭斯底里\n我奋力追\n追到没法追\n追到没法分清我是谁\n不止我一人感到疲累\n翻天的雨水能令你我都粉碎\n我继续追\n伤痛亦要追\n跟接下去想不想都退\n不管你的人被谁占据\n始终爱不起，雾与火的差距\n我继续追\n伤痛亦要追\n跟接下去想不想都退\n不管你的人被谁占据\n都请你原谅我\n始终带不到墨尔本的翡翠", @"content", nil];
    
    NSDictionary *dic2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"翡翠之美\n包含着鲜血与汗水\n包含着别恨和悲", @"article", @"美：人虽能做己想做，却无法要己所要", @"title", @"远方的远方", @"author", @"每日一言", @"tag", @"古代的帝王和贵族把拥有玉当作权力和财富的象征。慈禧墓中出土的若干玉雕价值连城。中国人爱玉、玩玉、赏玉、藏玉、更为怀玉。人们认为，玉是吉祥物，玉是定情物。玉能祛病避邪、延年益寿。赏玉可以缓解人烦躁的情绪，改善视力。人养玉，玉养人。许多古诗中都有“玉”字出现，如：“书中自有颜如玉”、“大珠小珠落玉盘”、“一片冰心在玉壶”等，不胜枚举。玉文化是中华文化的组成部分。“乱世购黄金，盛世购翠玉”，在今天稳定繁荣的社会里，已经有越来越多的翠玉进入了百姓家庭。\n\n一位来自缅甸翡翠矿厂的侨商对我说，翡翠产地多在莽野荒凉之处。玉矿十分坚硬，深埋于地表数十米之下，打洞下去，艰难而缓慢。夏季洞内被水淹没，待冬季将水抽干，方能作业。猛兽和蟒蛇伤人的事件时有发生。工人还会死于塌方、疾病和瘴疠。其悲惨状况，和国内的小煤窑不相上下。他的一席话使我原本对翡翠的钟爱蒙上一层阴影。我仿佛看到了荒凉的矿区隐现出的无数幽灵，老的，少的，笑的，哭的，流泪的，他们在高呼，在呐喊，诉说着各自不同的身世。\n\n翡翠之美，包含着鲜血和汗水；翡翠之美，包含着别恨和悲伤；翡翠之美，使我想起历代富豪们的盛衰常态。一位哲人的话注入我的心底：“人虽然能够做他想要做的，但不能要他所想要的”。", @"content", nil];
    
    NSDictionary *dic3 = [[NSDictionary alloc] initWithObjectsAndKeys:@"很多次\n我跟不同的人重复我的故事\n直到有一天我从新来过\n看到不同的人都聚在一起\n重复着我重复的故事以及我", @"article", @"故事：我的翡翠缘，让我一生无憾", @"title", @"远方的远方", @"author", @"标签/每日一文", @"tag", @"我与翡翠有缘份。从呱呱坠地那一天起，我就生活在翡翠的环境里。\n\n在我的家里，随处可以见到翡翠。地边墙角、厨房里、花园里、鱼池边、假山旁。书桌上有翡翠观音，茶几上有翡翠烟灰缸。我小时候用来砸松子吃的工具，也是改手镯剩下来的圆形玉块，我们称它为“玉心”。\n\n不仅是在我的家里，可以说在我的故乡的所有的家庭里，见到翡翠都是平常的事。我这样说一点也不夸张。我的故乡，云南省腾冲县，和缅甸山水相依。从腾冲步行半天即可进入缅境。有史以来，两国边民友好往来，互为通婚。缅甸是翡翠的王国。中缅边民的翡翠贸易往来已经有500多年的历史。腾冲成了重要的翡翠加工地和集散地。腾冲拥有数十家翡翠作坊和数千名工匠。从这里加工的翡翠成品源源不断地运往各省乃至海外。上个世纪五、六十年代，翡翠的经营是政府行为，自改革开放以来，翡翠业得到了空前的发展。现在的腾冲已经成为驰名全国的翡翠城了。\n\n腾冲人伴随着翡翠走来了几十代人的历程。在腾冲，无论大人小孩，都能讲述一些有关翡翠的优美的传说。翡翠让人发家致富，翡翠让人倾家荡产；有人一生做着翡翠梦，有人为翡翠骨散他乡。而更多的常人是在翡翠行业中赢赢输输，输输赢赢，过着忐忑不安的生活。在长期的战乱中，有的民众把翡翠掷入井内或埋入地下，有的民众把翡翠藏于隐蔽的建筑物内。天长日久，人散烟灭，沉眠于地下的翡翠也就音讯灭绝。像这样的例子很多。直至最近几年，腾冲城内无论哪里施工动土，或多或少的总能挖出一些翡翠的原料或碎片、成品或半成品。这说明曾经有过多少人的命运和翡翠息息相关。翡翠已经化为一种情缘流淌在腾冲人的血脉里了。\n\n每个家庭都是腾冲这座翡翠城的缩影。我考入中学那年，一天放学回家，母亲对我说：“去把楼梯脚那堆石头扔了，明天居委会要来检查卫生。”作为中学生，我知道爱国卫生运动是定期要搞的。我到房间的楼梯脚看，确实有一堆石头，已经放置多年了，上面积着一层厚厚的尘土。石头很重，每个大约有10多公斤。我每次用粪箕抬两三个，去把它扔在家后面的荒坡上。来回走了五六趟，才把这堆石头搬完。若干年后才知道，那些当做“垃圾”扔掉的石头，原来是来自缅甸雾露河旁优质的翡翠原料，因为未曾开过口，每个石头都包着皮，看上去和普通的石头一样。\n\n大跃进期间，我们的老家租给贸易公司开宾馆。一段时期，宾馆里住着来北京、上海、广州的三伙专门收购翡翠的人。宾馆管家觉察到翡翠能卖钱，就千方百计地打起我家老屋的主意来。终于在一个夜里，他把二门的石拱顶拆了，里面果然藏有翡翠原料，后来被他全部盗走。我父亲发觉后直问他，他说：“是些渣巴玉。”渣巴玉是指次等的玉石，次等的玉石为何值得藏起来？他的回答只是用来搪塞他丑陋的灵魂罢了。鉴于当时的历史背景，此事也就不了了之。\n\n父亲去世后，我的大哥和二哥在清扫父亲的卧室时，发现床底下有一个很大的未经开口的翡翠石料，重量在100多公斤。大哥和二哥都是上了年纪的文弱书生，他俩费了很大的劲，才把这个石头抬到楼下厨房里一根柱子旁放着，打算第二天请人来搬运(当时他俩的住处隔这里有三公里远)，可是第二天再来时，这个翡翠原石不翼而飞了。厨房和外面的铺子相通。铺子租给外省人开家具店。去问守铺子的小工，回答是不知道。没有任何交待，没有任何证据，去怪谁？父亲早年曾到缅甸做过建筑业，他怎知道自己的心血轻而易举的就付之东流了。\n\n在我家住的那条街上，每到集市之日，都会有几位从绮罗来的老妈妈卖玉。我见她们从提箩里拿出一二对高档的玻璃底艳绿手镯给顾客看。这成了我幼年时代难忘的一幕。有50多年我未见过这样的稀世珍品了。按当今的价格估计，每对手镯要在千万元以上。\n\n我是一个闲不住的老人。老来逢盛世，因为偏爱翡翠就做起小生意来。一个傍晚，我半掩的铺门被人推开，走进一位背着孩子的中年妇女，她从挎包里取出一对香炉，说是地下挖到的，娃娃生病急需用钱，求我替她买下。我看香炉上粘着泥巴，有几处露出的地方呈浅绿色，拿在手上掂了掂，很沉，断定是玉，就以300元买下。又有一次，我以3000元买下一对手镯，放了一久才发现，是上色的B货。我这两次买的香炉和手镯，都属于玉中之膺品，现在还放着。上个世纪八九十年代，一些膺品鱼目混珠上市，使不少人上当受骗。\n\n在过去若干年里，我虽然见过不少翡翠，但仅仅是停留在表面。接触多了，才知道奥妙无穷。在翡翠行业里，有人吃了亏不好意思说出来，怕丢面子，我则不然，交了学费嘛，写出来当个教训。任何行业在初步入的时候，都不会是一帆风顺的，都会遇到失败和挫折。翡翠行业有这么两句话：“玉不欺人，只是人哄人。”很多场合下，是智慧、胆识和眼力的较量。“三只金眼、三只银眼、三只捣瞎眼”是说百货中的百客。翡翠市场的价格瞬息万变，爱好者有苦衷也有乐趣。实践出真知，这句话在这里是完全体会出来了。\n\n去年一小伙来向我买一个玉佛，我对他说：“男戴观音女戴佛，你是男的，为何要戴佛？”他回答：“我的母亲信佛，我从小爱佛，人说男戴观音，我偏要戴佛。”我说：“祝你好运!”便以60元的价格卖给他一个佛。今年他又来跟我买佛，我问他去年买的那个呢，他说出去旅游时被同游的人买了。从他的表情上我知道他卖了很好的价钱。又有一次，我以3000元的价，卖给一位餐厅女老板一只手镯，来就餐的外商一口气出了30万元向她买，她不卖。我问她：“翻了上百倍，为何不卖？”她答：“我喜欢这种带红的，怕卖出去了，再也买不到。”3000元的手镯，出了30万元不卖，可见现在有些人是爱物不爱钱。“真是黄金有价玉无价”，愿打的愿挨的，两厢情愿。\n\n每每回忆起这些与翡翠有关的往事，就会觉得此生无憾了。", @"content", nil];
    
    [testData addObject:dic1];
    [testData addObject:dic2];
    [testData addObject:dic3];
}

- (void)initScrollView {
    myStoryScrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    [myStoryScrollView setBackgroundColor:[UIColor clearColor]];
    [myStoryScrollView setPagingEnabled:YES];
    [myStoryScrollView setBounces:NO];
    [myStoryScrollView setShowsVerticalScrollIndicator:NO];
    [myStoryScrollView setDelegate:self];
    [self.view addSubview:myStoryScrollView];
}

- (void)initHeaderView {
    NSLog(@"kuan%f", self.view.frame.size.width);
    headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 80)];
    [headerView setBackgroundColor:RGBA(0, 127, 85, 1)];
    
    UILabel *headerNoticeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, CGRectGetWidth(headerView.frame), 30)];
    [headerNoticeLabel setTextAlignment:NSTextAlignmentCenter];
    [headerNoticeLabel setTextColor:[UIColor whiteColor]];
    [headerNoticeLabel setFont:[UIFont systemFontOfSize:20.f]];
    [headerNoticeLabel setText:@"已经没有更多"];
    [headerView addSubview:headerNoticeLabel];
    
    UIImageView *noMoreImageView = [[UIImageView alloc] initWithFrame:CGRectMake((CGRectGetWidth(headerView.frame) - 40)/2, 10, 40, 40)];
    [noMoreImageView setImage:[UIImage imageNamed:@"okBtn"]];
    [headerView addSubview:noMoreImageView];
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 20, 45, 45)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"backBtn"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:backBtn];
    
    [myStoryScrollView addSubview:headerView];
}

- (void)goBack {
    NSArray *viewArray = self.navigationController.viewControllers;
    if (viewArray.count > 1) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self.sideMenuViewController presentLeftMenuViewController];
    }
}

- (void)initFooterView {
    footerView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame) - 80, CGRectGetWidth(self.view.frame), 80)];
    [footerView setBackgroundColor:[UIColor blackColor]];
    [footerView setAlpha:0.8f];
    
    UILabel *headerNoticeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, CGRectGetWidth(footerView.frame), 30)];
    [headerNoticeLabel setTextAlignment:NSTextAlignmentCenter];
    [headerNoticeLabel setTextColor:[UIColor whiteColor]];
    [headerNoticeLabel setFont:[UIFont systemFontOfSize:20.f]];
    [headerNoticeLabel setText:_defaultFootStr];
    CGRect rect = [headerNoticeLabel caculateLabelSizeWithContent:_defaultFootStr andOrientation:horizontal];
    CGRect labelFrame = headerNoticeLabel.frame;
    labelFrame.size.width = rect.size.width;
    labelFrame.origin.x = (CGRectGetWidth(footerView.frame) - labelFrame.size.width) / 2.f;
    headerNoticeLabel.frame = labelFrame;
    [footerView addSubview:headerNoticeLabel];
    
    UIImageView *arrowImage = [[UIImageView alloc] initWithFrame:CGRectMake(labelFrame.origin.x + CGRectGetWidth(labelFrame) + 10, 28, 18, 20)];
    [arrowImage setImage:[UIImage imageNamed:@"arrowDown"]];
    [footerView addSubview:arrowImage];
    
    [self.view addSubview:footerView];
}

- (void)initStoryViewWithText:(NSString *)text andTitle:(NSString *)title andAuthor:(NSString *)author andTime:(NSString *)time andTag:(NSString *)tag {
    int offset = myStoryScrollView.contentSize.height/self.view.frame.size.height;
    CGRect frame = CGRectMake(10, 20 + CGRectGetHeight(self.view.frame)*offset, CGRectGetWidth(self.view.frame) - 20, (CGRectGetHeight(self.view.frame) - 80 - 60 - 20));
    if (0 == offset) {
        frame.origin.y += 80;
    }
    UIView *storyView = [[UIView alloc] initWithFrame:frame];
    [storyView setBackgroundColor:[UIColor clearColor]];
    //[self addBorderToView:storyView];
    [myStoryScrollView addSubview:storyView];
    
    [self addGestureToView:storyView];
    
    frame = CGRectMake(0, storyView.frame.origin.y + CGRectGetHeight(storyView.frame), CGRectGetWidth(self.view.frame), 60);
    [self initAdditionViewWithFrame:frame];
    
    myStoryScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)*(offset+1));
    
    UIImageView *wordImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 355, 472)];
    [wordImage setImage:[UIImage imageNamed:@"storyWord"]];
    [storyView addSubview:wordImage];
    /*
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake((CGRectGetWidth(storyView.frame) - 23)/2.f, 10, 23, 60)];
    //    [titleLabel setText:@"故事"];
    NSDictionary *attrDict1 = @{ NSVerticalGlyphFormAttributeName: @"0" };
    [titleLabel setAttributedText:[[NSAttributedString alloc] initWithString:@"故事" attributes: attrDict1]];
    [storyView addSubview:titleLabel];
     */
}

- (void)addGestureToView:(UIView *)view {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(popToDetailView:)];
    [view addGestureRecognizer:tapGesture];
}

- (void)popToDetailView:(id)sender {
    CGFloat pageWidth = myStoryScrollView.frame.size.height;
    int currentPage = floor((myStoryScrollView.contentOffset.y - pageWidth / 2) / pageWidth) + 1;
    NSLog(@"NIMEI %d", currentPage);
    
    SPStoryDetailViewController *detailView = [self.storyboard instantiateViewControllerWithIdentifier:@"storyDetailView"];
    detailView.contentDic = [testData objectAtIndex:currentPage];
    [self.navigationController presentViewController:detailView animated:YES completion:nil];
}

- (void)initAdditionViewWithFrame:(CGRect)frame {
    UIView *additionView = [[UIView alloc] initWithFrame:frame];
    [additionView setBackgroundColor:[UIColor clearColor]];
    [myStoryScrollView addSubview:additionView];
    
    UIButton *shareBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, (CGRectGetHeight(additionView.frame) - 35)/2.f, 35, 35)];
    [shareBtn setImage:[UIImage imageNamed:@"shareBtn"] forState:UIControlStateNormal];
    [shareBtn addTarget:self action:@selector(shareBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [additionView addSubview:shareBtn];
    
    UIButton *collectBtn = [[UIButton alloc] initWithFrame:CGRectMake(shareBtn.frame.origin.x + CGRectGetWidth(shareBtn.frame) + 10, (CGRectGetHeight(additionView.frame) - 35)/2.f, 35, 35)];
    [collectBtn setImage:[UIImage imageNamed:@"collectionBtn"] forState:UIControlStateNormal];
    [collectBtn setImage:[UIImage imageNamed:@"collectionBtn_highlighted"] forState:UIControlStateSelected];
    [collectBtn addTarget:self action:@selector(collectBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [additionView addSubview:collectBtn];
    
    UIButton *reviewBtn = [[UIButton alloc] initWithFrame:CGRectMake(collectBtn.frame.origin.x + CGRectGetWidth(collectBtn.frame) + 10, (CGRectGetHeight(additionView.frame) - 35)/2.f, 35, 35)];
    [reviewBtn setImage:[UIImage imageNamed:@"reviewBtn"] forState:UIControlStateNormal];
    [reviewBtn addTarget:self action:@selector(reviewBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [additionView addSubview:reviewBtn];
    [self addBudgeNumberToReviewBtn:reviewBtn];
}

- (void)addBudgeNumberToReviewBtn:(UIButton *)button {
    badgeNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(button.frame)-20,  3, 24, 13)];
    [badgeNumberLabel setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"badgeNumberBG"]]];
    [badgeNumberLabel setTextAlignment:NSTextAlignmentCenter];
    [badgeNumberLabel setTextColor:[UIColor whiteColor]];
    [badgeNumberLabel setText:@"3"];
    [button addSubview:badgeNumberLabel];
}

- (void)shareBtnClicked:(UIButton *)sender {
    SPShareView *shareView = [[SPShareView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:shareView];
}

- (void)collectBtnClicked:(UIButton *)sender {
    sender.selected = !sender.selected;
}

- (void)reviewBtnClicked:(UIButton *)sender {
    SPStoryReviewViewController *reviewView = [self.storyboard instantiateViewControllerWithIdentifier:@"storyReviewView"];
    [self.navigationController presentViewController:reviewView animated:YES completion:nil];
}

#pragma mark -
#pragma mark - UIScrollView Delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = myStoryScrollView.frame.size.height;
    int currentPage = floor((myStoryScrollView.contentOffset.y - pageWidth / 2) / pageWidth) + 1;
    NSLog(@"END SCROLL AND PAGE:%d", currentPage);
    if (0 == currentPage) {
        footerView.makeOrigin(0, CGRectGetHeight(self.view.frame)).animate(0.2f);
    } else {
        footerView.makeOrigin(0, CGRectGetHeight(self.view.frame)-80).animate(0.2f);
    }
}

@end
