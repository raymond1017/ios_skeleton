//
//  PluginCenter.m
//  WeWillSucceed
//
//  Created by junwen.wu on 14-8-5.
//  Copyright (c) 2014年 MakeItFun. All rights reserved.
//

#import "PluginCenter.h"
#import "Configure.h"

@interface PluginCenter()
@property (strong, nonatomic) NSMutableArray* delegates;
@end


@implementation PluginCenter

+(PluginCenter*) instance {
    static PluginCenter* inst = nil;
    @synchronized(self){
        if(inst == nil){
            inst = [PluginCenter new];
        }
    }
    return inst;
}

-(id)init{
    self = [super init];
    if(self){
        self.delegates = [NSMutableArray new];
    }
    return self;
}


-(void) execute:(NSURL*) url {
    if([[url scheme] isEqualToString:AppSchema]){
        assert(NO);
        return;
    }
    
    for (id<pluginDelegate> delegate in self.delegates) {
        if([delegate handleURL:url])
            return;
    }
    
    assert(NO);
}

-(void) registerDelegate:(id)delegate {
    [self.delegates addObject:delegate];
}
@end
