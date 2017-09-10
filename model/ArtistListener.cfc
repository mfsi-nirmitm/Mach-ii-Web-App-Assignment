<!---
  --- NewCFComponent
  --- --------------
  ---
  --- author: mindfire
  --- date:   8/28/17
  --->
<cfcomponent accessors="true" output="false" extends="MachII.framework.Listener" hint="ArtistListener for artist">

	<cffunction name="configure" access="public" output="false" returntype="void" hint="configure this listener as the part of the MachII framework" >

		<cfset var serviceFectory = getProperty('serviceFactory') />
		<cfset variables.artistService =  serviceFectory.getBean('artistService') />

	</cffunction>


	<cffunction name="getArtistList" access="public" output="false" returntype="query" hint="returns the query records from the ArtistGateway" >

		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn variables.artistService.getAllArtists() />

	</cffunction>

	<cffunction name = "getArtistDetail" access="public" output="false" returnType="model.Artist" hint="returns a Artist populated Bean" >

		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfif NOT event.isArgDefined('ArtistID')  >
			<cfif structKeyExists(session,'loggedIn')>
				<cfset event.setArg('ArtistID',session.loggedIn['artistID']) />
			</cfif>
		</cfif>
		<cfreturn variables.artistService.getArtist(Int(arguments.event.getArg("ArtistID"))) />

	</cffunction>

	<cffunction name = "getLogin" access="public" output="false" returnType="void" hint="autherizing the login credentials" >
		<cfargument name = "event" type="MachII.framework.Event" required="true" />

		<cfset  var isLogin = variables.artistService.getLogin(Trim(arguments.event.getArg('login_user')), Trim(arguments.event.getArg('login_password')))  />

		<cfif NOT isLogin >
			<cfset var errorMessages = {} />
			<cfset errorMessages["login_user_error"] = "Please! enter correct details." />
			<cfset errorMessages["login_password_error"] = "Please! enter correct details." />
			<cfset event.setArg('errorMessages',errorMessages) />
		<cfelseif event.isArgDefined('errorMessages') >
			<cfset event.removeArg('errorMessages') />
		</cfif>

	</cffunction>

	<cffunction name = "getLogout" access="public" output="false" returnType="void" hint="logout the artist">
		<cfargument name="event" type="MachII.framework.Event" required="true" />

		<cfset variables.artistService.getLogout() />
	</cffunction>

	<cffunction name="addArtist" access="public" output="false" returnType="void" hint="adding a artist detail ">
		<cfargument name="event" type="MachII.framework.Event" required="true" />

		<cfset var validValues = true />

		<cfset errorInSignIn = {} />
		<cfif variables.artistService.isEmailExists(Trim(arguments.event.getArg('signup_email'))) >
			<cfset errorInSignIn['signup_email_error'] = "Email already registered" />
			<cfset validValues = false />
		<cfelse>
			<cfset errorInSignIn['signup_email_error'] = "" />
		</cfif>
		<cfif variables.artistService.isUsernameExists(Trim(arguments.event.getArg('signup_username'))) >
			<cfset errorInSignIn['signup_username_error'] = "This username already taken" />
			<cfset validValues = false />
		<cfelse>
			<cfset errorInSignIn['signup_username_error'] = "" />
		</cfif>

		<cfif validValues >
			<cfset variables.artistService.addArtist(
									Trim(arguments.event.getArg('signup_name')),
									Trim(arguments.event.getArg('signup_email')),
									Trim(arguments.event.getArg('signup_number')),
									Trim(arguments.event.getArg('signup_city')),
									Trim(arguments.event.getArg('signup_country')),
									Trim(arguments.event.getArg('signup_username')),
									Trim(arguments.event.getArg('signup_password')) ) />
			<cfif arguments.event.isArgDefined('errorInSignIn')  >
				<cfset arguments.event.removeArg('errorInSignIn') />
			</cfif>
		<cfelse>
			<cfset arguments.event.setArg('errorInSignIn',errorInSignIn) />
		</cfif>
	</cffunction>

	<cffunction name="updateArtist" access="public" output="false" returnType="void" hint="updating artist detail" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />

		<cfset var validValues = true />
		<cfset errorInUpdate = {} />
		<cfif variables.artistService.isEmailOfOtherArtist(Int(Trim(arguments.event.getArg('ArtistID'))),Trim(arguments.event.getArg('edit_email')))>
			<cfset errorInUpdate['edit_email_error'] = "This email has already taken by another artist" />
			<cfset validValues = false />
		<cfelse>
			<cfset errorInUpdate['edit_email_error'] = "" />
		</cfif>
		<cfif variables.artistService.isUsernameOfOtherArtist( Int(Trim(arguments.event.getArg('ArtistID'))), Trim(arguments.event.getArg('edit_username')) )>
			<cfset errorInUpdate['edit_username_error'] = "This username has already taken by other artist " />
			<cfset validValues=false />
		<cfelse>
			<cfset errorInUpdate['edit_username_error'] = "" />
		</cfif>
		<cfif validValues >
			<cfset variables.artistService.updateArtist(	Int(Trim(arguments.event.getArg('ArtistID'))),
															Trim(arguments.event.getArg('edit_name')),
															Trim(arguments.event.getArg('edit_email')),
															Trim(arguments.event.getArg('edit_number')),
															Trim(arguments.event.getArg('edit_city')),
															Trim(arguments.event.getArg('edit_country')),
															Trim(arguments.event.getArg('edit_username')),
															Trim(arguments.event.getArg('edit_password')),
															Trim(arguments.event.getArg('edit_about'))
												) />
			<cfif arguments.event.isArgDefined('errorInUpdate')  >
				<cfset arguments.event.removeArg('errorInUpdate') />
			</cfif>
		<cfelse>
			<cfset arguments.event.setArg('errorInUpdate',errorInUpdate) />
		</cfif>
	</cffunction>

	<cffunction name="updateProfileImage" access="public" output="false" returnType="void" hint="update profile image" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfset variables.artistService.updateProfileImage(Int(arguments.event.getArg('ArtistID')),arguments.event.getArg('profileImage')) />
	</cffunction>

</cfcomponent>