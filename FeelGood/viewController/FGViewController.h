//
//  FGViewController.h
//  FeelGood
//
//  Created by 肥儿古德 on 2019/9/6.
//  Copyright © 2019 hh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FGViewController : UIViewController

/**
 子类复写以下3个方法，配置UI，动作，数据相关
 */
- (void)fg_setupUI;
- (void)fg_setupEvent;
- (void)fg_setupData;
//子类复写此方法后，可根据图片生成leftBarButtonItem，并绑定用户的操作响应方法 back:
- (UIImage *)fg_leftItemImage;
//navigationbar的背景主题色
- (UIColor *)fg_navigationBarBgThemeColor;
//navigatoinbar字体色
- (UIColor *)fg_navigationBarTitleColor;

@end

@interface FGViewController (NavigationBar)

@property (nonatomic,copy) NSString * fg_title;
/**
 默认返回上一页面的方法
 */
- (void)fg_back:(id)sender;
/**
 快捷设置rightItem的方法,支持使用字符串,按钮,图片进行初始化
 */
- (void)fg_setupRightBarButtonItemWithObject:(id)object;
/**
 *  rightItem响应点击的方法,需要重写实现功能
 */
- (void)fg_clickedRightItem:(id)sender;

- (void)fg_setupNavigationBarHidden:(BOOL)hidden;


@end

NS_ASSUME_NONNULL_END
