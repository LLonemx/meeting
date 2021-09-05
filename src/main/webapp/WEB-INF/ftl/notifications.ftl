<!DOCTYPE html>
<html>
<head>
    <title>Meeting会议管理系统</title>
    <link rel="stylesheet" href="/styles/common.css"/>
</head>
<body>
<#include 'top.ftl'>
<div class="page-body">
    <#include 'leftMenu.ftl'>
    <div class="page-content">
        <div class="content-nav">
            个人中心 > <a href="/notifications">最新通知</a>
        </div>
        <table class="listtable">
            <caption>
                未来7天我要参加的会议:
            </caption>
            <tr class="listheader">
                <th style="width:300px">会议名称</th>
                <th>会议室</th>
                <th>起始时间</th>
                <th>结束时间</th>
                <th style="width:100px">操作</th>
            </tr>
            <#if ms??>
                <#list ms as m>
                    <tr>
                        <td>${m.meetingname}</td>
                        <td>${m.roomname}</td>
                        <td>${m.starttime?string('yyyy-MM-dd HH:mm:ss')}</td>
                        <td>${m.endtime?string('yyyy-MM-dd HH:mm:ss')}</td>
                        <td>
                            <a class="clickbutton" href="/meetingdetails?meetingid=${m.meetingid}">查看详情</a>
                        </td>
                    </tr>
                </#list>
            <#else>
                <tr>未来七天不需要参加会议</tr>
            </#if>
        </table>
        <table class="listtable">
            <caption>
                已取消的会议:
            </caption>
            <tr class="listheader">
                <th style="width:300px">会议名称</th>
                <th>会议室</th>
                <th>起始时间</th>
                <th>结束时间</th>
                <th>取消原因</th>
                <th style="width:100px">操作</th>
            </tr>
            <#if cms??>
                <#list cms as cm>
                    <tr>
                        <td>${cm.meetingname}</td>
                        <td>${cm.roomname}</td>
                        <td>${cm.starttime?string('yyyy-MM-dd HH:mm:ss')}</td>
                        <td>${cm.endtime?string('yyyy-MM-dd HH:mm:ss')}</td>
                        <td>${cm.canceledreason!"没理由"}</td>
                        <td>
                            <a class="clickbutton" href="/meetingdetails?meetingid=${cm.meetingid}">查看详情</a>
                        </td>
                    </tr>
                </#list>
            <#else>
                <tr>没有取消的会议</tr>
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