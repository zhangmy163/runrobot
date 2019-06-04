### 1.把脚本文件夹也放在该目录

### 2.修改start.sh的脚本目录名称和Dockerfile中相关的脚本目录名称

### 3.创建镜像

    docker build -t runrobot -f Dockerfile .

#### 4.启动镜像

    docker run --name test -it runrobot 

```
*** Keywords ***
登录功能
    [Arguments]    ${name}    ${password}
    ${chrome options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome options}   add_argument    headless
    Call Method    ${chrome options}   add_argument    disable-gpu
    Call Method    ${chrome options}   add_argument    --no-sandbox
    ${options}=     Call Method     ${chrome_options}    to_capabilities


    Create Webdriver     Chrome    chrome_options=${chrome options}
    Set Window Size    1366    768
    Go to    https://www.baidu.com
```

