// const selectAllElements = document.querySelectorAll("[data-select]");

// selectAllElements.forEach(function (item) {
//     item.addEventListener("click", function () {
//         const realSelect = this.nextElementSibling;
//         // Если кликнули по пунктам в dropdown 
//         if (event.target.hasAttribute("data-select-item")) {
//             // нашли заголовок у данного dropdown и  записали в него такстовое наполнение из data атрибута data-select-item
//             var itemTitle = event.target.getAttribute("data-select-item")
//             this.querySelector("[data-select-title]").textContent = event.target.getAttribute("data-select-item");
//             // после выбора скрываем dropdown
//             this.querySelector(".header__select-dropdown").classList.toggle("hidden");

//             // изменяем значение "value" у реального селекта
//             if (realSelect) {
//                 realSelect.value = itemTitle;
//             }


//         } else {
//             // Если кликнули по заголовкам (..title) 
//             // скрываем или открываем dropdown
//             this.querySelector(".header__select-dropdown").classList.toggle("hidden");
//         }

//     });
// });


// меню поиска dropdown
// находим контейнер с селектом
const selectElement = document.querySelector("[data-select]");
// находим реальный селект
const selectReal = document.querySelector("#selectReal");
// прослушиваем клик внутри контейнера с селектом
selectElement.addEventListener("click", function (event) {
    // проверка где произошёл клик
    // event.target -показывает на каком именно HTML произошёл клик
    // Если кликнули по пункту внутри dropdown
    if (event.target.hasAttribute("data-select-item")) {

        // получаем значение из атрибута data-select-item у этого элемента
        const itemTitle = event.target.getAttribute("data-select-item");

        // находим заголовок главного элемента и меняем его текст на значение из выбранного пункта
        event.target.closest("[data-select]").querySelector("[data-select-title]").textContent = itemTitle;
        // после выбора скрываем dropdown
        event.target.closest("[data-select]").querySelector(".header__select-dropdown").classList.toggle("hidden");

        // изменяем значение "value" у реального селекта
        selectReal.value = itemTitle;
    } else {
        // иначе клик произошёл по другому месту блока "header__select-dropdown", 
        // dropdown разворачивается или сворачивается
        this.querySelector(".header__select-dropdown").classList.toggle("hidden");
        console.log("Click on TITLE and AROUND");

    }

});

// меню каталога
$(".click__menu").click(function (_menu) {
    $(".main__menu").fadeIn({
        duration: 300,
        easing: "linear",
    })

    $(document).mouseup(function (_menu) { // событие клика по веб-документу
        var div = $(".main__menu"); // тут указываем ID элемента
        if (!div.is(_menu.target) // если клик был не по нашему блоку
            && div.has(_menu.target).length === 0) { // и не по его дочерним элементам
            div.fadeOut(); // скрываем его
        }

    });


});

