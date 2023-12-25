import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";
import './preview';

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

// $(document).on('turbolinks:load', function preview(elem, output = ''){
//   Array.from(elem.files).map((file) => {
//     const blobUrl = window.URL.createObjectURL(file)
//     output+=`<img src=${blobUrl}>`
//   })
//   elem.nextElementSibling.innerHTML = output
// });

// function imgPreView(event) {
//   var file = event.target.files[0];
//   var reader = new FileReader();
//   var preview = document.getElementById("preview");
//   var previewImage = document.getElementById("previewImage");

//   if(previewImage != null) {
//     preview.removeChild(previewImage);
//   }
//   reader.onload = function(event) {
//     var img = document.createElement("img");
//     img.setAttribute("src", reader.result);
//     img.setAttribute("id", "previewImage");
//     preview.appendChild(img);
//   };
//   reader.readAsDataURL(file);
// }