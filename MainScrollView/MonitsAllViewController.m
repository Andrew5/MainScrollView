//
//  MonitsAllViewController.m
//  Test
//
//  Created by Rillakkuma on 2016/12/14.
//  Copyright © 2016年 Rillakkuma. All rights reserved.
//

#import "MonitsAllViewController.h"
#define kWidthOfScreen [[UIScreen mainScreen] bounds].size.width
 #define kHeightOfScreen [[UIScreen mainScreen] bounds].size.height
#define kImageViewCount 5
@interface MonitsAllViewController ()
/**
 *  加载图片数据
 */
- (void)loadImageData;

/**
 *  添加滚动视图
 */
- (void)addScrollView;

/**
 *  添加三个图片视图到滚动视图内
 */
- (void)addImageViewsToScrollView;

/**
 *  添加分页控件
 */
- (void)addPageControl;

/**
 *  添加标签；用于图片描述
 */
- (void)addLabel;

/**
 *  根据当前图片索引设置信息
 *
 *  @param currentImageIndex 当前图片索引；即中间
 */
- (void)setInfoByCurrentImageIndex:(NSUInteger)currentImageIndex;

/**
 *  设置默认信息
 */
- (void)setDefaultInfo;

/**
 *  重新加载图片
 */
- (void)reloadImage;

- (void)layoutUI;
@end

@implementation MonitsAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:@"1", @"2", @"3", nil];
	array = (NSMutableArray *)[[array reverseObjectEnumerator] allObjects];
	NSLog(@"array %@",array);
	self.view.backgroundColor = [UIColor whiteColor];
	if (_tagString == 0) {
		[self setTableViewUI];
	}
	if (_tagString == 1) {
		[self setCollectionViewUI];
	}
	if (_tagString == 2) {
		[self setScrollViewUI];
		 [self layoutUI];
	}
	if (_tagString == 3) {
				self.view.backgroundColor = [UIColor purpleColor];
	}
	if (_tagString == 4) {
				self.view.backgroundColor = [UIColor yellowColor];
	}
}

- (void)setTableViewUI{
	table = [[UITableView alloc] init];
	table.frame = CGRectMake(0, 40, kWidthOfScreen, kHeightOfScreen - 40);
	table.delegate = self;
	table.dataSource = self;
	//不允许滚动
	table.scrollEnabled = NO;
	table.tableFooterView = [UIView new];
	[self.view addSubview:table];

}
- (void)setCollectionViewUI{
	//创建一个layout布局类
	UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
	//设置布局方向为垂直流布局
	[flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
	//设置每个item的大小为100*100
	flowLayout.itemSize = CGSizeMake(100, 100);
	//创建collectionView 通过一个布局策略layout来创建
	collectionview=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 44, kWidthOfScreen, kHeightOfScreen - 44) collectionViewLayout:flowLayout];
	//不允许滚动
	collectionview.scrollEnabled = NO;
	//代理设置
	collectionview.dataSource=self;
	collectionview.delegate=self;
	//设置背景颜色
	[collectionview setBackgroundColor:[UIColor whiteColor]];
	
	//注册Cell，必须要有
	//		[collectionview registerNib:[UINib nibWithNibName:@"UserViewCL3CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"UserViewCL3CollectionViewCell"];
	//注册item类型 这里使用系统的类型
	[collectionview registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
	[self.view addSubview:collectionview];
}
- (void)setScrollViewUI{
	
}
#pragma mark -- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *ID =@"UITableViewCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID];
	}
	cell.textLabel.text = [NSString stringWithFormat:@"这是第%ld行",indexPath.row];
	return cell;
	
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 40;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UICollectionViewDataSource

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	return 10;
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
	return 1;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
	
	UICollectionViewCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
	cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
	return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout

////定义每个Item 的大小
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//	return CGSizeMake(DeviceWidth/4-10, DeviceWidth/4-10);
//}
//
////定义每个UICollectionView 的 margin
//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//	return UIEdgeInsetsMake(0, 5, 5, 5);
//}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
	return YES;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
	
}
#pragma mark - UIScrollViewDelegate
/*
 // 返回一个放大或者缩小的视图
 - (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
 {
 
 }
 // 开始放大或者缩小
 - (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:
 (UIView *)view
 {
 
 }
 
 // 缩放结束时
 - (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale
 {
 
 }
 
 // 视图已经放大或缩小
 - (void)scrollViewDidZoom:(UIScrollView *)scrollView
 {
 NSLog(@"scrollViewDidScrollToTop");
 }
 */

// 是否支持滑动至顶部
- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
	return YES;
}

// 滑动到顶部时调用该方法
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
	NSLog(@"scrollViewDidScrollToTop");
}

// scrollView 已经滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	NSLog(@"scrollViewDidScroll");
}

// scrollView 开始拖动
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
	NSLog(@"scrollViewWillBeginDragging");
}

// scrollView 结束拖动
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
	NSLog(@"scrollViewDidEndDragging");
}

// scrollView 开始减速（以下两个方法注意与以上两个方法加以区别）
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
	NSLog(@"scrollViewWillBeginDecelerating");
}




- (void)loadImageData {
	NSString *path = [[NSBundle mainBundle] pathForResource:@"ImageInfo" ofType:@"plist"];
	mDicImageData = [NSMutableDictionary dictionaryWithContentsOfFile:path];
	imageCount = mDicImageData.count;
}

- (void)addScrollView {
	_scrollView = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	_scrollView.contentSize = CGSizeMake(kWidthOfScreen * kImageViewCount, kHeightOfScreen);
	_scrollView.contentOffset = CGPointMake(kWidthOfScreen, 0.0);
	_scrollView.pagingEnabled = YES;
	_scrollView.showsHorizontalScrollIndicator = NO;
	_scrollView.delegate = self;
	[self.view addSubview:_scrollView];
}

- (void)addImageViewsToScrollView {
	//图片视图；左边
	imgVLeft = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, kWidthOfScreen, kHeightOfScreen)];
	imgVLeft.contentMode = UIViewContentModeScaleAspectFit;
	[_scrollView addSubview:imgVLeft];
	
	//图片视图；中间
	imgVCenter = [[UIImageView alloc] initWithFrame:CGRectMake(kWidthOfScreen, 0.0, kWidthOfScreen, kHeightOfScreen)];
	imgVCenter.contentMode = UIViewContentModeScaleAspectFit;
	[_scrollView addSubview:imgVCenter];
	
	//图片视图；右边
	imgVRight = [[UIImageView alloc] initWithFrame:CGRectMake(kWidthOfScreen * 2.0, 0.0, kWidthOfScreen, kHeightOfScreen)];
	imgVRight.contentMode = UIViewContentModeScaleAspectFit;
	[_scrollView addSubview:imgVRight];
}

- (void)addPageControl {
	pageC = [UIPageControl new];
	CGSize size= [pageC sizeForNumberOfPages:imageCount]; //根据页数返回 UIPageControl 合适的大小
	pageC.bounds = CGRectMake(0.0, 0.0, size.width, size.height);
	pageC.center = CGPointMake(kWidthOfScreen / 2.0, kHeightOfScreen - 80.0);
	pageC.numberOfPages = imageCount;
	pageC.pageIndicatorTintColor = [UIColor whiteColor];
	pageC.currentPageIndicatorTintColor = [UIColor brownColor];
	pageC.userInteractionEnabled = NO; //设置是否允许用户交互；默认值为 YES，当为 YES 时，针对点击控件区域左（当前页索引减一，最小为0）右（当前页索引加一，最大为总数减一），可以编写 UIControlEventValueChanged 的事件处理方法
	[self.view addSubview:pageC];
}

- (void)addLabel {
	lblImageDesc = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 44.0, kWidthOfScreen, 40.0)];
	lblImageDesc.textAlignment = NSTextAlignmentCenter;
	lblImageDesc.textColor = [UIColor whiteColor];
	lblImageDesc.font = [UIFont boldSystemFontOfSize:[UIFont labelFontSize]];
	lblImageDesc.text = @"Fucking now.";
	[self.view addSubview:lblImageDesc];
}

- (void)setInfoByCurrentImageIndex:(NSUInteger)currentImageIndex {
	NSString *currentImageNamed = [NSString stringWithFormat:@"%lu.png", (unsigned long)currentImageIndex];
	imgVCenter.image = [UIImage imageNamed:currentImageNamed];
	imgVLeft.image = [UIImage imageNamed:[NSString stringWithFormat:@"%lu.png", (unsigned long)((currentImageIndex - 1 + imageCount) % imageCount)]];
	imgVRight.image = [UIImage imageNamed:[NSString stringWithFormat:@"%lu.png", (unsigned long)((currentImageIndex + 1) % imageCount)]];
	
	pageC.currentPage = currentImageIndex;
	lblImageDesc.text = mDicImageData[currentImageNamed];
}

- (void)setDefaultInfo {
	currentImageIndexs = 0;
	[self setInfoByCurrentImageIndex:currentImageIndexs];
}

- (void)reloadImage {
	CGPoint contentOffset = [_scrollView contentOffset];
	if (contentOffset.x > kWidthOfScreen) { //向左滑动
		currentImageIndexs = (currentImageIndexs + 1) % imageCount;
	} else if (contentOffset.x < kWidthOfScreen) { //向右滑动
		currentImageIndexs = (currentImageIndexs - 1 + imageCount) % imageCount;
	}
	
	[self setInfoByCurrentImageIndex:currentImageIndexs];
}

- (void)layoutUI {
	
	[self loadImageData];
	[self addScrollView];
	[self addImageViewsToScrollView];
	[self addPageControl];
	[self addLabel];
	[self setDefaultInfo];
}

// scrollview 减速停止
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
	[self reloadImage];

	_scrollView.contentOffset = CGPointMake(kWidthOfScreen, 0.0);
	pageC.currentPage = currentImageIndexs;
	
	NSString *currentImageNamed = [NSString stringWithFormat:@"%lu.png", (unsigned long)currentImageIndexs];
	lblImageDesc.text = mDicImageData[currentImageNamed];
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
