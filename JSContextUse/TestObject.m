//
//  TestObject.m
//  JSContextUse
//
//  Created by wangshanshan on 2018/4/5.
//  Copyright © 2018年 ws. All rights reserved.
//

#import "TestObject.h"

@implementation TestObject

-(void)jumpShareSdk{
    [self.controller showAlertWithTitle:@"对象调用无参" message:nil];
}
-(void)jumpShareSdkOneParameter:(NSString *)one{
    [self.controller showAlertWithTitle:@"对象调用一个参数" message:one];
}
-(void)jumpShareSdkOneParameter:(NSString *)one secondParameter:(NSString *)two{
    NSString *message = [NSString stringWithFormat:@"%@\n%@",one,two];
    [self.controller showAlertWithTitle:@"对象调用两个参数" message:message];

}

-(void)jumpShareSdkOneParameter:(NSString *)one secondParameter:(NSString *)two thirdParameter:(NSString *)three{
    NSString *message = [NSString stringWithFormat:@"%@\n%@\n%@",one,two,three];
    [self.controller showAlertWithTitle:@"对象调用三个参数" message:message];
}

@end
