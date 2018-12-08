//
//  RouterDefine.h
//  ORouter
//
//  Created by zhu zhe on 2018/12/3.
//

#define STR(s) #s
#define STRING(s) [NSString stringWithFormat:@"%s", STR(s)]

#define OR_EXPORT_METHOD_INTERNAL(module, path) \
+ (NSString *)routePath { \
    return [NSString stringWithFormat:@"%@:/%@", module, [path hasPrefix:@"/"]?path:[NSString stringWithFormat:@"/%@",path]]; \
}

#define OR_EXPORT_VC(sName, identifier) \
+ (UIViewController*) instanceFromStory { \
    return [[UIStoryboard storyboardWithName:STRING(sName) bundle:nil] instantiateViewControllerWithIdentifier:STRING(identifier)]; \
}

#define ROUTER_PATH(module, path) OR_EXPORT_METHOD_INTERNAL(module, path)
#define ROUTER_STORYBOARD(sName, identifier) OR_EXPORT_VC(sName, identifier)

