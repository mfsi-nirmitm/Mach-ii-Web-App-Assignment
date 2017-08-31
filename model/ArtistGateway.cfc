<!---
  --- ArtistGateway
  --- -------------
  ---
  --- author: mindfire
  --- date:   8/28/17
  --->
<cfcomponent accessors="true" output="false" hint="defines gateway functions for artist">

	<cffunction name="init" access="public" output="false" returntype="ArtistGateway" hint="constructor">

		<cfargument name="DSN" type="string" required="true" hint="datasource" />

		<cfset variables.DSN = arguments.DSN />

		<cfreturn this />

	</cffunction>


	<cffunction name="getAllArtists" access="public" output="false" returntype="query" hint="returns all the name and images of artists">

		<cfset var qArtists = "" />

		<cfquery name="qArtists" datasource="#variables.DSN#">
			SELECT
				ARTISTID ,NAME , PROFILEIMAGE
			FROM
				ARTISTS
		</cfquery>

		<cfreturn qArtists />
	</cffunction>

</cfcomponent>