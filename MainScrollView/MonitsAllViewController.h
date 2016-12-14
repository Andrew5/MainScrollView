//
//  MonitsAllViewController.h
//  Test
//
//  Created by Rillakkuma on 2016/12/14.
//  Copyright © 2016年 Rillakkuma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MonitsAllViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>
{
	UITableView *table;
	UICollectionView *collectionview;
	
	UIScrollView *_scrollView;
	UIPageControl *pageC;
	UIImageView *imgVLeft;
	UIImageView *imgVCenter;
	UIImageView *imgVRight;
	UILabel *lblImageDesc;
	NSMutableDictionary *mDicImageData;
	NSUInteger currentImageIndexs;
	NSUInteger imageCount;
	
}
@property(nonatomic,assign)int tagString;

@end
