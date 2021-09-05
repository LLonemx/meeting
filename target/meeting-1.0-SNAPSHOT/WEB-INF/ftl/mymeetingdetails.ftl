<!DOCTYPE html>
<html>
<head>
    <title>Meeting会议管理系统</title>
    <link href="/styles/common.css" rel="stylesheet"/>


</head>
<body onload="body_load()">
<#include 'top.ftl'>
<div class="page-body">
    <#include 'leftMenu.ftl'>
    <div class="page-content">
        <div class="content-nav">
            会议预定 > 修改会议预定
        </div>
        <form action="/cancelmeeting" method="get">
            <fieldset>
                <legend>会议信息</legend>
                <table class="formtable">
                    <#if meeting??>
                        <tr>
                            <td>会议名称：</td>
                            <td>${meeting.meetingname}</td>
                        </tr>
                        <tr>
                            <td>预计参加人数：</td>
                            <td>${meeting.numberofparticipants}</td>
                        </tr>
                        <tr>
                            <td>预计开始时间：</td>
                            <td>${meeting.starttime?string('yyyy-MM-dd HH:mm:ss')}</td>
                        </tr>
                        <tr>
                            <td>预计结束时间：</td>
                            <td>${meeting.endtime?string('yyyy-MM-dd HH:mm:ss')}</td>
                        </tr>
                        <tr>
                            <td>会议说明：</td>
                            <td>
                                <textarea id="description" rows="5" readonly>${meeting.description!'NO'}</textarea>
                            </td>
                        </tr>

                    </#if>
                    <tr>
                        <td>参会人员：</td>
                        <td>
                            <table class="listtable">
                                <tr class="listheader">
                                    <th>姓名</th>
                                    <th>联系电话</th>
                                    <td>电子邮件</td>
                                </tr>
                                <#if ems??>
                                    <#list ems as e>
                                        <tr>
                                            <td>${e.employeeName}</td>
                                            <td>${e.phone!"空"}</td>
                                            <td>${e.email!"空"}</td>
                                        </tr>
                                    </#list>
                                </#if>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="command" colspan="4">
                            <input name="meetingid" type="hidden" value="${meeting.meetingid}"/>
                            <input name="meetingname" type="hidden" value="${meeting.meetingname}"/>
                            <input type="submit" class="clickbutton" value="撤销会议"/>
                            <input type="button" class="clickbutton" value="返回" onclick="window.history.back();"/>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </form>
    </div>
</div>
<div class="page-footer">
    <hr/>
    更多问题，欢迎联系<a href="mailto:578173534@qq.com">管理员</a>
    <img src="/images/footer.png" alt="Meeting"/>
</div>
</body>
</html>