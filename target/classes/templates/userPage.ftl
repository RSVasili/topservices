<#import "parts/common.ftl" as common>
<#import "parts/header.ftl" as header>
<@common.page>
    <@common.otherHeader>
        <@header.header_top "/users"/>
        <@header.header__content/>
        <@header.login__menu>
            <div class="login__header-title">
               Данные Пользователя
            </div>
            <div class="login__header-information">
                <a class="login__home" href="/users">Назад</a>
                <div class="login__label">Пользователь</div>
            </div>
        </@header.login__menu>
    </@common.otherHeader>


        <form class="login__registration-form" action="/updateUser" method="post">
            <label class="form__label" for="id">Идентификатор пользователя<em>*</em>
                <input class="default-input" id="password" type="text" name="id" value="${user.id}"></label>

            <label class="form__label" for="login">Login пользователя<em>*</em>
                <input class="default-input" id="login" type="text" name="login" value="${user.login}"></label>

            <label class="form__label" for="email">Email пользователя<em>*</em>
                <input class="default-input" id="email" type="text" name="email" value="${user.email}"></label>

            <label class="form__label" for="password">Пароль пользователя<em>*</em>
                <input class="default-input" id="password" type="password" name="password" value="${user.password}"></label>

            <#--            &lt;#&ndash;                        <label class="form__label" for="password">Введите пароль ещё раз<em>*</em>&ndash;&gt;-->
            <#--            &lt;#&ndash;                            <input class="default-input" id="password" type="password" name="password"&ndash;&gt;-->
            <#--            &lt;#&ndash;                                   placeholder="Введите ваш password"></label>&ndash;&gt;-->

            <label class="form__label" for="role">Роль<em>*</em>
                <input class="default-input" id="role" type="text" name="role" value="${user.role}"></label>

            <div class="login__button">
                <input class="default-submit" type="submit" value="Сохранить">
            </div>
        </form>
<#--        <tr>-->
<#--            <td>Id</td>-->
<#--            <td>${user.id}</td>-->
<#--        </tr>-->
<#--        <tr>-->
<#--            <td>Login</td>-->
<#--            <td>${user.login}</td>-->
<#--        </tr>-->
<#--        <tr>-->
<#--            <td>Email</td>-->
<#--            <td>${user.email}</td>-->
<#--        </tr>-->
<#--        <tr>-->
<#--            <td>Password</td>-->
<#--            <td>${user.password}</td>-->
<#--        </tr>-->
<#--        <tr>-->
<#--            <td>Role</td>-->
<#--            <td>${user.role}</td>-->
<#--        </tr>-->

    <@common.footer/>
</@common.page>