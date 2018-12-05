//
//  ViewController.m
//  ORouter
//
//  Created by zhu zhe on 2018/12/3.
//  Copyright © 2018 flyma. All rights reserved.
//

#import "ViewController.h"
#import <ORouter/ORouter.h>

@interface ViewController ()

@end

@implementation ViewController

ROUTER_PATH(@"app", @"fd")

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)routeTest:(id)sender {
    [[ORouter shareRutor] openRoute:[NSURL URLWithString:@"easy://router.flyma.top/second/test?test=23"]];
}


@end
