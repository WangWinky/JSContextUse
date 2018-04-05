//
//  WSWebViewController.h
//  JSContextUse
//
//  Created by wangshanshan on 2018/4/5.
//  Copyright © 2018年 ws. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WSWebViewController : UIViewController

@property (copy, nonatomic) NSString *fileName;

-(instancetype)initWithFileName:(NSString *)fileName;
-(void)showAlertWithTitle:(NSString *)title message:(NSString *)message;
@end
