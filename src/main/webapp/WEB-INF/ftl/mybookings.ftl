<!DOCTYPE html>
<html>
<head>
    <title>Meeting会议管理系统</title>
    <link rel="stylesheet" href="/styles/common.css"/>
    <style type="text/css">

    </style>
</head>
<body>
<#include 'top.ftl'>
<div class="page-body">
    <#include 'leftMenu.ftl'>
    <div class="page-content">
        <div class="content-nav">
            个人中心 > 我的预定
        </div>
        <table class="listtable">
            <caption>我预定的会议：</caption>
            <tr class="listheader">
                <th>会议名称</th>
                <th>会议室名称</th>
                <th>会议开始时间</th>
                <th>会议结束时间</th>
                <th>会议预定时间</th>
                <th>操作</th>
            </tr>
            <#if mlist??>
                <#list mlist as m >
                    <tr>
                        <td>${m.meetingname}</td>
                        <td>${m.roomname}</td>
                        <td>${m.starttime?string('yyyy-MM-dd HH:mm:ss')}</td>
                        <td>${m.endtime?string('yyyy-MM-dd HH:mm:ss')}</td>
                        <td>${m.reservationtime?string('yyyy-MM-dd HH:mm:ss')}</td>
                        <td>
                            <a class="clickbutton" href="/mymeetingdetails?meetingid=${m.meetingid}">查看/撤销</a>
                        </td>
                    </tr>
                </#list>
            </#if>
        </table>
    </div>
</div>
<div class="page-footer">
    <hr/>
    更多问题，欢迎联系<a href="mailto:578173534@qq.com">管理员</a>
    <img src="/images/footer.png" alt="Meeting"/>
</div>
</body>
</html>