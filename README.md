# ORouter
fork [SDRouter](https://github.com/xlsd/SDRouter) + oc-runtime
    
    看到SDRouter后，发现原理很简单，然而和其他router框架一样都需要主动添加各种block，因此为了解放block，ORouter 诞生了。

## 特性

* 自动装载路由block
* 采用define添加路由
* 支持加载storyboard中的viewcontroller

## 使用

1. 安装
    
    ```ruby
    pod 'ORouter'
    ```
    
2. 创建TestViewController

    TestViewController.h

    ```objective-c
    #import <UIKit/UIKit.h>
    #import <ORouter/ORouter.h>
    @interface TestViewController : ORouterViewController
    @end
    ```

    TestViewController.m

    ```objective-c
    #import "TestViewController.h"

    #define SCHEMA_EASY @"easy"
    #define HOST_EASY @"router.flyma.top"

    #define ROUTE_PATH_SECOND HOST_EASY@"/second/test"

    @interface TestViewController ()

    @end

    @implementation TestViewController

    ROUTER_PATH(SCHEMA_EASY, ROUTE_PATH_SECOND)
    ROUTER_STORYBOARD(Main, TestViewController)

    - (void)viewDidLoad {
        [super viewDidLoad];
        self.title = @"Second";
        NSLog(@"%@", self.params);
    }

    @end
    ```

3. 进入路由

    ```oc
    [[ORouter shareRutor] openRoute:[NSURL URLWithString:@"easy://router.flyma.top/second/test?test=23"]];
    ```

    采用标准URL规范，queryString 会自动绑定ORouterViewController的params

## License
```text
Copyright 2018 zhe Zhu

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
