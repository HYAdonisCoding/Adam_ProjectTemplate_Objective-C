//
//  UIView+AEHUD.h
//  Adam_ProjectTemplate_Objective-C
//
//  Created by Adam on 2021/9/16.
//  Copyright © 2021 com.adam. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (AEHUD)

- (void)showWarning;

- (void)showWarningWords:(NSString *)text;

- (void)showSuccess:(NSString *)text completeHandler:(nullable void(^)(id data))completeHandler;

- (void)showFailure:(NSString *)text completeHandler:(nullable void(^)(id data))completeHandler;

- (void)hide;
@end

NS_ASSUME_NONNULL_END
