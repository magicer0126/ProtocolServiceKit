//
//  LFLViewController.m
//  ProtocolServiceManger
//
//  Created by DevdragonLi on 07/18/2020.
//  Copyright (c) 2020 DevdragonLi. All rights reserved.
//

#import "LFLViewController.h"

#import "LFLVipProtocol.h"
#import "LFLPlayProtocol.h"

#import <ProtocolServiceKit/ProtocolServiceKit.h>

@interface LFLViewController ()

@end

@implementation LFLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // VIP和播放业务复杂后，只公开Protocol文件决定业务对外能力
    
    Class <LFLVipProtocol> vipService = ServiceWithProtocol(LFLVipProtocol);
    
    if (vipService && [vipService isCurrentUserVipStatus]) {
        [ServiceWithProtocol(LFLPlayProtocol) playMiniVideo];
    } else {
        NSLog(@"Error:LFLVipProtocol notfound service Class");
    }
}


@end
