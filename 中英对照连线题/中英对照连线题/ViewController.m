//
//  ViewController.m
//  中英对照连线题
//
//  Created by 唐天成 on 2016/11/19.
//  Copyright © 2016年 唐天成. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"
#import "MyScrollerView.h"
#import "Masonry.h"
//屏幕宽高
#define SCREEN_WIDTH         ([UIScreen mainScreen].bounds).size.width

@interface ViewController ()

@property (nonatomic, strong) MyView *myView;
@property (nonatomic, strong) MyScrollerView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.scrollView = [[MyScrollerView alloc]init];
    [self.view addSubview:self.scrollView];
    self.scrollView.backgroundColor = [UIColor yellowColor];
    self.scrollView.contentSize = CGSizeMake(600, 2000);
    self.scrollView.count = 6;
    self.scrollView.contentSize = CGSizeMake(0, 108 * 6);
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(244 * KWIDTH_IPHONE6_SCALE);
        make.height.mas_equalTo(432 * KWIDTH_IPHONE6_SCALE);
        make.bottom.with.offset(-21 * KWIDTH_IPHONE6_SCALE);
    }];
    
        self.myView = [[MyView alloc]initWithFrame:CGRectMake(0, 0, 244 * KWIDTH_IPHONE6_SCALE, 108 * 6)];
        [self.scrollView addSubview:self.myView];
        self.myView.count = 6;
        self.myView.backgroundColor = [UIColor greenColor];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
