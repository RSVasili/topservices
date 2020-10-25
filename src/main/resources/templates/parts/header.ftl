<#macro header_top path>
    <div class="header__top">
        <div class="container">
            <div class="header__top-inner">
                <div class="header__information">
                    <a class="header__contacts" href="#">Контакты</a>
                    <a class="header__about" href="#">О нас</a>
                    <a class="header__lot-manager" href="#">Lot Manager</a>
                    <a class="header__user-manager" href=${path}>User Manager</a>
                </div>
                <div class="header__control">
                    <a class="header__account" href="#">Мой аккаунт</a>
                    <a class="header__wishlist" href="#">Список желаемого</a>
                    <a class="header__singup" href="#">Разместить лот</a>
                    <a class="header__basket" href="#"><em>2</em> order's</a>
                </div>
            </div>
        </div>
    </div>
</#macro>

<#macro header__content>
    <div class="header__content">
        <div class="container">
            <div class="header__content-inner">
                <div class="header__logo">
                    <a href="#">
                        <img src="/static/img/logo.svg" alt="картинка логотипа">
                    </a>
                </div>
                <form class="header__search">
                    <div class="header__search-wrapper">
                        <input class="header__search-input" type="text" placeholder="Введите название">
                    </div>
                    <div class="header__search-dropdown">

                        <div data-select class="header__select">
                            <div data-select-title class="header__select-title">
                                Категории услуг
                            </div>

                            <ul class="header__select-dropdown hidden">
                                <li data-select-item="Строительные" class="header__select-dropdown-item">
                                    Строительные
                                </li>
                                <li data-select-item="Интерьер и дизайн" class="header__select-dropdown-item">
                                    Интерьер и дизайн
                                </li>
                                <li data-select-item="Транпортные" class="header__select-dropdown-item">
                                    Транпортные
                                </li>
                                <li data-select-item="Компьютерные" class="header__select-dropdown-item">
                                    Компьютерные
                                </li>
                                <li data-select-item="Образовательные" class="header__select-dropdown-item">
                                    Образовательные
                                </li>
                                <li data-select-item="Юридические" class="header__select-dropdown-item">
                                    Юридические
                                </li>
                            </ul>

                            <select class="hidden" name="" id="selectReal">
                                <option value="none">Категория услуг</option>
                                <option value="Строительные">Строительные</option>
                                <option value="Интерьер и дизайн">Интерьер и дизайн</option>
                                <option value="Транпортные">Транпортные</option>
                                <option value="Компьютерные">Компьютерные</option>
                                <option value="Образовательные">Образовательные</option>
                                <option value="Юридические">Юридические</option>
                            </select>
                        </div>
                    </div>
                    <div class="header__search-button-wrapper">
                        <button class="header__search-button" type="submit" value="Поиск"></button>
                    </div>
                </form>
                <div class="menu">
                    <ul>
                        <!-- <li class="header__search-icon"><a href="#"></a></li> -->
                        <li><a href="/home">Главная</a></li>
                        <li><a href="#">Новости</a></li>
                        <li><a href="#">Площадка</a></li>
                        <!-- <li class="header__catalog"><a class="click__menu" href="#">Каталог</a></li> -->
                        <li><a href="#">Хиты</a></li>
                        <!-- <li class="header__basket"><a href="#"><i class="fa fa-icon-cart"></i>(0)</a></li> -->
                    </ul>
                    <div class="main__menu">
                        <ul>
                            <li class="sub__menu-first"><a href="#">Строительные услуги</a>
                                <ul>
                                    <li><a href="#">Услуги специалистов</a></li>
                                    <li><a href="#">Архитектурные услуги</a></li>
                                    <li><a href="#">Аренда инструмента\мелкой техники</a></li>
                                </ul>
                            </li>
                            <li class="sub__menu-second"><a href="#">Интерьер и дизайн</a>
                                <ul>
                                    <li><a href="#">Дизайн помещения\мебели</a></li>
                                    <li><a href="#">Изготовление\ремонт мягкой мебели</a></li>
                                    <li><a href="#">Изготовление\ремонт корпусной мебели</a></li>
                                </ul>
                            </li>
                            <li class="sub__menu-third"><a href="#">Транпортные услуги</a>
                                <ul>
                                    <li><a href="#">Грузовые\пассажирские перевозки</a></li>
                                    <li><a href="#">Аренда транспортных средств</a></li>
                                    <li><a href="#">Ремонт транспортных средств</a></li>
                                </ul>
                            </li>
                            <li class="sub__menu-fourth"><a href="#">Компьютерные услуги</a>
                                <ul>
                                    <li><a href="#">Ремонт и обслуживание ПК\ноутбуков</a></li>
                                    <li><a href="#">Сетевые работы</a></li>
                                    <li><a href="#">IT услуги</a></li>
                                </ul>
                            </li>
                            <li class="sub__menu-fifth"><a href="#">Образовательные услуги</a>
                                <ul>
                                    <li><a href="#">Репетиторские услуги</a></li>
                                    <li><a href="#">Обучающие курсы</a></li>
                                    <li><a href="#">Помощь в подготовке работ</a></li>
                                </ul>
                            </li>
                            <li class="sub__menu-sixth"><a href="#">Юридические услуги</a>
                                <ul>
                                    <li><a href="#">Поиск\предложения специалиста</a></li>
                                    <li><a href="#">Оформление\создание документов</a></li>
                                    <li><a href="#">Консультационнные услуги</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </div>
</#macro>

<#macro login__menu>
    <div class="login__menu">
        <div class="container">
            <div class="login__header-inner">
                <div class="login__header-item">
                    <#nested>
                </div>
            </div>
        </div>
    </div>
</#macro>