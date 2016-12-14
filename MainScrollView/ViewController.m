//
//  ViewController.m
//  MainScrollView
//
//  Created by Rillakkuma on 2016/12/14.
//  Copyright © 2016年 Rillakkuma. All rights reserved.
//

#import "ViewController.h"
#import "MonitsViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	MonitsViewController *monitsVC = [[MonitsViewController alloc]init];
//	[self.navigationController pushViewController:monitsVC animated:YES];
	[self presentViewController:monitsVC animated:YES completion:nil];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
