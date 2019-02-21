//
//  WMNativeAdRelatedView.h
//  WMAdSDK
//
//  Created by 李盛 on 2018/8/29.
//  Copyright © 2018年 bytedance. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WMVideoAdView.h"
#import "WMNativeAd.h"

@interface WMNativeAdRelatedView : NSObject

/**
 dislike 按钮懒加载，需要主动添加到 View，处理 materialMeta.filterWords反馈
 提高广告信息推荐精度
 */
@property (nonatomic, strong, readonly, nullable) UIButton *dislikeButton;

/**
 adLabel 推广标签懒加载， 需要主动添加到 View
 */
@property (nonatomic, strong, readonly, nullable) UILabel *adLabel;

/**
 logoImageView 网盟广告标识，需要主动添加到 View
 */
@property (nonatomic, strong, readonly, nullable) UIImageView *logoImageView;

/**
 WMPlayer View 需要主动添加到 View
 */
@property (nonatomic, strong, readonly, nullable) WMVideoAdView *videoAdView;

/**
 刷新数据,每次获取数据刷新对应的视图
 */
- (void)refreshData:(WMNativeAd *)nativeAd;

@end
