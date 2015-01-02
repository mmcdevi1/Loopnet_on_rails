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
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery.cookie
//= require bootstrap
//= require bootstrap-wysihtml5
//= require app
//= require chat
//= require users
//= require private_pub
//= require jquery.slimscroll.min
//= require js-routes
//= require deals.js
//= require touchship
//= require app.plugin
//= require_self
//= require turbolinks

$(document).ready(function() {

	setTimeout(function () {
		$('#alert-fadeout').fadeOut('slow');
	}, 1000);
	
 

});
