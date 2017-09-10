<!---
  --- SuccessFilter
  --- -------------
  ---
  --- author: mindfire
  --- date:   9/5/17
  --->
<cfcomponent name="SuccessFilter" extends="MachII.framework.EventFilter" hint="filter to know error in fields">

	<cffunction name="configure" access="public" returnType="void" output="false" hint="simple filter for validation fields" >

	</cffunction>

	<cffunction name="filterEvent" access="public" returnType="boolean" hint="redirect the event" >
		<cfargument name="event" type="MachII.framework.Event" required="true" hint="event object for current event" />
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" hint="eventcontext object for current event" />
		<cfargument name="paramArgs" type="struct" required="false" default="#StructNew()#"  />

		<cfif arguments.paramArgs['eventname'] EQ "signup" >
			<cfif arguments.event.isArgDefined('errorInSignIn') >
				<cfset announceEvent('home', arguments.event.getArgs()) />
				<cfreturn false />
			<cfelse>
				<cfset redirectEvent('home') />
				<cfreturn true />
			</cfif>

		</cfif>
		<cfreturn true />
	</cffunction>

</cfcomponent>