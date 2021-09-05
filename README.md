#基于安卓会议室预约与管理系统客户端

此后台为网上寻找，本人改动如有侵权联系下架。

经本人改动加入接口，使得可以安卓app可以使用。

此后台可与huiyishi app结合使用。

##改动点

PermissInterceptor 拦截器加入了接口地址。
"/selectRoomBynumber".equals(requestURI) ||
                "/androidlogin".equals(requestURI)||"/getAllUser".equals(requestURI)||
                "/selectRoomByroomname".equals(requestURI)||
                "/selectMeetingByusername".equals(requestURI)||
                "/selectMeetingByroomnameAndstarttimeAndendtime".equals(requestURI)||
                "/selectMeetingBystarttimeAndendtime".equals(requestURI) ||
                "/selectMeetingByemployeeid".equals(requestURI)||
                "/selectMeetingBymeetingname".equals(requestURI)||
                "/getmeetingoByreservationistid".equals(requestURI)||
                "/insterMeeting".equals(requestURI)||
                "/androidsign".equals(requestURI)||
        "/selectMeetingByemployeeidhis".equals(requestURI))
       
       
接口都放在了登录控制器中，LoginController。

## 1. 使用说明

```
导入数据库文件meeting.sql

普通用户账号kxf密码1 管理员账号xzb密码123
```






## 2. 导入数据库时需要修改resources下的db.properties文件的账号和密码（对应你的mysql中的账户和密码）

```
db.username=你的账号
db.password=你的密码
db.url=jdbc:mysql:///meeting?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai
```




