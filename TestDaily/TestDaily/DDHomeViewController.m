//
//  DDHomeViewController.m
//  DuiDaily
//
//  Created by huaat on 2017/10/10.
//  Copyright © 2017年 dengyuchi. All rights reserved.
//

#import "DDHomeViewController.h"

@interface DDHomeViewController ()<UITextViewDelegate>

@property(nonatomic, strong)UIButton         *sendButton;
@property(nonatomic, strong)UILabel          *intervalTimeLabel;        //间隔时间
@property(nonatomic, strong)UILabel          *timeLabel;                //时间显示label
@property(nonatomic, strong)UITextView       *sendContentTextView;      //发送的内容

@end

@implementation DDHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initNavi];
    [self initSubView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

-(void)initNavi
{
    [self.navigationController.navigationBar setBackgroundImage:[self imageWithColor:[UIColor redColor]] forBarMetrics:(UIBarMetricsDefault)];
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"测试的日常";
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.font = [UIFont systemFontOfSize:18];
    self.navigationItem.titleView = titleLabel;
}

-(void)initSubView
{
    [self.view addSubview:self.sendButton];
    [self.view addSubview:self.intervalTimeLabel];
    [self.view addSubview:self.sendContentTextView];
    [self.view addSubview:self.timeLabel];
    
    [self.intervalTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.sendContentTextView.mas_top).offset(-50 * DD_SCREEN_SCALE);
    }];
    
    [self.sendContentTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(150 * DD_SCREEN_SCALE);
        make.width.mas_equalTo(DD_SCREEN_WIDTH - 40 * DD_SCREEN_SCALE);
        make.height.mas_equalTo(80 * DD_SCREEN_SCALE);
        make.centerX.mas_equalTo(self.view);
    }];
    
    [self.sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.width.mas_equalTo(120 * DD_SCREEN_SCALE);
        make.height.mas_equalTo(60 * DD_SCREEN_SCALE);
        make.top.mas_equalTo(self.sendContentTextView.mas_bottom).offset(20 * DD_SCREEN_SCALE);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(self.intervalTimeLabel.mas_bottom).offset(10 * DD_SCREEN_SCALE);
    }];
}

//生成颜色的图片
-(UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

#pragma --mark button click
-(void)sendButtonClicked:(UIButton *)button
{
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc]init];
    req.text = self.sendContentTextView.text;
    req.bText = YES;
    req.scene = WXSceneSession;
    [WXApi sendReq:req];
    
    self.sendContentTextView.text = @"";
    [self.sendContentTextView resignFirstResponder];
}

#pragma --mark 懒加载
-(UIButton *)sendButton
{
    if (!_sendButton) {
        _sendButton = ({
            UIButton *button = [[UIButton alloc]init];
            button.backgroundColor = [UIColor yellowColor];
            [button setTitle:@"发送微信给阿斗" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button.layer.cornerRadius = 2 * DD_SCREEN_SCALE;
            [button.titleLabel setFont:DD_FontWithSize(16)];
            [button addTarget:self action:@selector(sendButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _sendButton;
}

-(UILabel *)intervalTimeLabel
{
    if (!_intervalTimeLabel) {
        _intervalTimeLabel = ({
            UILabel *label = [[UILabel alloc]init];
            label.text = @"间隔时间";
            label.font = DD_FontWithSize(20);
            label.textColor = [UIColor grayColor];
            [label sizeToFit];
            label;
        });
    }
    return _intervalTimeLabel;
}

-(UITextView *)sendContentTextView
{
    if (!_sendContentTextView) {
        _sendContentTextView = ({
            UITextView *textView = [[UITextView alloc]init];
            [textView setFont:DD_FontWithSize(14)];
            textView.textAlignment = NSTextAlignmentLeft;
            textView.layer.borderWidth = 1 * DD_SCREEN_SCALE;
            textView.layer.borderColor = [UIColor blackColor].CGColor;
            textView.returnKeyType = UIReturnKeyGo;
            textView;
        });
    }
    return _sendContentTextView;
}

-(UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = ({
            UILabel *label = [[UILabel alloc]init];
            label.text = @"10:30:20";
            label.font = DD_FontWithSize(20);
            label.textColor = [UIColor grayColor];
            [label sizeToFit];
            label;
         });
    }
     return _timeLabel;
}

@end
