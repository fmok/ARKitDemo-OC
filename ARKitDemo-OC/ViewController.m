//
//  ViewController.m
//  ARKitDemo-OC
//
//  Created by fm on 2017/10/18.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

#import "ViewController.h"
#import "ARSCNViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *startBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    WS(weakSelf);
    [self.view addSubview:self.startBtn];
    [self.startBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.view);
    }];
    [self.startBtn sizeToFit];
}

#pragma mark - Events
- (void)clickStart:(UIButton *)sender
{
    ARSCNViewController *scnVC = [[ARSCNViewController alloc] init];
    [self.navigationController pushViewController:scnVC animated:YES];
}

#pragma mark - getter
- (UIButton *)startBtn
{
    if (!_startBtn) {
        _startBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        [_startBtn setTitle:@"Begin the exploration of the universe" forState:UIControlStateNormal];
        [_startBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_startBtn addTarget:self action:@selector(clickStart:) forControlEvents:UIControlEventTouchUpInside];
        _startBtn.titleLabel.font = [UIFont systemFontOfSize:20.f];
    }
    return _startBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
