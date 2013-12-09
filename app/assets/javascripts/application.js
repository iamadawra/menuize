// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require bootstrap
//= require_tree
//= require jquery.purr
//= require on_the_spot

$(window).load(function(){
  $("input").keyup(function() {
    setTimeout(function(){
      $.get($("#restaurants_search").attr("action"), $("#restaurants_search").serialize(), null, "script");
    },0);
    return false;
  });
});

function remove_fields(link) {
    $(link).parent().next("br").remove();
    $(link).parent().remove();
    eventCancel(event);
}

function eventCancel(e) {
   if (!e)
     if (window.event) e = window.event;
     else return;
   if (e.cancelBubble != null) e.cancelBubble = true;
   if (e.stopPropagation) e.stopPropagation();
   if (e.preventDefault) e.preventDefault();
   if (window.event) e.returnValue = false;
   if (e.cancel != null) e.cancel = true;
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  content.replace(regexp, new_id);
  $(link).parent().before(content);
  eventCancel(event);
}
