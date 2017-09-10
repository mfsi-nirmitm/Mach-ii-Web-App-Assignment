<!---
  --- UploadProfileImage
  --- ------------------
  ---
  --- author: mindfire
  --- date:   9/8/17
  --->
<cfcomponent name="UploadProfileImage" extends="MachII.framework.EventFilter" hint="filter to upload profile image">

	<cffunction name="configure" access="public" returnType="void" output="false" hint="simple filter for validation fields" >
		<!---  configure function --->
	</cffunction>

	<cffunction name="filterEvent" access="public" output="false" returnType="boolean" hint="redirect the event" >
		<cfargument name="event" type="MachII.framework.Event" required="true" hint="event object for current event" />
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" hint="eventcontext object for current event" />
		<cfargument name="paramArgs" type="struct" required="false" default="#StructNew()#"  />

		<cfset var UploadFolder = expandPath("./assets/artist") />
		<cfset var uploadprofileError = "" />
		<cfset var noError = true />
		<cfif structkeyExists(session,'loggedIn')>
			<cfset event.setArg('ArtistID',session.loggedIn['artistID']) />
		</cfif>
		<cfif DirectoryExists(UploadFolder) >
			<cfif arguments.event.isArgDefined('UploadFile') AND arguments.event.getArg('UploadFile') NEQ "" >
				<cftry>
            		<cffile
                		action="upload"
                		filefield="UploadFile"
                		destination="#UploadFolder#"
                		nameconflict="makeunique"
                		accept="image/jpeg,image/png"
						result="fileUploadResult"
                	>
					<cfset var image = '/assets/artist/' & #fileUploadResult.SERVERFILE# />
					<cfset arguments.event.setArg('profileImage',image) />


		            <cfcatch type="any">
						<cfset noError =false />
		                <cfset uploadprofileError = #cfcatch.Message# />
						<cfset arguments.event.setArg('uploadprofileError',uploadprofileError) />
						<cfset announceEvent("ShowPortfolio",arguments.event.getArgs()) />
						<cfreturn false />
		            </cfcatch>
     			</cftry>

			<cfelse>
				<cfset noError = false />
				<cfset uploadprofileError = "First select the file." />
			</cfif>
		<cfelse>
			<cfset noError = false />
			<cfset uploadprofileError = "Directory does not exist." />
		</cfif>

		<cfif noError >
			<cfif arguments.event.isArgDefined('uploadprofileError')>
				<cfset arguments.event.removeArg('uploadprofileError') />
			</cfif>
		<cfelse>
			<cfset arguments.event.setArg('uploadprofileError',uploadprofileError) />
			<cfset announceEvent("ShowPortfolio",arguments.event.getArgs()) />
		</cfif>

		<cfreturn noError />
	</cffunction>

</cfcomponent>