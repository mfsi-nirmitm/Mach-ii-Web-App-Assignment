<!---
  --- Painting
  --- --------
  ---
  --- author: mindfire
  --- date:   9/9/17
  --->
<cfcomponent name="Painting" hint="This is a Painting Bean">

	<cfset variables.instance.PaintingID=0 />
	<cfset variables.instance.ArtistID=0 />
	<cfset variables.instance.PaintingName = "" />
	<cfset variables.instance.ImageUrl ="" />
	<cfset variables.instance.IsPublic = 0 />

	<cffunction name="init" displayname="init" hint="bean for painting" access="public" output="false" returntype="model.Painting" >
		<cfargument name="PaintingID" type="numeric" required="false" default="0" hint="PAINTINGID" />
		<cfargument name="ArtistID" type="numeric" required="false" default="0"  hint="ARTISTID" />
		<cfargument name="PaintingName" type="string" required="false" default="" hint="PAINTINGNAME" />
		<cfargument name="ImageUrl" type="string" required="false" default="" hint="IMAGEURL" />
		<cfargument name="IsPublic" type="numeric" required="false" default="0" hint="ISPUBLIC" />

		<cfset setPaintingID(arguments.PaintingID) />
		<cfset setArtistID(arguments.ArtistID) />
		<cfset setPaintingName(arguments.PaintingName) />
		<cfset setImageUrl(arguments.ImageUrl) />
		<cfset setIsPublic(arguments.IsPublic) />

		<cfreturn this />
	</cffunction>

	<cffunction name="getPaintingID" access="public" output="false" returnType="numeric" hint="Getter for paintingid" >
		<cfreturn variables.instance.PaintingID />
	</cffunction>

	<cffunction name="setPaintingID" access="private" output="false" returnType="void" hint="Setter for paintingid" >
		<cfargument name="PaintingID" type="numeric" required="true" hint="paintid of art" />
		<cfset variables.instance.PaintingID = arguments.PaintingID />
	</cffunction>

	<cffunction name="getArtistID" access="public" output="false" returnType="numeric" hint="Getter for artistid">
		<cfreturn variables.instance.ArtistID />
	</cffunction>

	<cffunction name="setArtistID" access="private" output="false" returnType="void" hint="Setter for ArtistID">
		<cfargument name="ArtistID" type="numeric" required="true" hint="id of artist" />
		<cfset variables.instance.ArtistID = arguments.ArtistID />
	</cffunction>

	<cffunction name="getPaintingName" access="public" output="false" returnType="string" hint="Getter for painting name" >
		<cfreturn variables.instance.PaintingName />
	</cffunction>

	<cffunction name="setPaintingName" access="private" output="false" returnType="void" hint="Setter for painting name">
		<cfargument name="PaintingName" type="string" required="true" hint="name of painting" />
		<cfset variables.instance.PaintingName = arguments.PaintingName />
	</cffunction>

	<cffunction name="getImageUrl" access="public" output="false" returnType="string" hint="Getter for ImageUrl" >
		<cfreturn variables.instance.ImageUrl />
	</cffunction>

	<cffunction name="setImageUrl" access="private" output="false" returnType="void" hint="Setter for ImageUrl" >
		<cfargument name="ImageUrl" type="string" required="true" hint="url of image" />
		<cfset variables.instance.ImageUrl = arguments.ImageUrl />
	</cffunction>

	<cffunction name="getIsPublic" access="public" output="false" returnType="numeric" hint="Getter for IsPublic" >
		<cfreturn variables.instance.IsPublic />
	</cffunction>

	<cffunction name="setIsPublic" access="private" output="false" returnType="void" hint="Setter for IsPublic" >
		<cfargument name="IsPublic" type="numeric" required="true" hint="flag for public or not" />
		<cfset variables.instance.IsPublic = arguments.IsPublic />
	</cffunction>
</cfcomponent>