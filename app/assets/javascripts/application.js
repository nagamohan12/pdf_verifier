// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks

//= require bootstrap

//= require moment
//= require bootstrap-datetimepicker
//= require_tree .


$(function() {

    $(".bs-example-modal-lg").on("show.bs.modal", function() {
      $(".modal .modal-content").css("overflow-y", "auto");
      $(".modal .modal-content").css("height", screen.height * 0.77);
    });

    $(".bs-example-modal-lg").on("hidden.bs.modal", function(e) {
      return $(this).removeData('bs.modal');
    });

    return $(".panel").on("show.bs.collapse", function(e) {
      return console.log('Event fired on #' + e.currentTarget.id);
    });
});