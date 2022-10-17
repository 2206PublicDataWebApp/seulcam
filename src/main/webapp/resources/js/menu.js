$(document).ready(function () {

    $('.more-btn').click(function() {
        $(this).toggleClass('active'); //클릭할때마다 active 클래스 넣었다 뺏다
        $('.main-navigation').toggleClass('active');
    })
})

$(document).ready(function () {

    $('.main-menu').click(function() {
        $(this).toggleClass('active');
    })
})
