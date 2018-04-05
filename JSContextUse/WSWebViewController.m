//
//  WSWebViewController.m
//  JSContextUse
//
//  Created by wangshanshan on 2018/4/5.
//  Copyright © 2018年 ws. All rights reserved.
//

#import "WSWebViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "TestObject.h"

@interface WSWebViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) JSContext *jsContext;

@end

@implementation WSWebViewController

-(instancetype)initWithFileName:(NSString *)fileName{
      self = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"WSWebViewController"];
    if (self) {
        _fileName = fileName;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:self.fileName ofType:@"html"];
    NSString *htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    [self.webView loadHTMLString:htmlString baseURL:nil];
    
}

#pragma mark - webview delegate
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    _jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    [self directInvoke];
    [self objectInvoke];
   
}
#pragma mark - js使用直接调用
-(void)directInvoke{
    //直接调用，这个时候js中的写法是jumpShareSdk()
    __weak typeof(self) weakSelf = self;
    _jsContext[@"jumpShareSdk"] = ^(){
        NSArray *args = [JSContext currentArguments];
        [weakSelf directInvokeShowArgs:args title:@"直接调用无参"];
    };
    
    _jsContext[@"jumpShareSdk1"] = ^(){
        NSArray *args = [JSContext currentArguments];
        [weakSelf directInvokeShowArgs:args title:@"直接调用一个参数"];

    };
    _jsContext[@"jumpShareSdk2"] = ^(){
        NSArray *args = [JSContext currentArguments];
        [weakSelf directInvokeShowArgs:args title:@"直接调用两个参数"];
        
    };
}

-(void)directInvokeShowArgs:(NSArray *)args title:(NSString *)title{
    if (args.count <= 0) {
         [self showAlertWithTitle:title message:nil];
        return;
    }
    NSMutableString *message = [NSMutableString string];
    for (id obj in args) {
        NSLog(@"%@",obj);
        JSValue *jsValue = obj;
        [message appendString:jsValue.toString];
    }
    [self showAlertWithTitle:title message:message];
}
#pragma mark - js使用对象调用
-(void)objectInvoke{
    //对象调用
    TestObject *testObject = [[TestObject alloc]init];
    testObject.controller = self;
    //_jsContext[@"testObject"]中的testObject指的是在js中的对象，例如testObject.share()
    _jsContext[@"testObject"] = testObject;
}

#pragma mark - alert
-(void)showAlertWithTitle:(NSString *)title message:(NSString *)message{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
    });
    
}

@end
