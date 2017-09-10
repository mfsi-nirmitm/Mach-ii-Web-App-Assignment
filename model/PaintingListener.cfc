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

	<cffunction name="addpainting" access="public" output="false" returnType="void" hint="adding painting details" >
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfset variables.paintingService.addPainting(Int(Trim(arguments.event.getArg("ArtistID"))),Trim(arguments.event.getArg("paintingName")),Trim(arguments.event.getArg('paintingImage')) ) />
	</cffunction>

	<cffunction name="makePublic" access="public" output="false" returnType="void" hint="make painting public or private">
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfset variables.paintingService.makePublic( Int(arguments.event.getArg('picId')),Int(arguments.event.getArg('action')) ) />
	</cffunction>
</cfcomponent>