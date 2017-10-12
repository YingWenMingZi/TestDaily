//
//  DDConfig.h
//  DuiDaily
//
//  Created by dengyuchi on 2017/10/10.
//  Copyright © 2017年 dengyuchi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Masonry/Masonry.h>
#import "WXApi.h"

//系统版本
#define OS_VERSION ([[[UIDevice currentDevice] systemVersion] floatValue])

//手机设备
#define IS_IOS_PHONE (([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)?YES:NO)

//版本判断
BOOL DDIsiOS7(void);
BOOL DDIsiOS8(void);
BOOL DDIsIPhone5(void);
BOOL DDIsiOS10(void);

/*屏高和屏宽，不是实际物理像素，只是用于显示。*/
#define DD_SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define DD_SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define DD_SCREEN_HEIGHT_NOSTATUSBAR ([[UIScreen mainScreen] bounds].size.height - 20)
#define DD_TABBAR_HEIGHT ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83.0:49.0)
#define DD_NAVBAR_HEIGHT 44
#define DD_STATUSBAR_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height
#define DD_NAVBAR_HEIGHT_WITH_STATUS_BAR (DD_NAVBAR_HEIGHT+ DD_STATUSBAR_HEIGHT)
#define DD_SCREEN_SCALE (DD_SCREEN_WIDTH/375.0)

//是否iphone4s屏
#define IS_IPHONE_4S_SCREEN [[UIScreen mainScreen] bounds].size.height>=480.0?YES:NO

//是否iphone5s屏
#define IS_IPHONE_5S_SCREEN [[UIScreen mainScreen] bounds].size.height>=568.0?YES:NO

//是否iphone6屏
#define IS_IPHONE_6_SCREEN [[UIScreen mainScreen] bounds].size.height>=667.0?YES:NO

//是否iphone6plus屏
#define IS_IPHONE_6PLUS_SCREEN [[UIScreen mainScreen] bounds].size.height>=736.0?YES:NO

//背景颜色
#define KDefaultBackgroundColor DD_Color_HexString(0xeaeaea, 1)

//字体颜色
#define KDefaultFontColor DD_Color_HexString(0x575757, 1)

//navbar颜色
#define KNavBarColor DD_Color_HexString(0x46a0fc,1)

//根据rgba生成color
#define DD_Color_RgbaValue(r,g,b,a) [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:a]

//生成UIColor 十六进制
#define DD_Color_HexString(rgbValue,a) DD_Color_RgbaValue((float)((rgbValue & 0xFF0000) >> 16),(float)((rgbValue & 0xFF00) >> 8),(float)(rgbValue & 0xFF),a)

//系统字体
#define DD_FontWithSize(size) [UIFont systemFontOfSize:size]
#define DD_BoldFontWithSize(size) [UIFont boldSystemFontOfSize:size]

@interface DDConfig : NSObject


@end
