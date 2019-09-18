//
//  FGViewController.m
//  FeelGood
//
//  Created by 肥儿古德 on 2019/9/6.
//  Copyright © 2019 hh. All rights reserved.
//

#import "FGViewController.h"

@interface FGViewController ()

@property (nonatomic,copy) NSString * naviTitle;

@end

@implementation FGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage * leftItemImage = [self leftItemImage];
    if (leftItemImage) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[leftItemImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(back:)];
    }
    UIColor * navigationBarBgThemeColor = [self navigationBarBgThemeColor];
    if (navigationBarBgThemeColor) {
        self.navigationController.navigationBar.barTintColor = navigationBarBgThemeColor;
    }
    UIColor * navigationBarTitleColor = [self navigationBarTitleColor];
    if (navigationBarTitleColor) {
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:navigationBarTitleColor}];
    }
    [self setupUI];
    [self setupEvent];
    [self setupData];
}

/**
 子类复写以下3个方法，配置UI，动作，数据相关
 */
- (void)setupUI{
    
}
- (void)setupEvent{
    
}
- (void)setupData{
    
}
//子类复写此方法后，可根据图片生成leftBarButtonItem，并绑定用户的操作响应方法 back:
- (UIImage *)leftItemImage{
    return nil;
}
//navigationbar的背景主题色
- (UIColor *)navigationBarBgThemeColor{
    return nil;
}
//navigatoinbar字体色
- (UIColor *)navigationBarTitleColor{
    return nil;
}

@end

@implementation FGViewController (NavigationBar)

- (void)back:(id)sender{
    if (self.navigationController.viewControllers.count > 1) {
        [self.navigationController popViewControllerAnimated:YES];
    }else if (self.presentingViewController){
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        
    }
}
- (void)setNaviTitle:(NSString *)naviTitle{
    _naviTitle = naviTitle;
    self.navigationItem.title = naviTitle;
}
- (void)setupRightBarButtonItemWithObject:(id)object{
    if ([object isKindOfClass:[UIButton class]]) {
        [self setupRightBarButtonItemWithButton:object];
    }else if ([object isKindOfClass:[NSString class]]){
        [self setupRightBarButtonItemWithString:object];
    }else if ([object isKindOfClass:[UIImage class]]){
        [self setupRightBarButtonItemWithImage:object];
    }else{
        NSLog(@"目前只支持使用按钮,字符串,图片进行初始化");
    }
}
- (void)setupRightBarButtonItemWithButton:(UIButton *)button{
    [button addTarget:self action:@selector(clickedRightItem:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}
- (void)setupRightBarButtonItemWithString:(NSString *)string{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:string style:UIBarButtonItemStyleDone target:self action:@selector(clickedRightItem:)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
}
- (void)setupRightBarButtonItemWithImage:(UIImage *)image{
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStyleDone target:self action:@selector(clickedRightItem:)];
    //    [self.navigationItem.rightBarButtonItem setupImageSize:CGSizeMake(20, 20)];
    if ([UIDevice currentDevice].systemVersion.integerValue < 11) {
        self.navigationItem.rightBarButtonItem.imageInsets = UIEdgeInsetsMake(0, -5, 0, 5);
    }else{
        self.navigationItem.rightBarButtonItem.imageInsets = UIEdgeInsetsMake(0, 5, 0, -5);
    }
}
- (void)clickedRightItem:(id)sender{
    NSLog(@"在子类中重写clickedRightItem:实现点击方法");
}
- (void)setupAutoStatusWithColor:(UIColor *)color{
    UIView * statusBgView = [[UIView alloc] init];
    [statusBgView setBackgroundColor:color];
    [self.view addSubview:statusBgView];
    //    [statusBgView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.mas_equalTo(self.view);
    //        make.right.mas_equalTo(self.view);
    //        make.top.mas_equalTo(self.view);
    //        make.height.mas_equalTo(20);
    //    }];
}

- (void)setupNavigationBarHidden:(BOOL)hidden{
    if (hidden) {
        if (self.navigationController.navigationBarHidden == NO) {
            [self.navigationController setNavigationBarHidden:YES animated:YES];
        }
    }else{
        if (self.navigationController.navigationBarHidden) {
            [self.navigationController setNavigationBarHidden:NO animated:YES];
        }
    }
}

@end
