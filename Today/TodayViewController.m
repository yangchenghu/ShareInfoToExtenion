//
//  TodayViewController.m
//  Today
//
//  Created by yangchenghu on 10/22/14.
//  Copyright (c) 2014 yangchenghu. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

#import <ShareCode/ShareCode.h>

@interface TodayViewController () <NCWidgetProviding>

@end

static NSString * sShareUserDefaultGroupName = @"group.com.yangch.shareUserDefault";
static NSString * sShareKeyChainGroupName    = @"com.yangch.ShareInfoToExtenion";


@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    NSUserDefaults * userDefault = [[NSUserDefaults alloc] initWithSuiteName:sShareUserDefaultGroupName];
    
    NSString * strFromUserDefault = [userDefault objectForKey:@"shareDefault"];
    NSLog(@"read info from share UserDefault:%@", strFromUserDefault);
    
    NSString * strKeyChainGroupName = [NSString stringWithFormat:@"%@.%@", [SFHFKeychainUtils bundleSeedID], sShareKeyChainGroupName];
    
    NSString * strFromKeyChain = [SFHFKeychainUtils getPasswordForUsername:@"myname" andServiceName:@"com.yangch.shareinfo.test" accessGroup:strKeyChainGroupName error:nil];
    
    NSLog(@"read info from share Keychain:%@", strFromKeyChain);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
