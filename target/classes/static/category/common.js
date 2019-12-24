$(function () {
    var cururl = location.href;
    var i = 0;
    var count = $(".caseTop").length;
    $(".caseTop").each(function(index) {
        var url = $(this).find("a").attr("href");
        if (url.length > 5 && cururl.substring(cururl.length - url.length).toUpperCase() == url.toUpperCase()) {
            $(this).addClass("hover");
            return;
        }
        i++;
    });
    if (i == count) {
        $(".hover:eq(0)").addClass("hover");
    }
});

/*  返回顶部  */
jQuery(document).ready(function ($) {
    $('#gotop').hide();
    $('#gotop').click(function () { $('html,body').animate({ scrollTop: '0px' }, 800); });
    $(window).scroll(function (event) {
        if ($.browser) {
            $('#gotop').css('top', $(this).scrollTop() + $(this).height() - 170);
        }
        if ($(this).scrollTop() > 260) {
            $('#gotop').fadeIn();
        } else {
            $('#gotop').fadeOut();
        }
    });
});

/*  判断移动端pc站  */
$(function(){  
    var MobileUA = (function() {  
        var ua = navigator.userAgent.toLowerCase();  
  
        var mua = {  
            IOS: /ipod|iphone|ipad/.test(ua), //iOS  
            IPHONE: /iphone/.test(ua), //iPhone  
            IPAD: /ipad/.test(ua), //iPad  
            ANDROID: /android/.test(ua), //Android Device  
            WINDOWS: /windows/.test(ua), //Windows Device  
            TOUCH_DEVICE: ('ontouchstart' in window) || /touch/.test(ua), //Touch Device  
            MOBILE: /mobile/.test(ua), //Mobile Device (iPad)  
            ANDROID_TABLET: false, //Android Tablet  
            WINDOWS_TABLET: false, //Windows Tablet  
            TABLET: false, //Tablet (iPad, Android, Windows)  
            SMART_PHONE: false //Smart Phone (iPhone, Android)  
        };  
  
        mua.ANDROID_TABLET = mua.ANDROID && !mua.MOBILE;  
        mua.WINDOWS_TABLET = mua.WINDOWS && /tablet/.test(ua);  
        mua.TABLET = mua.IPAD || mua.ANDROID_TABLET || mua.WINDOWS_TABLET;  
        mua.SMART_PHONE = mua.MOBILE && !mua.TABLET;  
  
        return mua;  
    }());  
  
    //SmartPhone   
    // if (MobileUA.SMART_PHONE) {
    //     // 移动端链接地址
    //     document.location.href = 'http://m.qinzhixuan.com/';
    // }
});  