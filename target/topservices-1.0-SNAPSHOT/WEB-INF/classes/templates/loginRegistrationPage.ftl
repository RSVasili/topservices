<#import "parts/common.ftl" as common>
<#import "parts/header.ftl" as header>
<@common.page>
    <@common.loginHeader>
        <@header.header_top "/users"/>
        <@header.header__content/>
        <@header.login__menu>
            <div class="login__header-title">
                Вход\Регистрация
            </div>
            <div class="login__header-information">
                <a class="login__home" href="/home">Главная</a>
                <div class="login__label">Вход\Регистрация</div>
            </div>
        </@header.login__menu>
    </@common.loginHeader>
    <section class="login__registration">
        <div class="container">
            <div class="login__registration-inner">
                <div class="login__registration-item">
                    <div class="login__registration-title">
                        Войти
                    </div>
                    <div class="login__registration-text">
                        Здравствуйте, Добро пожаловать.
                    </div>
                    <div class="login__registration-social">
                        <a href="#" class="login__registration-facebook">Sign In With Facebook</a>
                        <a href="#" class="login__registration-vkontakte">Sign In With VKontakte</a>
                    </div>
                    <div class="login__registration-entry">
                        <form class="login__registration-form" action="login.html">
                            <label class="form__label" for="login">Имя пользователя<em>*</em>
                                <input class="default-input" id="login" type="text" name="login"
                                       placeholder="Введите ваш email"></label>
                            <label class="form__label" for="password">Пароль<em>*</em>
                                <input class="default-input" id="password" type="password" name="password"
                                       placeholder="Введите ваш password"></label>
                            <div class="login__registration-memory">

                                <div class="default__checkbox">
                                    <label class="custom-checkbox" for="check">
                                        <input type="checkbox" id="check" name="rememberme" value="rememberme">
                                        <span>Запомнить меня</span>
                                    </label>
                                </div>

                                <a href="#" class="forget__password">Забыли ваш пароль?</a>

                            </div>
                            <div class="login__button">
                                <input class="default-submit" type="submit" value="Войти">
                            </div>
                        </form>
                    </div>
                </div>
                <div class="login__registration-item">
                    <div class="login__registration-title">
                        Создать новый аккаунт
                    </div>
                    <div class="login__registration-text">
                        Здравствуйте, Добро пожаловать на нашу площадку. Для получения всего доступного функционала давайте
                        пройдём простую процедуру регистрации
                    </div>
                    <form class="login__registration-form" action="/addUser" method="post">
                        <label class="form__label" for="login">Имя пользователя<em>*</em>
                            <input class="default-input" title="login" type="text" name="login"
                                   placeholder="Введите ваш Login"></label>
                        <label class="form__label" for="email">Email пользователя<em>*</em>
                            <input class="default-input" id="email" type="text" name="email"
                                   placeholder="Введите ваш email"></label>
                        <label class="form__label" for="password">Введите пароль<em>*</em>
                            <input class="default-input" id="password" type="password" name="password"
                                   placeholder="Введите ваш password"></label>
<#--                        <label class="form__label" for="password">Введите пароль ещё раз<em>*</em>-->
<#--                            <input class="default-input" id="password" type="password" name="password"-->
<#--                                   placeholder="Введите ваш password"></label>-->
                        <div class="login__button">
                            <input class="default-submit" type="submit" value="Зарегистрироваться">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <@common.footer/>
</@common.page>