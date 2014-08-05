//
//  NavigationVC.h
//  WeWillSucceed
//
//  Created by junwen.wu on 14-8-5.
//  Copyright (c) 2014年 MakeItFun. All rights reserved.
//

#import "PortraitVC.h"
#import "Application.h"
#import "UIView+Util.h"

#define STATUSBAR_HEIGHT 20
#define NAVIGATIONBAR_HEIGHT 40

@interface NavigationVC : PortraitVC
@property (assign, nonatomic) CGFloat tabBarHeight;

@property (strong, nonatomic) UIView* container_bar;
@property (strong, nonatomic) UIView* container_body;

@property (strong, nonatomic) UIButton* nav_back;
@property (strong, nonatomic) UILabel* nav_title;

-(void) navigationWithTitle:(NSString*) title
               isHiddenBack:(BOOL) hiddenBack;

-(void) handleLanguageChanged:(NSBundle*) bundle;

@end
