<!DOCTYPE html>
<html>
<head>
    <title>Meeting会议管理系统</title>
    <link href="/styles/common.css" rel="stylesheet"/>
</head>
<body>
<#include 'top.ftl'>
<div class="page-body">
    <#include 'leftMenu.ftl'>
    <div class="page-content">
        <div class="content-nav">
            修改密码
        </div>
        <form action="/dochange" method="post">
            <fieldset>
                <legend>修改密码信息</legend>
                <table class="formtable" style="width:50%">
                    <tr>
                        <td>账号:</td>
                        <td>
                            <input id="username" name="username" type="password"/>
                        </td>
                    </tr>
                    <tr>
                        <td>原密码:</td>
                        <td>
                            <input id="username" name="password" type="password"/>
                        </td>
                    </tr>
                    <tr>
                        <td>新密码:</td>
                        <td>
                            <input id="new" name="newpassword" type="password"/>
                        </td>
                    </tr>

                    <div style="color: #ff0114">${error!''}</div>

                    <tr>
                        <td colspan="2" class="command">
                            <input type="submit" value="确认修改" class="clickbutton"/>
                            <input type="button" value="返回" class="clickbutton" onclick="window.history.back();"/>
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