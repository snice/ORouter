//
//  ORouter.h
//  ORouter
//
//  Created by zhu zhe on 2018/12/3.
//

#import <Foundation/Foundation.h>
#import "SDRouterContext.h"
#import "RouterDefine.h"
#import "ORouterViewController.h"

typedef void(^SDCompleteCallback)(SDRouterContext *context);
@interface ORouter : NSObject

+ (void)autoLoad;
+ (instancetype)shareRutor;
- (void)openRoute:(NSURL *)paten;

@end

