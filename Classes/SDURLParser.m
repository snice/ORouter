//
//  SDURLParser.m
//  MethodTest
//
//  Created by xuelin on 2017/5/27.
//  Copyright © 2017年 as_one. All rights reserved.
//

#import "SDURLParser.h"
#import "SDRoutorUtil.h"

@implementation SDURLParser
- (instancetype) initWithURL:(NSURL*)url {
    self = [super init];
    if (!self) {
        return self;
    }
    _originURL = url;
    [self decodeURL];
    return self;
}

- (void) decodeURL
{
    _scheme = _originURL.scheme;
    _host = _originURL.host;
    NSString* query = _originURL.query;
    _paramters = SDURLRouteDecodeURLQueryParamters(query);
    _paten = [_originURL.absoluteString substringWithRange:NSMakeRange(0, [_originURL.absoluteString rangeOfString:query].location - 1)];
}
@end
