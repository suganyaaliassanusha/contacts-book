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


	function ajaxfunction(firstname){
		var xmlhttp;
		var key;
       

		

		try{
			xmlhttp = new XMLHttpRequest();
		}
		catch(e){
			try{
               xmlhttp = new ActiveXObject(MSxml2.XMLHttpRequest);
           }
           catch(e){
           	alert("sorry! browser support failed");
           }
		}
		xmlhttp.onreadystatechange = function()
		{
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
			{

				var key = JSON.parse(xmlhttp.responseText);
				document.getElementById("search-display").innerHTML = "";
			}

			if(key.length == 0){
				document.getElementById("search-display").innerHTML = "No results found";
			}
			if(firstname.length == 0){
			    document.getElementById("search-display").innerHTML = "";
			    return;
		    }
			for( var i=0; i < key.length; i++){
			    var display =  key[i].firstname  + "&nbsp&nbsp" + key[i].mobilenumber + "\n" ;
			   
				document.getElementById("search-display").innerHTML += display;

                 
			}

	            $(document).ready(function(){
					// alert("hello");
				    //$("#search-display").slideDown('slow');
				    $("#search-button").click(function(){
				    	$("#index-div").hide();
				    	

				    });
				 });
		}

		
		
		xmlhttp.open("GET", "contacts?firstname="+firstname, true);
		xmlhttp.send();


	}