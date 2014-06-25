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
//= require_tree .
function validate()
	{
    var fname= document.getElementById("contact_firstname").value;
    var lname=document.getElementById("contact_lastname").value;
    var email=document.getElementById("contact_email").value;
    var gen=document.getElementById("contact_gender").value;
	if(fname == "")
	{
		alert("firstname cannot be empty");
		return false;
	}
	if(lname == "")
	{
		alert("lastname cannot be empty");
		return false;
	}
	if(email == "")
	{
		alert("email cannot be empty");
		return false;
	}
	if(gen == "")
	{
		alert("please mention your gender");
		return false;
	}
	

	}