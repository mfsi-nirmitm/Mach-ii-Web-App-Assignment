<!---
  --- AddPainting
  --- -----------
  ---
  --- author: mindfire
  --- date:   9/8/17
  --->
<cfcomponent name="UploadProfileImage" extends="MachII.framework.EventFilter" hint="filter to add painting">

	<cffunction name="configure" access="public" returnType="void" output="false" hint="simple filter for add painting" >
		<!---  configure function --->
	</cffunction>

	<cffunction name="filterEvent" access="public" output="false" returnType="boolean" hint="check painting formate" >
		<cfargument name="event" type="MachII.framework.Event" required="true" hint="event object for current event" />
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" hint="eventcontext object for current event" />
		<cfargument name="paramArgs" type="struct" required="false" default="#StructNew()#"  />

		<cfset var UploadFolder = expandPath("./assets/arts") />
		<cfset var addArtError = "" />
		<cfset var noError = true />
		<cfif structkeyExists(session,'loggedIn')>
			<cfset event.setArg('ArtistID',session.loggedIn['artistID']) />
		</cfif>

		<cfif DirectoryExists(UploadFolder) >
			<cfif arguments.event.isArgDefined('UploadPainting') AND arguments.event.getArg('UploadPainting') NEQ "">
				<cftry>
            		<cffile
                		action="upload"
                		filefield="UploadPainting"
                		destination="#UploadFolder#"
                		nameconflict="makeunique"
                		accept="image/jpeg,image/png"
						result="fileUploadResult"
                	>
					<cfset var image = '/assets/arts/' & #fileUploadResult.SERVERFILE# />
					<cfset arguments.event.setArg('paintingImage',image) />
					<cfset arguments.event.setArg('paintingName', fileUploadResult.SERVERFILE ) />


		            <cfcatch type="any">
						<cfset noError =false />
		                <cfset addArtError = #cfcatch.Message# />
						<cfset arguments.event.setArg('addArtError',addArtError) />
						<cfset announceEvent("ShowPortfolio",arguments.event.getArgs()) />
						<cfreturn false />
		            </cfcatch>
     			</cftry>
			<cfelse>
				<cfset noError= false />
				<cfset addArtError = "Please select your painting first." />
			</cfif>
		<cfelse>
			<cfset noError = false />
			<cfset addArtError = "Directory does not exist." />
			<cfset arguments.event.setArg('addArtError',addArtError) />

		</cfif>

		<cfif noError >
			<cfif arguments.event.isArgDefined('addArtError') >
				<cfset arguments.event.removeArg('addArtError') />
			</cfif>
		<cfelse>
			<cfset arguments.event.setArg('addArtError',addArtError) />
			<cfset announceEvent("ShowPortfolio",arguments.event.getArgs()) />
			<cfreturn false />
		</cfif>

		<cfreturn noError />
	</cffunction>

</cfcomponent>