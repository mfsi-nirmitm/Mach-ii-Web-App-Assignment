<!---
  --- PaintingListener
  --- ----------------
  ---
  --- author: mindfire
  --- date:   8/29/17
  --->
<cfcomponent accessors="true" output="false" extends="MachII.framework.Listener" hint="Listener for Painting">

	<cffunction name="configure" access="public" output="false" returntype="void" hint="configure this listener as the part of the MachII framework" >
		<cfset var serviceFectory = getProperty('serviceFactory') />
		<cfset variables.paintingService =  serviceFectory.getBean('paintingService') />
	</cffunction>

	<cffunction name="getPaintingList" access="public" output="false" returntype="query" hint="returns the query records from the PaintingGateway" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfreturn variables.paintingService.getAllPaintings( arguments.event.getArg("ArtistID")) />
	</cffunction>

</cfcomponent>