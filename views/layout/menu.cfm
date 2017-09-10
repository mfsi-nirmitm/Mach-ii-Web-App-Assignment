
<div class="row-fluid">

		<div class="logo_head">
			<a href="/index.cfm?event=home">
				<img src="/assets/img/logo.png" alt="logo"/>
			</a>
		</div>
		<!-- Desktop-Main-Menu-Start  -->
		<cfif structKeyExists(session,'loggedIn')>
			<div class = "login_session" ><cfoutput> <a>#session.loggedIn['artistName']#</a> | <a href="/index.cfm?event=logoutAttempt">Logout</a></cfoutput></div>
	  	<cfelse>
      		<div class="span6 hs_see_more offset5"> <a id="show-dialog-2" class="hs_more_btn signin"> Sign In </a> </div>
      	</cfif>

 </div>


<!--->
<cfif event.isArgDefined('errorMessages') >
<cfdump var = '#event#' />
	<script src="/assets/js/include.js" ></script>
</cfif>
--->


		<div id="panel-2">
			<div class="hd">Login</div>
			<div class="bd">
				<cfoutput>
				<form id="loginform" class="form" action="/index.cfm?event=logginAttempt"  method="post" >
					<div>
						<span class="error" id="login_user_error"><cfif event.isArgDefined('errorMessages') >#event.getArg('errorMessages')['login_user_error']#</cfif></span>
						<input type="text" id="login_user" name="login_user" placeholder="Email Or Username">
					</div>
					<div>
						<span class="error" id="login_password_error" ><cfif event.isArgDefined('errorMessages') >#event.getArg('errorMessages')['login_password_error']#</cfif></span>
						<input type="password" id="login_password" name="login_password" placeholder="Password" >
					</div>
					<div>
						<input class="submit" type="submit" id="login_submit"  name="login_submit" value="Submit">
					</div>
				</form>
				</cfoutput>
				<p class="message">Not registered? <a id="signup" >Create an account</a></p>
			</div>
		</div>

		<div id="signup-panel">
			<div class="hd">Sign Up</div>
			<div class="bd">
				<cfoutput>
				<form name="mySignForm" id="signupform" class="form" method="post" action="/index.cfm?event=signupAttempt" >
					<div>
						<span class="error" id="signup_name_error"><cfif event.isArgDefined('signupErrorMessages') >#event.getArg('signupErrorMessages')['signup_name_error']#</cfif></span>
						<input type="text" id="signup_name" name="signup_name" placeholder="Name" <cfif event.isArgDefined('signup_name')>value="#event.getArg('signup_name')#"</cfif> >
					</div>
					<div>
						<span class="error" id="signup_email_error"><cfif event.isArgDefined('signupErrorMessages') >#event.getArg('signupErrorMessages')['signup_email_error']# <cfelseif event.isArgDefined('errorInSignIn')>#event.getArg('errorInSignIn')['signup_email_error']#</cfif></span>
						<input type="text" id="signup_email" name="signup_email" placeholder="Email" <cfif event.isArgDefined('signup_email')>value="#event.getArg('signup_email')#"</cfif> >
					</div>
					<div>
						<span class="error" id="signup_number_error"><cfif event.isArgDefined('signupErrorMessages') >#event.getArg('signupErrorMessages')['signup_number_error']#</cfif></span>
						<input type="text" id="signup_number" name="signup_number" placeholder="Phone" maxlength="10" <cfif event.isArgDefined('signup_number')>value="#event.getArg('signup_number')#"</cfif> >
					</div>
					<div>
						<span class="error" id="signup_city_error"><cfif event.isArgDefined('signupErrorMessages') >#event.getArg('signupErrorMessages')['signup_city_error']#</cfif></span>
						<input type="text" id="signup_city" name="signup_city" placeholder="City" <cfif event.isArgDefined('signup_city')>value="#event.getArg('signup_city')#"</cfif> >
					</div>
					<div>
						<span class="error" id="signup_country_error"><cfif event.isArgDefined('signupErrorMessages') >#event.getArg('signupErrorMessages')['signup_country_error']#</cfif></span>
						<input type="text" id="signup_country" name="signup_country" placeholder="country" <cfif event.isArgDefined('signup_country')>value="#event.getArg('signup_country')#"</cfif> >
					</div>
					<div>
						<span class="error" id="signup_username_error"><cfif event.isArgDefined('signupErrorMessages') >#event.getArg('signupErrorMessages')['signup_username_error']#<cfelseif event.isArgDefined('errorInSignIn')>#event.getArg('errorInSignIn')['signup_username_error']#</cfif></span>
						<input type="text" id="signup_username" name="signup_username" placeholder="UserName" <cfif event.isArgDefined('signup_username')>value="#event.getArg('signup_username')#"</cfif> >
					</div>
					<div>
						<span class="error" id="signup_password_error"><cfif event.isArgDefined('signupErrorMessages') >#event.getArg('signupErrorMessages')['signup_password_error']#</cfif></span>
						<input type="Password" id="signup_password" name="signup_password" placeholder="Password" <cfif event.isArgDefined('signup_password')>value="#event.getArg('signup_password')#"</cfif> >
					</div>
					<div>
						<span class="error" id="confirm_password_error"><cfif event.isArgDefined('signupErrorMessages') >#event.getArg('signupErrorMessages')['confirm_password_error']#</cfif></span>
						<input type="password" id="confirm_password" name="confirm_password" placeholder="Confirm Password" <cfif event.isArgDefined('confirm_password')>value="#event.getArg('confirm_password')#"</cfif> >
					</div>
					<div>
						<input class="submit" type="submit" id="signup_submit" name="signup_submit" value="Submit" >
					</div>
				</form>
				</cfoutput>
			</div>
		</div>
