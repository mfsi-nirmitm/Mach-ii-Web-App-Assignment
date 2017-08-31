<!---
  --- PaintingService
  --- ---------------
  ---
  --- author: mindfire
  --- date:   8/31/17
  --->
<cfcomponent name="PaintingService" hint="Service for Painting">

	<cffunction name="init" access="public" returnType="model.PaintingService"  output="false">

		<cfreturn this />
	</cffunction>

	<!--- setters for dependencies --->
	<cffunction name="setPaintingGateway" access="public" returnType="void" hint="Dependency">
		<cfargument name="paintingGateway" type="model.PaintingGateway" required="true" />
		<cfset variables.paintingGateway = arguments.paintingGateway />
	</cffunction>

	<!--- functions --->
	<cffunction name="getAllPaintings" access="public" output="false" returnType="query" hint="retrieve all the pictures" >
		<cfargument name="artistID" type="numeric" required="true" />
		<cfreturn variables.paintingGateway.getAllPaintings(arguments.artistID) />
	</cffunction>

</cfcomponent>