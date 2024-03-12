import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";
import './plamo-post-preview';
import './-post-preview';

Rails.start()
ActiveStorage.start()

// 画像のスライド機能
$(document).ready(function(){
  $('.slider').slick({
    slidesToShow: 1,
    dots: true,
    fade: true,
    prevArrow: '<div class="slick-prev"></div>',
		nextArrow: '<div class="slick-next"></div>',
		asNavFor: ".thumbnail",
  });

  $(".thumbnail").slick({
    slidesToShow: 8,
    asNavFor: ".slider",
    focusOnSelect: true,
  });

});