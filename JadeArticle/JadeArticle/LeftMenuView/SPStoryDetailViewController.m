//
//  SPStoryDetailViewController.m
//  
//
//  Created by Roselifeye on 2015-06-11.
//
//

#import "SPStoryDetailViewController.h"
#import "SPShareView.h"

@interface SPStoryDetailViewController () {
    UILabel *titleLabel;
    UILabel *subTitleLabel;
    UILabel *tagLabel;
    UITextView *contentTextView;
}

@end

@implementation SPStoryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initBeginView];
    
    [self initTitle];
    [self initTagLabel];
    [self initTextView];
}


- (void)initBeginView {
    UIImage *bgImage = [UIImage imageNamed:@"MainMenuBG"];
    self.view.layer.contents = (id) bgImage.CGImage;
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)initTitle {
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame) - 30, 60)];
    [titleLabel setTextAlignment:NSTextAlignmentLeft];
    [titleLabel setTextColor:RGBA(0, 127, 85, 1)];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:25.f]];
    [titleLabel setNumberOfLines:2];
    [titleLabel setText:@"故事：我的翡翠缘，让我一生无憾"];
    [_contentScroll addSubview:titleLabel];
    
    subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 60 + 10, 150, 23)];
    [subTitleLabel setTextAlignment:NSTextAlignmentLeft];
    [subTitleLabel setTextColor:RGBA(0, 127, 85, 1)];
    [subTitleLabel setFont:[UIFont systemFontOfSize:13.f]];
    [subTitleLabel setText:@"作者 远方的远方"];
    [_contentScroll addSubview:subTitleLabel];
}

- (void)initTagLabel {
    tagLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, subTitleLabel.frame.origin.y + CGRectGetHeight(subTitleLabel.frame) + 20, 150, 23)];
    [tagLabel setTextAlignment:NSTextAlignmentLeft];
    [tagLabel setTextColor:RGBA(166, 59, 62, 1)];
    [tagLabel setFont:[UIFont systemFontOfSize:15.f]];
    [tagLabel setText:@"标签/每日一文"];
    [_contentScroll addSubview:tagLabel];
}

- (void)initTextView {
    NSString *contentStr = @"我与翡翠有缘份。从呱呱坠地那一天起，我就生活在翡翠的环境里。\n\n在我的家里，随处可以见到翡翠。地边墙角、厨房里、花园里、鱼池边、假山旁。书桌上有翡翠观音，茶几上有翡翠烟灰缸。我小时候用来砸松子吃的工具，也是改手镯剩下来的圆形玉块，我们称它为“玉心”。\n\n不仅是在我的家里，可以说在我的故乡的所有的家庭里，见到翡翠都是平常的事。我这样说一点也不夸张。我的故乡，云南省腾冲县，和缅甸山水相依。从腾冲步行半天即可进入缅境。有史以来，两国边民友好往来，互为通婚。缅甸是翡翠的王国。中缅边民的翡翠贸易往来已经有500多年的历史。腾冲成了重要的翡翠加工地和集散地。腾冲拥有数十家翡翠作坊和数千名工匠。从这里加工的翡翠成品源源不断地运往各省乃至海外。上个世纪五、六十年代，翡翠的经营是政府行为，自改革开放以来，翡翠业得到了空前的发展。现在的腾冲已经成为驰名全国的翡翠城了。\n\n腾冲人伴随着翡翠走来了几十代人的历程。在腾冲，无论大人小孩，都能讲述一些有关翡翠的优美的传说。翡翠让人发家致富，翡翠让人倾家荡产；有人一生做着翡翠梦，有人为翡翠骨散他乡。而更多的常人是在翡翠行业中赢赢输输，输输赢赢，过着忐忑不安的生活。在长期的战乱中，有的民众把翡翠掷入井内或埋入地下，有的民众把翡翠藏于隐蔽的建筑物内。天长日久，人散烟灭，沉眠于地下的翡翠也就音讯灭绝。像这样的例子很多。直至最近几年，腾冲城内无论哪里施工动土，或多或少的总能挖出一些翡翠的原料或碎片、成品或半成品。这说明曾经有过多少人的命运和翡翠息息相关。翡翠已经化为一种情缘流淌在腾冲人的血脉里了。\n\n每个家庭都是腾冲这座翡翠城的缩影。我考入中学那年，一天放学回家，母亲对我说：“去把楼梯脚那堆石头扔了，明天居委会要来检查卫生。”作为中学生，我知道爱国卫生运动是定期要搞的。我到房间的楼梯脚看，确实有一堆石头，已经放置多年了，上面积着一层厚厚的尘土。石头很重，每个大约有10多公斤。我每次用粪箕抬两三个，去把它扔在家后面的荒坡上。来回走了五六趟，才把这堆石头搬完。若干年后才知道，那些当做“垃圾”扔掉的石头，原来是来自缅甸雾露河旁优质的翡翠原料，因为未曾开过口，每个石头都包着皮，看上去和普通的石头一样。\n\n大跃进期间，我们的老家租给贸易公司开宾馆。一段时期，宾馆里住着来北京、上海、广州的三伙专门收购翡翠的人。宾馆管家觉察到翡翠能卖钱，就千方百计地打起我家老屋的主意来。终于在一个夜里，他把二门的石拱顶拆了，里面果然藏有翡翠原料，后来被他全部盗走。我父亲发觉后直问他，他说：“是些渣巴玉。”渣巴玉是指次等的玉石，次等的玉石为何值得藏起来？他的回答只是用来搪塞他丑陋的灵魂罢了。鉴于当时的历史背景，此事也就不了了之。\n\n父亲去世后，我的大哥和二哥在清扫父亲的卧室时，发现床底下有一个很大的未经开口的翡翠石料，重量在100多公斤。大哥和二哥都是上了年纪的文弱书生，他俩费了很大的劲，才把这个石头抬到楼下厨房里一根柱子旁放着，打算第二天请人来搬运(当时他俩的住处隔这里有三公里远)，可是第二天再来时，这个翡翠原石不翼而飞了。厨房和外面的铺子相通。铺子租给外省人开家具店。去问守铺子的小工，回答是不知道。没有任何交待，没有任何证据，去怪谁？父亲早年曾到缅甸做过建筑业，他怎知道自己的心血轻而易举的就付之东流了。\n\n在我家住的那条街上，每到集市之日，都会有几位从绮罗来的老妈妈卖玉。我见她们从提箩里拿出一二对高档的玻璃底艳绿手镯给顾客看。这成了我幼年时代难忘的一幕。有50多年我未见过这样的稀世珍品了。按当今的价格估计，每对手镯要在千万元以上。\n\n我是一个闲不住的老人。老来逢盛世，因为偏爱翡翠就做起小生意来。一个傍晚，我半掩的铺门被人推开，走进一位背着孩子的中年妇女，她从挎包里取出一对香炉，说是地下挖到的，娃娃生病急需用钱，求我替她买下。我看香炉上粘着泥巴，有几处露出的地方呈浅绿色，拿在手上掂了掂，很沉，断定是玉，就以300元买下。又有一次，我以3000元买下一对手镯，放了一久才发现，是上色的B货。我这两次买的香炉和手镯，都属于玉中之膺品，现在还放着。上个世纪八九十年代，一些膺品鱼目混珠上市，使不少人上当受骗。\n\n在过去若干年里，我虽然见过不少翡翠，但仅仅是停留在表面。接触多了，才知道奥妙无穷。在翡翠行业里，有人吃了亏不好意思说出来，怕丢面子，我则不然，交了学费嘛，写出来当个教训。任何行业在初步入的时候，都不会是一帆风顺的，都会遇到失败和挫折。翡翠行业有这么两句话：“玉不欺人，只是人哄人。”很多场合下，是智慧、胆识和眼力的较量。“三只金眼、三只银眼、三只捣瞎眼”是说百货中的百客。翡翠市场的价格瞬息万变，爱好者有苦衷也有乐趣。实践出真知，这句话在这里是完全体会出来了。\n\n去年一小伙来向我买一个玉佛，我对他说：“男戴观音女戴佛，你是男的，为何要戴佛？”他回答：“我的母亲信佛，我从小爱佛，人说男戴观音，我偏要戴佛。”我说：“祝你好运!”便以60元的价格卖给他一个佛。今年他又来跟我买佛，我问他去年买的那个呢，他说出去旅游时被同游的人买了。从他的表情上我知道他卖了很好的价钱。又有一次，我以3000元的价，卖给一位餐厅女老板一只手镯，来就餐的外商一口气出了30万元向她买，她不卖。我问她：“翻了上百倍，为何不卖？”她答：“我喜欢这种带红的，怕卖出去了，再也买不到。”3000元的手镯，出了30万元不卖，可见现在有些人是爱物不爱钱。“真是黄金有价玉无价”，愿打的愿挨的，两厢情愿。\n\n每每回忆起这些与翡翠有关的往事，就会觉得此生无憾了。";
    CGRect frame = CGRectMake(0, tagLabel.frame.origin.y + CGRectGetHeight(tagLabel.frame) + 15, CGRectGetWidth(titleLabel.frame), 10);
    contentTextView = [[UITextView alloc] initWithFrame:frame];
    [contentTextView setText:contentStr];
    [contentTextView setFont:[UIFont systemFontOfSize:17.f]];
    [contentTextView setTextColor:RGBA(102, 102, 102, 1)];
    [contentTextView setBackgroundColor:[UIColor clearColor]];
    
    CGSize textViewSize = [contentTextView sizeThatFits:CGSizeMake(CGRectGetWidth(contentTextView.frame), FLT_MAX)];
    frame.size = textViewSize;
    [contentTextView setFrame:frame];
    
    [_contentScroll addSubview:contentTextView];
    CGSize scrollContentSize = _contentScroll.contentSize;
    scrollContentSize.height += textViewSize.height + 150;
    _contentScroll.contentSize = scrollContentSize;
    
}

- (IBAction)backBtnClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)collectBtnClicked:(UIButton *)sender {
    sender.selected = !sender.selected;
}

- (IBAction)shareBtnClicked:(id)sender {
    SPShareView *shareView = [[SPShareView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:shareView];
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
