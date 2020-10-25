<#import "parts/common.ftl" as common>
<#import "parts/header.ftl" as header>
<@common.page>
    <@common.otherHeader>
        <@header.header_top "/users"/>
        <@header.header__content/>
        <@header.login__menu>
            <div class="login__header-title">
                Меню Пользователей
            </div>
            <div class="login__header-information">
                <a class="login__home" href="/home">Главная</a>
                <div class="login__label">Пользователи</div>
            </div>
        </@header.login__menu>
    </@common.otherHeader>

    <table>
        <tr>
            <th>Id</th>
            <th>Login</th>
<#--            <th>Password</th>-->
            <th>Email</th>
<#--            <th>Action</th>-->
            <th>Role</th>
        </tr>
        <#list users as user>
            <tr>
                <td><a class="login__home" href="/user/${user.id}">${user.id}</a></td>
                <td>${user.login}</td>
                <td>${user.email}</td>
                <#--                <td>${user.password}</td>-->
                <#--                <td>${user.action}</td>-->
                <td>${user.role}</td>
                <td><a class="login__button" href="/update/${user.id}">
                        <input class="default-submit" type="submit" value="Редактировать">
                    </a></td>

                <td><a class="login__button" href="/delete/${user.id}">
                        <input class="default-submit" type="submit" value="Удалить">
                    </a></td>
            </tr>
        </#list>
    </table>
    <a class="login__button" href="/addUser">
        <input class="default-submit" type="submit" value="Создать пользователя">
    </a>
    <@common.footer/>
</@common.page>