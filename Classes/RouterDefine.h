//
//  RouterDefine.h
//  ORouter
//
//  Created by zhu zhe on 2018/12/3.
//

#define OR_EXPORT_METHOD_INTERNAL(module, path) \
+ (NSString *)routePath { \
return [NSString stringWithFormat:@"%@:/%@", module, [path hasPrefix:@"/"]?path:[NSString stringWithFormat:@"/%@",path]]; \
}
#define ROUTER_PATH(module, path) OR_EXPORT_METHOD_INTERNAL(module, path)
