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
import "./preview"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(document).on('turbolinks:load', function(){
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

$(document).on("turbolinks:load", function () {
  $(".post_plamo_plamo_images").on("change", function (e) {
    var files = e.target.files;
    var d = new $.Deferred().resolve();
    $.each(files, function (i, file) {
      d = d.then(function () {
        return previewImage(file);
      });
    });
  });

  var previewImage = function (imageFile) {
    var reader = new FileReader();
    var img = new Image();
    var def = $.Deferred();
    reader.onload = function (e) {
      // 画像を表示
      $("#image_preview").empty();
      $("#image_preview").append(img);
      img.src = e.target.result;
      def.resolve(img);
    };
    reader.readAsDataURL(imageFile);
    return def.promise();
  };
});