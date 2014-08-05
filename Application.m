//
//  Application.m
//  WeWillSucceed
//
//  Created by junwen.wu on 14-8-5.
//  Copyright (c) 2014年 MakeItFun. All rights reserved.
//

#import "Application.h"

#define DEV_HOST_URL @"http://182.92.69.151:8080"

@interface Application()
@property (strong, nonatomic) NSBundle* bundleOfLang;
@end

@implementation Application

+(Application*) instance {
    static Application* inst = nil;
    @synchronized(self){
        if(inst == nil){
            inst = [Application new];
            [inst initialization];
        }
    }
    return inst;
}

-(void) initialization {
    [self changeHost:HOST_DEV];
    [self loadDefaultLanguage];
}

-(void)loadDefaultLanguage {
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSNumber *defLang = [def valueForKey:@"userLanguage"];
    if([defLang intValue] == 0){
        defLang = [NSNumber numberWithInt:LANGUAGE_thTH];
    }
    NSArray* languages = [def objectForKey:@"AppleLanguages"];
    NSString *current = [languages objectAtIndex:0];
    if([current isEqualToString:@"en"] || [current isEqualToString:@"zh-Hans"]){
        defLang = [NSNumber numberWithInt:1];
    }else{
        defLang = [NSNumber numberWithInt:3];
    }
    [self changeLanguage:[defLang intValue]];
}

-(void) changeLanguage:(enum LANGUAGE_TYPE)type {
    
    NSString *lang = nil;
    switch(type){
        case LANGUAGE_zhCN:
        {
            lang = @"zh-Hans";
            break;
        }
        case LANGUAGE_enUS:
        {
            lang = @"en";
            break;
        }
        case LANGUAGE_thTH:
        {
            lang = @"th";
            break;
        }
        default:
            break;
    }
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setValue:[NSNumber numberWithInt:type] forKey:@"userLanguage"];
    [def synchronize];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"en" ofType:@"lproj"];
    [self setValue:[NSBundle bundleWithPath:path] forKeyPath:@"bundleOfLang"];
}

-(NSString*) translateByKey:(NSString*)key {
    NSString* tmp = [self.bundleOfLang localizedStringForKey:key value:nil table:@"Localizaed"];
    assert(tmp != nil);
    return tmp;
}

-(void) changeHost:(enum HOST_TYPE)type {
    
    switch (type) {
        case HOST_DEV:{
            _HOST = DEV_HOST_URL;
            break;
        }
        case HOST_BETA:{
            _HOST = DEV_HOST_URL;
            break;
        }
        case HOST_ONLINE:{
            _HOST = DEV_HOST_URL;
            break;
        }
        default:
            break;
    }
}
@end
