//
//  ORouter.m
//  ORouter
//
//  Created by zhu zhe on 2018/12/3.
//

#import "ORouter.h"
#import "SDRoutorUtil.h"
#import "SDURLParser.h"
#import <objc/runtime.h>
#import <objc/message.h>

NSArray *ClassGetSubclasses(Class parentClass)
{
    int numClasses = 0, newNumClasses = objc_getClassList(NULL, 0); // 1
    Class *classes = NULL; // 2
    NSMutableArray *result = [NSMutableArray array];
    while (numClasses < newNumClasses) { // 3
        numClasses = newNumClasses; // 4
        classes = (Class *)realloc(classes, sizeof(Class) * numClasses); // 5
        newNumClasses = objc_getClassList(classes, numClasses); // 6
        for (NSInteger i = 0; i < numClasses; i++) {
            Class superClass = classes[i];
            do {
                superClass = class_getSuperclass(superClass);
            } while(superClass && superClass != parentClass);
            if (superClass == nil) {
                continue;
            }
            [result addObject:classes[i]];
        }
    }
    free(classes);
    return result;
}

@implementation ORouter {
    NSMutableArray<NSDictionary *> *_results;
}
static ORouter *_rutor;

+(void)autoLoad {
    NSArray* vcArr = ClassGetSubclasses([UIViewController class]);
    for (id cls in vcArr) {
        Class currentClass = cls;
        if (!currentClass) {
            return;
        }
        unsigned int methodCount = 0;
        Method *methodList = class_copyMethodList(object_getClass(currentClass), &methodCount);
        if (methodCount > 0) {
            for (unsigned int i = 0; i < methodCount; i++) {
                Method curMethod = methodList[i];
                NSString *selStr = [NSString stringWithCString:sel_getName(method_getName(curMethod)) encoding:NSUTF8StringEncoding];
                if ([@"routePath" isEqualToString:selStr]) {
                    SEL selector = NSSelectorFromString(@"routePath");
                    NSString* path = ((id(*)(id,SEL))objc_msgSend)(currentClass,selector);
                    [[ORouter shareRutor] addPaten:path callback:^(SDRouterContext *context) {
                        UIViewController* vc = [[currentClass alloc] init];
                        [vc setValue:context.paramters forKey:@"params"];
                        [context.topNavigationController pushViewController:vc animated:YES];
                    }];
                    break;
                }
            }
        }
    }
}

+ (instancetype)shareRutor {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _rutor = [[ORouter alloc] init];
    });
    return _rutor;
}

- (instancetype)init {
    if (self = [super init]) {
        _results = @[].mutableCopy;
    }
    return self;
}

- (void)openRoute:(NSURL *)paten {
    SDURLParser *parser = [[SDURLParser alloc] initWithURL:paten];
    [_results enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([[obj allKeys].firstObject isEqualToString:parser.paten]) {
            SDRouterContext *context = [[SDRouterContext alloc] init];
            context.paramters = parser.paramters;
            if ([obj allValues].firstObject) {
                SDCompleteCallback callback = (SDCompleteCallback)[obj allValues].firstObject;
                callback(context);
            }
            *stop = YES;
        }
    }];
}

- (void)addPaten:(NSString *)paten callback:(SDCompleteCallback)callback{
    NSDictionary *dict = @{paten:callback};
    if (![_results containsObject:dict]) {
        [_results addObject:dict];
    }
}

@end
