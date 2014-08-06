//
//  Application.h
//  WeWillSucceed
//
//  Created by junwen.wu on 14-8-5.
//  Copyright (c) 2014年 MakeItFun. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Application : NSObject

enum HOST_TYPE{
    HOST_DEV,
    HOST_BETA,
    HOST_ONLINE
};

enum LANGUAGE_TYPE {
    LANGUAGE_zhCN = 1,
    LANGUAGE_enUS,
    LANGUAGE_thTH,
};

+(Application*) instance;

@property (strong, nonatomic) NSString* HOST;
@property (strong, nonatomic) NSString* HOST_TOUCH;

-(NSString*) translateByKey:(NSString*)key;
@end

#define sApplication [Application instance]
#define T_(x) [[Application instance] translateByKey:x]
//#define T_(x) NSLocalizedString(x, @"Undefine")
