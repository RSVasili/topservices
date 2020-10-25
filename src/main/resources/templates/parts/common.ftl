<#macro page>
<!DOCTYPE html>
<html lang="en">
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TopService</title>
    <link href="https://fonts.googleapis.com/css?family=PT+Serif:400,700|Roboto:400,500&amp;subset=cyrillic"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;1,700&display=swap"
          rel="stylesheet">


    <link rel="stylesheet" href="/static/css/normalize.css">
    <link rel="stylesheet" href="/static/css/fonts.css">
    <link rel="stylesheet" href="/static/css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="/static/css/slick.css">
    <link rel="stylesheet" type="text/css" href="/static/css/style.css">

</head>
<body>
<#nested>
</body>
</html>
</#macro>

<#macro header>
    <header class="header">
        <#nested>
    </header>
</#macro>

<#macro otherHeader>
    <header class="other__header">
        <#nested>
    </header>
</#macro>

<#macro loginHeader>
    <header class="login__header">
        <#nested>
    </header>
</#macro>

<#macro footer>
    <footer class="footer">
        <div class="footer__content">
            <div class="container">
                <div class="footer__menu-inner">
                    <div class="footer__menu-item">
                        <div class="footer__menu-name">
                            Наши Контакты
                        </div>
                        <ul class="footer__contact-list">
                            <li class="footer__address">
                                <a
                                        href="https://www.google.com/search?q=%D0%A0%D0%B5%D1%81%D0%BF%D1%83%D0%B1%D0%BB%D0%B8%D0%BA%D0%B0+%D0%91%D0%B5%D0%BB%D0%B0%D1%80%D1%83%D1%81%D1%8C%2C+%D0%B3.%D0%92%D0%B8%D1%82%D0%B5%D0%B1%D1%81%D0%BA+%D1%83%D0%BB.%D0%9B%D0%B5%D0%BD%D0%B8%D0%BD%D0%B0+13+%D0%BE%D1%84.666&oq=%D0%A0%D0%B5%D1%81%D0%BF%D1%83%D0%B1%D0%BB%D0%B8%D0%BA%D0%B0+%D0%91%D0%B5%D0%BB%D0%B0%D1%80%D1%83%D1%81%D1%8C%2C+%D0%B3.%D0%92%D0%B8%D1%82%D0%B5%D0%B1%D1%81%D0%BA+%D1%83%D0%BB.%D0%9B%D0%B5%D0%BD%D0%B8%D0%BD%D0%B0+13+%D0%BE%D1%84.666&aqs=chrome..69i57.1002j0j1&sourceid=chrome&ie=UTF-8#">Республика
                                    Беларусь, г.Витебск ул.Ленина 13 оф.666</a>
                            </li>
                            <li class="footer__phone">
                                <a href="tel:375297556844">+375 (29) 755 68 44</a>
                                <a href="tel:375447559844">+375 (44) 755 98 44</a>
                            </li>
                            <li class="footer__mail">
                                <a href="#">Topservice@gmail.com</a>
                                <a href="#">Topservice@outlook.com</a>
                            </li>
                        </ul>
                    </div>
                    <div class="footer__menu-item">
                        <div class="footer__menu-name">
                            Моя страница
                        </div>
                        <ul class="footer__menu-list">
                            <li><a href="#">Моя страница</a></li>
                            <li><a href="#">Список желаемого</a></li>
                            <li><a href="#">Лоты к оплате</a></li>
                            <li><a href="#">Платёжная информация</a></li>
                            <li><a href="#">Мои адреса</a></li>
                        </ul>
                    </div>
                    <div class="footer__menu-item">
                        <div class="footer__menu-name">
                            Нашим посетителям
                        </div>
                        <ul class="footer__menu-list">
                            <li><a href="#">Наши контакты</a></li>
                            <li><a href="#">Отзывы о нас</a></li>
                            <li><a href="#">Наши правила</a></li>
                            <li><a href="#">Карта площадки</a></li>
                            <li><a href="#">Подарочные сертификаты</a></li>
                        </ul>
                    </div>
                    <div class="footer__menu-item">
                        <div class="footer__menu-name">
                            Новостная рассылка
                        </div>
                        <div class="footer__menu-text">
                            Подписывайтесь на рассылку и будьте вкурсе всех акций, новостей компании, а так статусах
                            ваших лотов и лотов из списка желаемого
                        </div>
                        <form class="default-form" action="#" method="post">
                            <label>
                                <input class="default-input" type="text" name="email" placeholder="Введите ваш email">
                            </label>
                            <input class="default-submit" type="submit" value="Подписаться">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer__copy">
            <div class="container">
                <div class="copy__text">
                    © 2019 Template by TopService Devitems. All Rights Reserved.
                </div>
            </div>
        </div>
    </footer>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="/static/js/slick.min.js"></script>
    <script src="/static/js/click.main.js"></script>
    <script src="/static/js/main.js"></script>
</#macro>



