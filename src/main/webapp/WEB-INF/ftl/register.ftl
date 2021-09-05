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
            人员管理 > 员工注册
        </div>
        <form action="/doReg" method="post">
            <fieldset>
                <legend>员工信息</legend>
                <div style="color:red;">${error!''}</div>
                <table class="formtable" style="width:50%">
                    <tr>
                        <td>姓名：</td>
                        <td>
                            <input name="employeeName" type="text"
                                   value="<#if employee??>${employee.employeeName}</#if>" id="employeename"
                                   maxlength="20"/>
                        </td>
                    </tr>
                    <tr>
                        <td>账户名：</td>
                        <td>
                            <input name="username" type="text" value="<#if employee??>${employee.username}</#if>"
                                   id="accountname"
                                   maxlength="20"/>
                        </td>
                    </tr>
                    <tr>
                        <td>密码：</td>
                        <td>
                            <input name="password" type="password" id="password" maxlength="20"
                                   placeholder="请输入6位以上的密码"/>
                        </td>
                    </tr>
                    <tr>
                        <td>确认密码：</td>
                        <td>
                            <input type="password" id="confirm" maxlength="20" onchange="check()"/>
                            <div style="color: red" id="confirmInfo"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>联系电话：</td>
                        <td>
                            <input name="phone" type="text" value="<#if employee??>${employee.phone}</#if>" id="phone"
                                   maxlength="20"/>
                        </td>
                    </tr>
                    <tr>
                        <td>电子邮件：</td>
                        <td>
                            <input name="email" type="text" value="<#if employee??>${employee.email}</#if>" id="email"
                                   maxlength="20"/>
                        </td>
                    </tr>
                    <tr>
                    <td>所在部门：</td>
                    <td>
                        <select name="departmentId">
                            <#if deps??>
                                <#list deps as dep>
                                    <option value="${dep.departmentId}">${dep.departmentName}</option>
                                </#list>
                            </#if>
                        </select>
                    </td>
                    </tr>

                    <tr>
                        <td colspan="6" class="command">
                            <input type="submit" class="clickbutton" value="注册"/>
                            <input type="reset" class="clickbutton" value="重置"/>
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

<script>
    function check() {
        var password = document.getElementById('password');
        var confirm = document.getElementById('confirm');
        var confirmInfo = document.getElementById('confirmInfo');
        if (password.value != confirm.value) {
            confirmInfo.innerHTML = '两次输入密码不一致';
        } else {
            confirmInfo.innerHTML = '';
        }
    }
</script>

</body>
</html>