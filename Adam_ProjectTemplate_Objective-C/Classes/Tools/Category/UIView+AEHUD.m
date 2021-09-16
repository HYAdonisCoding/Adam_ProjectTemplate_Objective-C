//
//  UIView+AEHUD.m
//  Adam_ProjectTemplate_Objective-C
//
//  Created by Adam on 2021/9/16.
//  Copyright © 2021 com.adam. All rights reserved.
//

#import "UIView+AEHUD.h"
#import <MBProgressHUD/MBProgressHUD.h>

#define kTimes 0.25

@implementation UIView (AEHUD)
- (void)showWarning {
    [self show:@"" completeHandler:nil];
}



- (void)showWarningWords:(NSString *)text {
    [self show:text completeHandler:nil];
}
- (void)showFailure:(NSString *)text completeHandler:(nullable void(^)(id data))completeHandler {
    [self show:text completeHandler:completeHandler];
    
}

- (void)showSuccess:(NSString *)text completeHandler:(nullable void(^)(id data))completeHandler {
    [self show:text completeHandler:completeHandler];
}

- (MBProgressHUD *)show:(NSString *)text completeHandler:(nullable void(^)(id data))completeHandler {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.minSize = CGSizeMake(80, 80);
    hud.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.6f];
//    hud.tintColor = [UIColor orangeColor];
    hud.contentColor = [UIColor orangeColor];
    if (text.length <= 0) {
        /// 只转HUD
        hud.mode = MBProgressHUDModeIndeterminate;
    } else {
        if (completeHandler) {
            /// 有HUD和动画
            
        } else {
            /// 只有文字
            hud.mode = MBProgressHUDModeText;
        }
        hud.label.text = text;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(text.length * kTimes * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
            if (completeHandler) {
                completeHandler(hud);
            }
        });
    }
    
    
    
    return hud;
}

- (void)hide {
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self animated:YES];
    });
}

@end
