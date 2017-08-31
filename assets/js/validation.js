
function login_submit()
{
	var value = $("#login_user").val().trim();
	var isValid = true;
	alert(value);
	if(value === "" || value === null || value === undefined )
	{
		isValid = false;
		$("#login_user_error").html("Please! Enter your email i'd or password");
	}
	else $("#login_user_error").html("");
	value = $("#login_password").val().trim();
	if(value === "" || value === null || value === undefined)
	{
		isValid=false;
		$("#login_password_error").html("Please! Enter the password");
	}
	else $("#login_password_error").html("");
	
	return false;
}
