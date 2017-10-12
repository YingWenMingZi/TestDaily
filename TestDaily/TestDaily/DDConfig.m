//
//  DDConfig.m
//  DuiDaily
//
//  Created by dengyuchi on 2017/10/10.
//  Copyright © 2017年 dengyuchi. All rights reserved.
//

#import "DDConfig.h"

@implementation DDConfig

BOOL DDIsIPhone5() {
    float screenHeight = [UIScreen mainScreen].bounds.size.height;
    if (screenHeight > 480.0f) {
        return YES;
    }
    return NO;
}

BOOL DDIsiOS7(){
    float currentVersion = [[UIDevice currentDevice].systemVersion floatValue];
    if (currentVersion >= 7.0) {
        return YES;
    }else {
        return NO;
    }
}

BOOL DDIsiOS10()
{
    float currentVersion = [[UIDevice currentDevice].systemVersion floatValue];
    if (currentVersion >= 10.0) {
        return YES;
    }else {
        return NO;
    }
}

BOOL DDIsiOS8()
{
    float currentVersion = [[UIDevice currentDevice].systemVersion floatValue];
    if (currentVersion >= 8.0) {
        return YES;
    }else {
        return NO;
    }
}

@end
