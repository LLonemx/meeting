<!DOCTYPE html>
<html>
<head>
    <title>Meeting会议管理系统</title>
    <link href="/styles/common.css" rel="stylesheet"/>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.js"></script>
    <script src="/My97DatePicker/WdatePicker.js"></script>
    <style type="text/css">

    </style>
</head>
<body>
<#include 'top.ftl'>
<div class="page-body">
    <#include 'leftMenu.ftl'>
    <div class="page-content">
        <div class="content-nav">
            会议预定 > 搜索会议
        </div>
        <form action="/searchmeetings" method="post">
            <fieldset>
                <legend>搜索会议</legend>
                <table class="formtable">
                    <tr>
                        <td>会议名称：</td>
                        <td>
                            <input type="text" name="meetingname" id="meetingname"
                                   value="<#if meetingDTO??>${meetingDTO.meetingname!''}</#if>" maxlength="20"/>
                        </td>
                        <td>会议室名称：</td>
                        <td>
                            <input type="text" name="roomname" id="roomname"
                                   value="<#if meetingDTO??>${meetingDTO.roomname!''}</#if>" maxlength="20"/>
                        </td>
                        <td>预定者姓名：</td>
                        <td>
                            <input type="text" name="reservationistname" id="reservationistname"
                                   value="<#if meetingDTO??>${meetingDTO.reservationistname!''}</#if>" maxlength="20"/>
                        </td>
                    </tr>
                    <tr>
                        <td>预定日期：</td>
                        <td colspan="6">
                            在&nbsp;<input class="Wdate" type="text" name="reservationtime" id="reservationtime"
                                          value="<#if meetingDTO??>${(meetingDTO.reservationtime?string('yyyy-MM-dd HH:mm:ss'))!''}</#if>"
                                          onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>以后
                        </td>
                    </tr>
                    <tr>
                        <td>会议日期：</td>
                        <td colspan="6">
                            从&nbsp; <input class="Wdate" type="text" id="starttime" name="starttime"
                                           value="<#if meetingDTO??>${(meetingDTO.starttime?string('yyyy-MM-dd HH:mm:ss'))!''}</#if>"
                                           onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
                            到&nbsp;<input class="Wdate" type="text" id="endtime" name="endtime"
                                          value="<#if meetingDTO??>${(meetingDTO.endtime?string('yyyy-MM-dd HH:mm:ss'))!''}</#if>"
                                          onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6" class="command">
                            <input type="submit" class="clickbutton" value="查询"/>
                            <input type="reset" class="clickbutton" value="重置"/>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </form>
        <div>
            <h3 style="text-align:center;color:#000000">查询结果</h3>
            <div class="pager-header">
                <div class="header-info">
                    共<span class="info-number">${total}</span>条结果，
                    分成<span class="info-number">${pagenum}</span>页显示，
                    当前第<span class="info-number">${page}</span>页
                </div>
                <div class="header-nav">
                    <a type="button" class="clickbutton" href="/searchmeetings?&page=1">首页</a>
                    <a type="button" class="clickbutton"
                       href="/searchmeetings?page=${page-1}">上页</a>
                    <a type="button" class="clickbutton"
                       href="/searchmeetings?page=${page+1}">下页</a>
                    <a type="button" class="clickbutton"
                       href="/searchmeetings?page=${pagenum}">末页</a>
                    <form action="" style="display: inline" method="get">
                        跳到第<input name="page" type="text" id="pagenum" class="nav-number"/>页
                        <input type="submit" class="clickbutton" value="跳转"/>
                    </form>
                </div>
            </div>
        </div>
        <table class="listtable">
            <tr class="listheader">
                <th>会议名称</th>
                <th>会议室名称</th>
                <th>会议开始时间</th>
                <th>会议结束时间</th>
                <th>会议预定时间</th>
                <th>预定者</th>
                <th>操作</th>
            </tr>
            <#if meetings??>
                <#list meetings as m>
                    <tr>
                        <td>${m.meetingname}</td>
                        <td>${m.roomname}</td>
                        <td>${m.starttime?string('yyyy-MM-dd HH:mm:ss')}</td>
                        <td>${m.endtime?string('yyyy-MM-dd HH:mm:ss')}</td>
                        <td>${m.reservationtime?string('yyyy-MM-dd HH:mm:ss')}</td>
                        <td>${m.reservationistname}</td>
                        <td>
                            <a class="clickbutton" href="/meetingdetails?meetingid=${m.meetingid}">查看详情</a>
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