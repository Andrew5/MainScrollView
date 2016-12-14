//
//  MonitsViewController.h
//  Test
//
//  Created by Rillakkuma on 2016/12/14.
//  Copyright © 2016年 Rillakkuma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SGSegmentedControl.h"
#import "MonitsAllViewController.h"

@interface MonitsViewController : UIViewController<UIScrollViewDelegate, SGSegmentedControlDelegate>

@property (nonatomic, strong) SGSegmentedControl *SG;
@property (nonatomic, strong) UIScrollView *mainScrollView;
@end
