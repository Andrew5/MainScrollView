//
//  MonitsViewController.m
//  Test
//
//  Created by Rillakkuma on 2016/12/14.
//  Copyright © 2016年 Rillakkuma. All rights reserved.
//

#import "MonitsViewController.h"

@interface MonitsViewController ()

@end

@implementation MonitsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.navigationItem.title  = @"分段函数";
	self.automaticallyAdjustsScrollViewInsets = NO;
	self.view.backgroundColor = [UIColor whiteColor];

	// 1.添加所有子控制器
	[self setupChildViewController];
	
	[self setupSegmentedControl];
	
}
- (void)setupSegmentedControl {
	
	NSArray  *title_arr = @[@"全部", @"新数据", @"好朋友", @"知己", @"同事"];
	
	// 创建底部滚动视图
	self.mainScrollView = [[UIScrollView alloc] init];
	_mainScrollView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64);
	_mainScrollView.contentSize = CGSizeMake(self.view.frame.size.width * title_arr.count, 0);
	_mainScrollView.backgroundColor = [UIColor clearColor];
	// 开启分页
	_mainScrollView.pagingEnabled = YES;
	// 没有弹簧效果
	_mainScrollView.bounces = NO;
	// 隐藏水平滚动条
	_mainScrollView.showsHorizontalScrollIndicator = NO;
	// 设置代理
	_mainScrollView.delegate = self;
	[self.view addSubview:_mainScrollView];
	
	
	self.SG = [SGSegmentedControl segmentedControlWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 44) delegate:self segmentedControlType:(SGSegmentedControlTypeStatic) titleArr:title_arr];
	_SG.titleColorStateSelected = [UIColor redColor];
	_SG.indicatorColor = [UIColor orangeColor];
	[self.view addSubview:_SG];
	
	UIView *linView = [[UIView alloc]init];
	linView.frame = CGRectMake(0, 43+64, [UIScreen mainScreen].bounds.size.width, 1);
	linView.backgroundColor = [UIColor whiteColor];//底线
	[self.SG addSubview:linView];
	
	MonitsAllViewController *complainListVC = [[MonitsAllViewController alloc] init];
	[self.mainScrollView addSubview:complainListVC.view];
	[self addChildViewController:complainListVC];
}


- (void)SGSegmentedControl:(SGSegmentedControl *)segmentedControl didSelectBtnAtIndex:(NSInteger)index {
	// 1 计算滚动的位置
	CGFloat offsetX = index * self.view.frame.size.width;
	self.mainScrollView.contentOffset = CGPointMake(offsetX, 0);
	
	// 2.给对应位置添加对应子控制器
	[self showVc:index];
}

// 添加所有子控制器
- (void)setupChildViewController {
	NSArray  *title_arr = @[@"全部", @"新数据", @"好朋友", @"知己", @"同事"];
	for (int i = 0; i<title_arr.count; i++) {
		MonitsAllViewController *oneVC = [[MonitsAllViewController alloc] init];
		oneVC.tagString = i;
		[self addChildViewController:oneVC];
	}
}
- (void)showVc:(NSInteger)index {
	
	CGFloat offsetX = index * self.view.frame.size.width;
	
	UIViewController *vc = self.childViewControllers[index];
	
	// 判断控制器的view有没有加载过,如果已经加载过,就不需要加载
	if (vc.isViewLoaded) return;
	
	[self.mainScrollView addSubview:vc.view];
	vc.view.frame = CGRectMake(offsetX, 0, self.view.frame.size.width, self.view.frame.size.height);
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
