//
//  ViewController.m
//  MoviePlayerFromInterentByThirdParty
//
//  Created by  江苏 on 16/4/2.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"
#import "CDPVideoPlayer.h"
@interface ViewController ()<CDPVideoPlayerDelegate>
@property(nonatomic,strong)CDPVideoPlayer* player;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    
}
- (IBAction)startAction:(UIButton *)sender {
    [self.player play];
}
- (IBAction)pauseAction:(UIButton *)sender {
    [self.player pause];
}
-(BOOL)shouldAutorotate{
    return !_player.isSwitch;
}
-(void)createUI{
    self.player=[[CDPVideoPlayer alloc]initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.width*3/4)
                 url:@"http://117.34.59.25/vlive.qqvideo.tc.qq.com/g0019653lml.mp4?sdtfrom=v1010&amp;vkey=76DA17B56C8480CBFA7EF485C50F3D2217883E5DA9F1EA79A1B7BD8BF4F7B4E2854B804B2782C8C5D2340B9F08204FBE462B1BCF70AC04523A9610BD22C2D675C49F2A2DB421071257F35B6D17D8FDAEC3F04CA7C5D66212"
                 delegate:self
                 haveOriginalUI:YES];
    self.player.title=@"正在播放";
    [self.view addSubview:self.player];
}
#pragma mark - CDPVideoPlayerDelegate
//非全屏下返回点击(仅限默认UI)
-(void)back{
    [self backClick];
}
#pragma mark - 点击事件
//返回
-(void)backClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)dealloc{
    [self.player close];
}

@end
