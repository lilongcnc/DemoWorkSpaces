//
//  ViewController.m
//  DownLoadDemo
//
//  Created by 李龙 on 16/3/23.
//  Copyright © 2016年 lauren. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

#define NIY_DOWNLOADPATH [NSHomeDirectory() stringByAppendingPathComponent:@"tmp/123.mov"]
#define VIDEO_URL @"http://w5.dwstatic.com/8/3/1544/179697-100-1446001555.mp4"



@interface ViewController (){
    NSProgress *_progress;
    NSURLSessionDownloadTask *_task;
    NSMutableData *_downloadData;
    BOOL isDownloading;
    
}
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    isDownloading = NO;
    
       [_btn setBackgroundImage:[UIImage imageNamed:@"暂停"] forState:UIControlStateNormal];
    
    
}

- (IBAction)download:(id)sender {
    if (isDownloading) {
        [sender setBackgroundImage:[UIImage imageNamed:@"暂停"] forState:UIControlStateNormal];
        __weak NSMutableData *weakData = _downloadData;
        [_task cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
            weakData.data = resumeData;
        }];
        
        isDownloading = NO;
        return;
    }else{
        
        [sender setBackgroundImage:[UIImage imageNamed:@"下载"] forState:UIControlStateNormal];
        if (_downloadData.length == 0){
            //如果_downloadData为空
            
            _downloadData = [[NSMutableData alloc] init];
            
            AFURLSessionManager *sm = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
            
            NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:VIDEO_URL]];
            
            //__autoreleasing
             __block NSProgress *progress = nil;
            
            _task = [sm downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
                NSLog(@"获取当前进度1");
               progress =  downloadProgress;
                
            } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
                
                return [NSURL fileURLWithPath:NIY_DOWNLOADPATH];
                
            } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
                if (error) {
                    NSLog(@"下载未完成");
                }else{
                    NSLog(@"下载成功==%@",NIY_DOWNLOADPATH);
                    
                    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"通知1" message:@"下载完成" preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
                    [alertController addAction:otherAction];
                    [self presentViewController:alertController animated:YES completion:nil];
                    
                    
                }
            }];
            [_task resume];
            isDownloading = YES;
            
            _progress = progress;
            [_progress addObserver:self forKeyPath:@"fractionCompleted" options:NSKeyValueObservingOptionNew context:nil];
            
        }else{
            //如果_downloadData不为空
            AFURLSessionManager *sm = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
            //__autoreleasing
            __block NSProgress *progress = nil;
            
            //使用之前保存的数据继续下载
            _task = [sm downloadTaskWithResumeData:_downloadData progress:^(NSProgress * _Nonnull downloadProgress) {
              NSLog(@"获取当前进度2");
               progress =  downloadProgress;
                
            } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
                return [NSURL URLWithString:NIY_DOWNLOADPATH];
            } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
                if (error) {
                    NSLog(@"继续下载未完成");
                }else{
                    //下载成功以后打印保存路径地址,可以去查看一下文件
                    NSLog(@"继续下载成功==%@",NIY_DOWNLOADPATH);
                    
                    
                    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"通知2" message:@"下载完成" preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
                    [alertController addAction:otherAction];
                    [self presentViewController:alertController animated:YES completion:nil];
                    
                }
            }];
            [_task resume];
            _progress = progress;
            //新的对象需要重新观察
            [_progress addObserver:self forKeyPath:@"fractionCompleted" options:NSKeyValueObservingOptionNew context:nil];
            
        }
        isDownloading = YES;
    }
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    //判断观察者时间是否是有进度改变触发的
    NSLog(@"%s",__FUNCTION__);
    if(object == _progress && [keyPath isEqualToString:@"fractionCompleted"]){
        NSLog(@"进度: %g",_progress.fractionCompleted);
    }
    
    
    
}

@end
