<!---
  --- ArtistGateway
  --- -------------
  ---
  --- author: mindfire
  --- date:   8/28/17
  --->
<cfcomponent accessors="true" output="false" hint="defines gateway functions for artist">

	<cfset variables.DSN = "" />

	<cffunction name="init" access="public" output="false" returntype="ArtistGateway" hint="constructor">

		<cfreturn this />
	</cffunction>


	<!--- setters for dependencies --->
	<cffunction name="setDsn" returntype="void" access="public" output="false" hint="Dependency: datasource name">
		<cfargument name="DSN" type="string" required="true"/>
		<cfset variables.DSN = arguments.DSN />
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