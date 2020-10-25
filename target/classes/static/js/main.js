$(function () {

    $(".slider__inner, .news__slider-inner").slick({
        nextArrow: '<button type="button" class="slick-buttom slick-next"></button>',
        prevArrow: '<button type="button" class="slick-buttom slick-prev"></button>',
        infinite: false,
        speed: 600,
        fade: true,
        cssEase: 'linear'
    });

    

    $(".hot__slider-inner").slick({
        nextArrow: '<button type="button" class="slick-buttom slick-next"></button>',
        prevArrow: '<button type="button" class="slick-buttom slick-prev"></button>',
        // dots: true,
        infinite: false,
        speed: 600,
        cssEase: 'linear',
        slidesToShow: 4
    });


});



