<!---
  --- ArtistService
  --- -------------
  ---
  --- author: mindfire
  --- date:   8/31/17
  --->
<cfcomponent name="ArtistService" hint="Service for record Artist" >

	<cffunction name="init" returntype="model.ArtistService" access="public" output="false" >

		<cfreturn this />
	</cffunction>

	<!--- setters for dependencies --->
	<cffunction name="setArtistDAO" returnType="void" access="public" output="false" hint="Dependency">
		<cfargument name="artistDAO" type="model.ArtistDAO" required="true" />
		<cfset variables.artistDAO = arguments.artistDAO />
	</cffunction>

	<cffunction name="setArtistGateway" returnType="void" access="public" output="false" hint="Dependency:">
		<cfargument name="artistGateway"  type="model.ArtistGateway" required ="true" />
		<cfset variables.artistGateway = arguments.artistGateway />
	</cffunction>

	<!--- service methods --->

	<cffunction name="getAllArtists" access="public" output="false" returnType="query" hint="returns all the name and images of artists" >
		<cfreturn  variables.artistGateway.getAllArtists() />
	</cffunction>

	<cffunction name="getArtist" access="public" output="false" returnType="model.Artist" hint="retrieving the artist detail">
		<cfargument name="artistID" type="numeric" required="true" />
		<cfreturn variables.artistDAO.read(arguments.artistID) />
	</cffunction>

</cfcomponent>