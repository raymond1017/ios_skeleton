//
//  PluginCenter.h
//  WeWillSucceed
//
//  Created by junwen.wu on 14-8-5.
//  Copyright (c) 2014年 MakeItFun. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol pluginDelegate <NSObject>
-(BOOL)handleURL:(NSURL*)url;
@end


@interface PluginCenter : NSObject
+(PluginCenter*) instance;

-(void) execute:(NSURL*) url;
-(void) registerDelegate:(id)delegate;
@end
#define sPluginCenter [PluginCenter instance]
