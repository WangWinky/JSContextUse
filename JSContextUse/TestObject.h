//
//  TestObject.h
//  JSContextUse
//
//  Created by wangshanshan on 2018/4/5.
//  Copyright © 2018年 ws. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import "WSWebViewController.h"

@protocol TestObjectDelegate<JSExport>

//没有参数传递
-(void)jumpShareSdk;
//有一个参数传递
-(void)jumpShareSdkOneParameter:(NSString *)one;
/*
 JSExportAs的意思是用后面的方法代替前面的方法，
 例如用-(void)jumpShareSdkOneParameter:(NSString *)one secondParameter:(NSString *)two代替jumpShareSdkTwo，
 jumpShareSdkTwo是在js中写的方法名，-(void)jumpShareSdkOneParameter:(NSString *)one secondParameter:(NSString *)two是在OC中相对应的方法名
 */
//有两个参数传递
JSExportAs(jumpShareSdkTwo, -(void)jumpShareSdkOneParameter:(NSString *)one secondParameter:(NSString *)two);
//有三个参数传递
JSExportAs(jumpShareSdkThree, -(void)jumpShareSdkOneParameter:(NSString *)one secondParameter:(NSString *)two thirdParameter:(NSString *)three);

@end

@interface TestObject : NSObject<TestObjectDelegate>

@property (weak, nonatomic) WSWebViewController *controller;

@end
