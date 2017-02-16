//Add active class to current list item
$(function () {
    // this will get the full URL at the address bar
    var path = window.location.href;

    // passes on every "a" tag
    $("#CategoryMenu a").each(function () {
        var href = $(this).attr('href');
        href = href.replace(".aspx", "");
        if (path.indexOf(href) > -1) {
            $(this).addClass("active");
        }
    });
});