import Rails from "@rails/ujs"
//import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";
import './preview';

Rails.start()
//Turbolinks.start()
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

  // $('.top-slider').slick({
  //   autoplay: true,
  //   autoplaySpeed: 3000,
  //   speed: 500,
  //   infinite: true,
  //   slidesToShow: 3,
  //   slidesToScroll: 1,
  //   centerMode: true,
  //   arrows: false,
  //   variableWidth: true,
  //   dots: false,
  // });

});