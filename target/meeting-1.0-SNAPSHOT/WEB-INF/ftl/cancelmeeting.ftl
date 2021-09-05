<!DOCTYPE html>
<html>
<head>
    <title>Meeting会议管理系统</title>
    <link href="/styles/common.css" rel="stylesheet"/>
    <style type="text/css">


        #divoperator input[type="button"] {
            margin: 10px 0;
        }


    </style>

</head>
<body onload="body_load()">
<#include 'top.ftl'>
<div class="page-body">
    <#include 'leftMenu.ftl'>
    <div class="page-content">
        <div class="content-nav">
            会议预定 > 撤销会议预定
        </div>
        <form action="/dpCancel" method="post">
            <fieldset>
                <legend>撤销预定</legend>
                <table class="formtable">
                    <tr>
                        <td>会议名称：</td>
                        <td>${meetingname!"找不到,失败"}</td>
                    </tr>
                    <tr>
                        <td>撤销理由：</td>
                        <td><textarea name="canceledreason" id="canceledreason" rows="5"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="command" colspan="3">
                            <input name="meetingid" type="hidden" value="${meetingid}"/>
                            <input type="submit" class="clickbutton" value="确认撤销"/>
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