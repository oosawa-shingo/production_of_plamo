// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";

Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(function() {
  $('.slider').slick({
    slidesToShow: 1,
    dots: true,
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