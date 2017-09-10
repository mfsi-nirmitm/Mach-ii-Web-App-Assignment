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

	<cffunction name="setPainting" access="public" returnType="void" hint="Painting dependency">
		<cfargument name = "Painting" type="model.Painting" required="true" />
		<cfset variables.painting = arguments.Painting />
	</cffunction>

	<cffunction name="setPaintingDAO" access="public" returnType="void" hint="PaintingDAO dependency" >
		<cfargument name= "paintingDAO" type="model.PaintingDAO" required="true" />
		<cfset variables.paintingDAO = arguments.paintingDAO />
	</cffunction>

	<!--- functions --->
	<cffunction name="getAllPaintings" access="public" output="false" returnType="query" hint="retrieve all the pictures" >
		<cfargument name="artistID" type="numeric" required="true" />
		<cfreturn variables.paintingGateway.getAllPaintings(arguments.artistID) />
	</cffunction>

	<cffunction name="addPainting" access="public" output="false" returnType="void" hint="adding the painting details" >
		<cfargument name="artistID" type="numeric" required="true" />
		<cfargument name="paintingName" type="string" required="true" />
		<cfargument name="imageUrl" type="string" required="true" />
		<cfargument name="isPublic" type="numeric" default="0" required="false" />

		<cfset variables.painting.init(
									ArtistID = arguments.artistID ,
									PaintingName = arguments.paintingName ,
									ImageUrl = arguments.imageUrl ,
									IsPublic = arguments.isPublic
							) />

		<cfset variables.paintingDAO.addPainting(variables.painting) />
	</cffunction>

	<cffunction name="makePublic" access="public" output="false" returnType="void" hint="make painting public of private" >
		<cfargument name="pictureID" type="numeric" required="true" />
		<cfargument name="action" type="numeric" required="true" />
		<cfset variables.paintingGateway.makePublic(arguments.pictureID , arguments.action) />
	</cffunction>
</cfcomponent>