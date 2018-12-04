//
//  ORouter.h
//  ORouter
//
//  Created by zhu zhe on 2018/12/3.
//

#import <Foundation/Foundation.h>
#import "RouterDefine.h"
#import "SDRouterContext.h"
#import "SDRoutorUtil.h"
#import "SDURLParser.h"

typedef void(^SDCompleteCallback)(SDRouterContext *context);
@interface ORouter : NSObject

+ (void)autoLoad;
+ (instancetype)shareRutor;
- (void)rutor:(NSURL *)paten;

@end
