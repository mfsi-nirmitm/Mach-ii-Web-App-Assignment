<!---
  --- PaintingDAO
  --- -----------
  ---
  --- author: mindfire
  --- date:   9/9/17
  --->
<cfcomponent name="PaintingDAO" hint="Dao functions for painting" >

	<cfset variables.DSN = "" />

	<cffunction name="init" access="public" output="false" returnType="model.PaintingDAO" hint="constructor">
		<cfreturn this />
	</cffunction>

	<!--- setters for dependencies --->
	<cffunction name="setDsn" returntype="void" access="public" output="false" hint="Dependency: datasource name">
		<cfargument name="DSN" type="string" required="true"/>
		<cfset variables.DSN = arguments.DSN />
	</cffunction>

	<cffunction name="setPainting" returnType="void" access="public" output="false" hint="Dependency: datasource name" >
		<cfargument name="Painting" type="model.Painting" required="true" />
		<cfset variables.Painting = arguments.Painting />
	</cffunction>

	<!--- DAO methods --->
	<cffunction name="addPainting" returnType="void" access="public" output="false" hint="Dependency : datasource name"  >
		<cfargument name="Painting" type="model.Painting" required="true" />

		<cfquery name="qaddPainting" datasource="#variables.DSN#" >
			INSERT INTO PAINTINGS
			VALUES
			(
				<cfqueryparam value="#arguments.Painting.getArtistID()#" cfsqltype="cf_sql_numeric" /> ,
				<cfqueryparam value="#arguments.Painting.getPaintingName()#" cfsqltype="cf_sql_varchar"> ,
				<cfqueryparam value="#arguments.Painting.getImageUrl()#" cfsqltype="cf_sql_varchar"> ,
				<cfqueryparam value="#arguments.Painting.getIsPublic()#" cfsqltype="cf_sql_bit" >
			)
		</cfquery>
	</cffunction>

</cfcomponent>