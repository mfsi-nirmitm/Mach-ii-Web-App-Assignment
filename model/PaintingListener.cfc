<!---
  --- PaintingListener
  --- ----------------
  ---
  --- author: mindfire
  --- date:   8/29/17
  --->
<cfcomponent accessors="true" output="false" extends="MachII.framework.Listener" hint="Listener for Painting">

	<cffunction name="configure" access="public" output="false" returntype="void" hint="configure this listener as the part of the MachII framework" >
		<!--- configure --->
	</cffunction>

	<cffunction name="getPaintingList" access="public" output="false" returntype="query" hint="returns the query records from the PaintingGateway" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />

		<cfset var PaintingGateway = createObject("component","PaintingGateway").init(DSN=request.DSN) />

		<cfreturn PaintingGateway.getAllPaintings( arguments.event.getArg("ArtistID")) />

	</cffunction>

</cfcomponent>