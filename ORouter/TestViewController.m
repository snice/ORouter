//
//  TestViewController.m
//  ORouter
//
//  Created by zhu zhe on 2018/12/3.
//  Copyright © 2018 flyma. All rights reserved.
//

#import "TestViewController.h"

#define SCHEMA_EASY @"easy"
#define HOST_EASY @"router.flyma.top"

#define ROUTE_PATH_SECOND HOST_EASY@"/second/test"

@interface TestViewController ()

@end

@implementation TestViewController

ROUTER_PATH(SCHEMA_EASY, ROUTE_PATH_SECOND)

-(instancetype)init {
    NSLog(@"TestViewController init");
    return [super init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
