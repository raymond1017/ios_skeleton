//
//  NSURL+Util.m
//  WeWillSucceed
//
//  Created by junwen.wu on 14-8-5.
//  Copyright (c) 2014年 MakeItFun. All rights reserved.
//

#import "NSURL+Util.h"
#import "Configure.h"

@implementation NSURL(Util)

-(void)execute {
    if([self.scheme isEqualToString:AppSchema]){
        assert(false);
        return;
    }
    
    NSString* host = self.host;
}
@end
