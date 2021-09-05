<div class="page-header">
    <div class="header-banner">
        <img src="/images/header.png" alt="Meeting"/>
    </div>
    <div class="header-title">
        欢迎访问Meeting会议管理系统
    </div>
    <div class="header-quicklink">
        欢迎您，
        <#if currentUser??>
            <#if currentUser.role==2>
                <strong>${currentUser.employeeName!''}-admin</strong>
            <#else >
                <strong>${currentUser.employeeName!''}</strong>
            </#if>
        </#if>
        <a href="/logout">[退出]</a>
        <a href="/changepassword">[修改密码]</a>
    </div>
</div>