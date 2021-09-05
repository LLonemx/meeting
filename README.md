# 会议管理系统

> **后端基于SSM、前端基于Freemarker写的会议管理系统**

## 1. 使用说明

```
导入数据库文件meeting.sql

普通用户账号kxf密码1 管理员账号xzb密码123
```



## 2.每个页面设计的功能

 		

```
addmeetingroom页面->添加会议室功能（只有管理员才能添加）
approveaccount页面->注册审批功能（只有管理员才能审批）
bookmeeting页面->预定会议功能
cancelmeeting页面->撤销会议预定功能(在我的预订里能撤销预订)
changepassword页面->修改密码功能
departments页面->部门管理功能(只有管理员才能管理)
leftMenu页面->左边菜单功能
login页面->登录功能
meetingdetails页面->修改会议预定功能(搜索会议页面有个查看详情的功能)
meetingrooms页面->查看会议室功能
mybookings页面->我的预定功能
mymeetingdetails页面->我的预定里的查看和撤销功能
notifications页面->最新通知功能
register页面->注册功能
roomdetailsl页面->会议室详情页面
searchemployees页面->搜索员工的功能
searchmeetings页面->搜索会议的功能
top页面->页面顶部( 包括退出登录和修改密码)
```



## 3.注意点

```
         由于数据库中的存储的会议开始时间和结束时间都是date类型，但是在页面中填入的数据是String类型
     所以需要把页面输入的字符串转换成日期类，所以我们添加了一个DateConverter这个类来转换日期
```



## 4.普通用户登录和管理员登录获得的权限是不同的

```
默认页面、登陆相关页面、注册相关页面放行不拦截
  role：1为普通用户  2为管理员
  获取session判断是否是管理员访问，管理员访问管理员相关页面就放行，普通用户访问管理员相关页面就拦截并输出forbidden
  用户没登录，去访问除了注册页面的任意页面都会跳回到登陆页面
```



## 5. 导入数据库时需要修改resources下的db.properties文件的账号和密码（对应你的mysql中的账户和密码）

```
db.username=你的账号
db.password=你的密码
db.url=jdbc:mysql:///meeting?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai
```



## 6.涉及到的技术点：

- Spring
- SpringMVC
- MyBatis
- Freemarker
- jQuery+Ajax
- MySQL
