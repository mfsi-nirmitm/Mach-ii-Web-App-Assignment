<!---
  --- ValidationFilter
  --- ----------------
  ---
  --- author: mindfire
  --- date:   9/4/17
  --->
<cfcomponent name="ValidationFilter" extends="MachII.framework.EventFilter" hint="validation of form fields">

	<cffunction name="configure" access="public" returnType="void" output="false" hint="simple filter for validation fields" >

	</cffunction>

	<cffunction name="filterEvent" access="public" returnType="boolean"  hint = "function for validationFileter to validate the fields of form">
		<cfargument name="event" type="MachII.framework.Event" required="true" hint="event object for current event" />
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" hint="eventcontext object for current event" />
		<cfargument name="paramArgs" type="struct" required="false" default="#StructNew()#"  />

		<cfset var errorMessages = {} />
		<cfset var isValid = true />
		<cfif arguments.paramArgs["validationfor"] EQ "login"  >

			<cfif Trim(arguments.event.getArg('login_user')) EQ "" >
				<cfset errorMessages['login_user_error'] = "Please! Enter username or password" />
				<cfset isValid = false />
			<cfelse >
				<cfset errorMessages['login_user_error'] = "" />
			</cfif>

			<cfif Trim(arguments.event.getArg('login_password')) EQ "" >
				<cfset errorMessages['login_password_error'] = "Please! Enter your password" />
				<cfset isValid = false />
			<cfelse>
				<cfset errorMessages['login_password_error'] = "" />
			</cfif>

			<cfif NOT isValid>
				<cfset arguments.event.setArg('errorMessages',errorMessages) />
				<cfset announceEvent("home",arguments.event.getArgs()) />
			</cfif>
		<cfelseif arguments.paramArgs["validationfor"] EQ "signup">
			<cfset var signupErrorMessages = {} />
			<cfif Trim(arguments.event.getArg('signup_name')) EQ "" >
				<cfset signupErrorMessages['signup_name_error'] = "Please! Enter your password" />
				<cfset isValid = false />
			<cfelse>
				<cfset signupErrorMessages['signup_name_error'] = "" />
			</cfif>
			<cfif Trim(arguments.event.getArg('signup_email')) EQ "" >
				<cfset signupErrorMessages['signup_email_error'] = "Please! Enter your Email" />
				<cfset isValid = false />
			<cfelseif NOT isValid('email', Trim(arguments.event.getArg('signup_email'))) >
				<cfset signupErrorMessages['signup_email_error'] = "Please! Enter a valid email" />
				<cfset isValid = false />
			<cfelse>
				<cfset signupErrorMessages['signup_email_error'] = "" />
			</cfif>
			<cfif Trim(arguments.event.getArg('signup_number')) EQ "" >
				<cfset signupErrorMessages['signup_number_error'] = "Please! Enter your number" />
				<cfset isValid = false />
			<cfelseif NOT isValid('regex',Trim(arguments.event.getArg('signup_number')),'^[1-9](\d){9}$') >
				<cfset signupErrorMessages['signup_number_error'] = "Please! Enter a valid number" />
				<cfset isValid = false />
			<cfelse>
				<cfset signupErrorMessages['signup_number_error'] = "" />
			</cfif>
			<cfif Trim(arguments.event.getArg('signup_city')) EQ "" >
				<cfset signupErrorMessages['signup_city_error'] = "Please! Enter your city" />
				<cfset isValid = false />
			<cfelse>
				<cfset signupErrorMessages['signup_city_error'] = "" />
			</cfif>
			<cfif Trim(arguments.event.getArg('signup_country')) EQ "" >
				<cfset signupErrorMessages['signup_country_error'] = "Please! Enter your country" />
				<cfset isValid = false />
			<cfelse>
				<cfset signupErrorMessages['signup_country_error'] = "" />
			</cfif>
			<cfif Trim(arguments.event.getArg('signup_username')) EQ "" >
				<cfset signupErrorMessages['signup_username_error'] = "Please! Enter your username" />
				<cfset isValid = false />
			<cfelse>
				<cfset signupErrorMessages['signup_username_error'] = "" />
			</cfif>
			<cfif Trim(arguments.event.getArg("signup_password")) EQ "" >
				<cfset signupErrorMessages['signup_password_error'] = "Please! Enter your password"/>
				<cfset isValid = false />
			<cfelseif NOT isValid('regex',Trim(arguments.event.getArg("signup_password")),'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[$@!%*##?&])[A-Za-z\d@$!%*##?&\s]{4,}$') >
				<cfset signupErrorMessages['signup_password_error'] = "1 small letter , 1 upper letter , 1 digit and 1 special character" />
				<cfset isValid = false />
			<cfelse>
				<cfset signupErrorMessages['signup_password_error'] = "" />
			</cfif>
			<cfif Trim(arguments.event.getArg('confirm_password')) EQ "" >
				<cfset signupErrorMessages['confirm_password_error'] = "Please! confirm your password" />
				<cfset isValid = false />
			<cfelseif Trim(arguments.event.getArg("confirm_password")) NEQ Trim(arguments.event.getArg('signup_password'))>
				<cfset signupErrorMessages['confirm_password_error'] = "Password should be same"/>
				<cfset isValid = false />
			<cfelse>
				<cfset signupErrorMessages['confirm_password_error'] = "" />
			</cfif>
			<cfif NOT isValid >
				<cfset arguments.event.setArg('signupErrorMessages',signupErrorMessages) />
				<cfset announceEvent("home",arguments.event.getArgs()) />
			</cfif>
		</cfif>

		<cfreturn isValid />
	</cffunction>

</cfcomponent>