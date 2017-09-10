
function submitonlogin()
{
	var value = $("#login_user").val().trim();
	var isValid = true;
	if(value === "" || value === null || value === undefined )
	{
		isValid = false;
		$("#login_user_error").text("Please! Enter your email i'd or password");
	}
	else $("#login_user_error").text("");
	value = $("#login_password").val().trim();
	if(value === "" || value === null || value === undefined)
	{
		isValid=false;
		$("#login_password_error").text("Please! Enter the password");
	}
	else $("#login_password_error").text("");
	return isValid;
	
}



var signup_fields=["#signup_name","#signup_email","#signup_number","#signup_city","#signup_country","#signup_username","#signup_password","#confirm_password"];
var update_fields=["#edit_name", "#edit_email","#edit_number","#edit_city","#edit_country","#edit_username","#edit_password","#edit_confirm_password","#edit_about"];
var signup_fields_name=["Name" , "Email I'd", "Number" , "City" , "Country", "Username" , "Password" , "Confirm Password","Details"];

function check(id,index)
{
	var value = $(id).val().trim();
	var isValid = true;
	var errorid = id+"_error";
	if(value === "" || value === null || value === undefined )
	{
		isValid = false;
		$(errorid).text("Please! enter your "+signup_fields_name[index]);
	}
	else if(id === "#signup_email")
	{
		if(!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(value)))
		{
			isValid = false;
			$(errorid).text("Please! enter a valid Email i'd");
		}
		else $(errorid).text("");
	}
	else if(id === "#signup_number")
	{
		if(!(/^[1-9](\d){9}$/.test(value)))
		{
			isValid = false;
			$(errorid).text("Please! enter a valid Number");
		}
		else $(errorid).text("");
	}
	else if(id === "#signup_password" )
	{
		if(!(/^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[$@!%*#?&])[A-Za-z\d@$!%*#?&\s]{4,}$/.test(value)))
		{
			isValid = false;
			$(errorid).text("1 small letter , 1 upper letter , 1 digit and 1 special character");
		}
		else $(errorid).text("");
	}	
	else if(id === "#confirm_password")
	{
		var pass = $("#signup_password").val().trim();
		if(value !== pass)
		{
			isValid = false;
			$(errorid).text("Password should be same");
		}	
		else $(errorid).text("");
	}
	else $(errorid).text("");
	return isValid
}

function submitonsignup()
{
	var isValid= true;
	$.each(signup_fields, function( index, value ) {
		  if(! check(value,index))
			  isValid = false;
	});
	
	return isValid;
}

function check_update(id,index)
{
	var value = $(id).val().trim();
	var isValid = true;
	var errorid = id+"_error";
	if(value === "" || value === null || value === undefined )
	{
		isValid = false;
		$(errorid).text("Please! enter your "+signup_fields_name[index]);
	}
	else if(id === "#edit_email")
	{
		if(!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(value)))
		{
			isValid = false;
			$(errorid).text("Please! enter a valid Email i'd");
		}
		else $(errorid).text("");
	}
	else if(id === "#edit_number")
	{
		if(!(/^[1-9](\d){9}$/.test(value)))
		{
			isValid = false;
			$(errorid).text("Please! enter a valid Number");
		}
		else $(errorid).text("");
	}
	else if(id === "#edit_password" )
	{
		if(!(/^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[$@!%*#?&])[A-Za-z\d@$!%*#?&\s]{4,}$/.test(value)))
		{
			isValid = false;
			$(errorid).text("1 small letter , 1 upper letter , 1 digit and 1 special character");
		}
		else $(errorid).text("");
	}	
	else if(id === "#edit_confirm_password")
	{
		var pass = $("#edit_password").val().trim();
		if(value !== pass)
		{
			isValid = false;
			$(errorid).text("Password should be same");
		}	
		else $(errorid).text("");
	}
	else $(errorid).text("");
	return isValid
}
function submitonupdate()
{
	var isValid= true;
	$.each(update_fields, function( index, value ) {
		  if( !check_update(value,index))
			  isValid = false;
	});
	
	return isValid;
}
$(document).ready(function(){
	$("#login_submit").click(function(event){
		if(!submitonlogin())
		{
			event.preventDefault();
		}
	});
	$("#signup_submit").click(function(event){
		if(!submitonsignup())
		{
			event.preventDefault();
		}
	});
	$("#edit_submit").click(function(event){
		if(!submitonupdate())
		{
			event.preventDefault();
		}
	});
	$("#cancle_button").click(function(){
		$(".mask").hide();
		editProfilePanel.hide();
	});
});


