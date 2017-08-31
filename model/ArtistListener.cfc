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

		<!---><cfset var Artist = createObject("component", "Artist").init( arguments.event.getArg("ArtistID") ) />
		<cfset var ArtistDAO = createObject("component", "ArtistDAO").init( DSN = request.DSN ) />

		<cfset ArtistDAO.read(Artist) />

		<cfreturn Artist />--->

		<cfreturn variables.artistService.getArtist(arguments.event.getArg("ArtistID")) />

	</cffunction>

</cfcomponent>