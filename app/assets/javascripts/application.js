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
//= require jquery-ui
//= require jquery_ujs
//
//= require_self
//
//= require jss/jss
//= require when/when
//= require hamlcoffee
//
//= require underscore
//= require backbone-js/backbone
//
//= require markdown-js/lib/markdown
//
//= require spin-js/spin
//= require spin-js/jquery.spin
//
//= require backbone_rails_sync
//= require backbone_datalink
//
//= require backbone/ui_demo

window.define = function(factory) {
  try{ delete window.define; } catch(e){ window.define = void 0; } // IE
  window.when = factory();
};
window.define.amd = {};

