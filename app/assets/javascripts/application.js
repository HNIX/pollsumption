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
//= require bootstrap
//= require turbolinks
//= require cocoon
//= require jquery.validate
//= require chartkick
//= require plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown
//= require plugins/jquery-slimscroll/jquery.slimscroll
//= require plugins/jquery.blockui.min
//= require plugins/bootstrap-switch/js/bootstrap-switch
//= require scripts/app
//= require scripts/layout
//= require scripts/quick-sidebar
//= require plugins/jqvmap/jqvmap/jquery.vmap
//= require plugins/jqvmap/jqvmap/maps/jquery.vmap.usa
//= require plugins/counterup/jquery.counterup.min
//= require plugins/counterup/jquery.waypoints.min
//= require plugins/moment.min
//= require_tree .

$(function() {
  $('#sort-links a').on("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#polls_search input").keyup(function() {
    $.get($("#polls_search").attr("action"), $("#polls_search").serialize(), null, "script");
    return false;
  });
});





