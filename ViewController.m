//
//  ViewController.m
//  headerAnimation
//
//  Created by wkr on 16/5/23.
//  Copyright © 2016年 pantao. All rights reserved.
//
#define kUISCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define kUISCREENHEIGHT [UIScreen mainScreen].bounds.size.height
#define kScale kUISCREENWIDTH/375
#define kScrollViewWidth kUISCREENWIDTH-160*kScale
#define kImageViewWidth (kScrollViewWidth-4*10*kScale)/5

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _headerImageArr = [NSMutableArray arrayWithObjects:[UIColor redColor],[UIColor yellowColor],[UIColor brownColor],[UIColor blackColor],[UIColor greenColor],nil];
    self.view.backgroundColor = [UIColor colorWithRed:0.96f green:0.96f blue:0.96f alpha:1.0f];
    [self.view addSubview:self.headerImageView];
    [self.view addSubview:self.headerScrollView];
    [self.view addSubview:self.heartBtn];
    
}

- (UIScrollView *)headerScrollView{
    if (_headerScrollView == nil) {
        _headerScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(80*kScale, 100*kScale, kScrollViewWidth+kImageViewWidth+10*kScale, kImageViewWidth)];
        [_headerScrollView addSubview:self.headerImageView0];
        [_headerScrollView addSubview:self.headerImageView1];
        [_headerScrollView addSubview:self.headerImageView2];
        [_headerScrollView addSubview:self.headerImageView3];
        [_headerScrollView addSubview:self.headerImageView4];
        _headerScrollView.backgroundColor = [UIColor clearColor];
    }
    return _headerScrollView;
}

- (UIImageView *)headerImageView{
    if (_headerImageView == nil) {
        _headerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, kImageViewWidth, kImageViewWidth)];
        _headerImageView.layer.masksToBounds = YES;
        _headerImageView.layer.cornerRadius = kImageViewWidth/2;
        _headerImageView.backgroundColor = self.headerImageArr[self.headerImageArr.count-1];
        [_headerImageView setAlpha:0];
    }
    return _headerImageView;
}

- (UIImageView *)headerImageView0{
    if (_headerImageView0 == nil) {
        _headerImageView0 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kImageViewWidth, kImageViewWidth)];
        _headerImageView0.layer.masksToBounds = YES;
        _headerImageView0.layer.cornerRadius = kImageViewWidth/2;
        _headerImageView0.backgroundColor = _headerImageArr[0];
        _headerImageView0.alpha = 1;
    }
    return _headerImageView0;
}

- (UIImageView *)headerImageView1{
    if (_headerImageView1 == nil) {
        _headerImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(kImageViewWidth+10*kScale, 0, kImageViewWidth, kImageViewWidth)];
        _headerImageView1.layer.masksToBounds = YES;
        _headerImageView1.layer.cornerRadius = kImageViewWidth/2;
        _headerImageView1.backgroundColor = _headerImageArr[1];
        _headerImageView1.alpha = 1;
    }
    return _headerImageView1;
}

- (UIImageView *)headerImageView2{
    if (_headerImageView2 == nil) {
        _headerImageView2 = [[UIImageView alloc]initWithFrame:CGRectMake((kImageViewWidth+10*kScale)*2, 0, kImageViewWidth, kImageViewWidth)];
        _headerImageView2.layer.masksToBounds = YES;
        _headerImageView2.layer.cornerRadius = kImageViewWidth/2;
        _headerImageView2.backgroundColor = _headerImageArr[2];
        _headerImageView2.alpha = 1;
    }
    return _headerImageView2;
}

- (UIImageView *)headerImageView3{
    if (_headerImageView3 == nil) {
        _headerImageView3 = [[UIImageView alloc]initWithFrame:CGRectMake((kImageViewWidth+10*kScale)*3, 0, kImageViewWidth, kImageViewWidth)];
        _headerImageView3.layer.masksToBounds = YES;
        _headerImageView3.layer.cornerRadius = kImageViewWidth/2;
        _headerImageView3.backgroundColor = _headerImageArr[3];
        _headerImageView3.alpha = 1;
    }
    return _headerImageView3;
}

- (UIImageView *)headerImageView4{
    if (_headerImageView4 == nil) {
        _headerImageView4 = [[UIImageView alloc]initWithFrame:CGRectMake((kImageViewWidth+10*kScale)*4, 0, kImageViewWidth, kImageViewWidth)];
        _headerImageView4.layer.masksToBounds = YES;
        _headerImageView4.layer.cornerRadius = kImageViewWidth/2;
        _headerImageView4.backgroundColor = _headerImageArr[4];
        _headerImageView4.alpha = 1;
    }
    return _headerImageView4;
}

- (UIButton *)heartBtn{
    if (_heartBtn == nil) {
        _heartBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _heartBtn.frame = CGRectMake((kUISCREENWIDTH-70*kScale)/2, self.headerScrollView.frame.origin.y+self.headerScrollView.frame.size.height+50*kScale, 70*kScale, 70*kScale);
        _heartBtn.layer.cornerRadius = 35*kScale;
        _heartBtn.backgroundColor = [UIColor blueColor];
        [_heartBtn addTarget:self action:@selector(clickedHeartBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _heartBtn;
}

- (void)clickedHeartBtn{
    [UIView animateWithDuration:0.3 animations:^{
        [self.headerScrollView setContentOffset:CGPointMake(-(kImageViewWidth+10*kScale), 0) animated:NO];
        self.headerImageView4.alpha = 0;
        [self.headerImageView setFrame:CGRectMake(self.headerScrollView.frame.origin.x, self.headerScrollView.frame.origin.y, kImageViewWidth, kImageViewWidth)];
        self.headerImageView.alpha = 1;
    } completion:^(BOOL finished) {
        [self.headerImageArr insertObject:self.headerImageArr[self.headerImageArr.count-1] atIndex:0];
        [self.headerImageArr removeLastObject];
        [self.headerImageView removeFromSuperview];
        self.headerImageView = nil;
        [self.headerImageView0 removeFromSuperview];
        self.headerImageView0 = nil;
        [self.headerImageView1 removeFromSuperview];
        self.headerImageView1 = nil;
        [self.headerImageView2 removeFromSuperview];
        self.headerImageView2 = nil;
        [self.headerImageView3 removeFromSuperview];
        self.headerImageView3 = nil;
        [self.headerImageView4 removeFromSuperview];
        self.headerImageView4 = nil;
        [self.headerScrollView removeFromSuperview];
        self.headerScrollView = nil;
        [self.view addSubview:self.headerImageView];
        [self.view addSubview:self.headerScrollView];
    }];
}

@end
