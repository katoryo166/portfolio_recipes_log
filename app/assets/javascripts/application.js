// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require activestorage
//= require_tree .
//= require cocoon
/*global $*/

/*スムーススクロール*/
$("turbolinks:load",function(){
        var pagetop = $('#page_top');
        // ボタン非表示
        pagetop.hide();

        // 100px スクロールしたらボタン表示
        $(window).scroll(function () {
           if ($(this).scrollTop() > 200) {
                pagetop.fadeIn();
           } else {
                pagetop.fadeOut();
           }
        });
        pagetop.click(function () {
           $('body, html').animate({ scrollTop: 0 }, 500);
           return false;
        });
      });

/*about slick*/
$("turbolinks:load", function() {
    $('.slide').slick({
       dots: true,
       autoplay: true,
       autoplaySpeed: 5000,
     });
    });



var pics_src = new Array("images/bird_img.gif", "images/bird.02_img.gif");
              var num = -1;

              slideshow_timer();

              function slideshow_timer(){
                  if (num == 1){
                      num = 0;
                  }
                  else {
                      num ++;
                  }
                  document.getElementById("mypic").src=pics_src[num];
                  setTimeout("slideshow_timer()",3000);
              }
