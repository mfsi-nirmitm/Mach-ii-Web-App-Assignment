<!---
  --- PaintingGateway
  --- -------------
  ---
  --- author: mindfire
  --- date:   8/28/17
  --->
<cfcomponent name="PaintingGateway" hint="define gateway function for painting">

	<cffunction name="init" access="public" output="false" returntype="PaintingGateway" hint="constructor">

		<cfreturn this />
	</cffunction>

	<!--- setters for dependencies --->
	<cffunction name="setDsn" returntype="void" access="public" output="false" hint="Dependency: datasource name">
		<cfargument name="DSN" type="string" required="true"/>
		<cfset variables.DSN = arguments.DSN />
	</cffunction>

	<cffunction name="getAllPaintings" access="public" output="false" returnType="query" hint="returns all the name of the paintings">
		<cfargument name="artistID" type="numeric" required="true" hint="ARTISTID"  />

		<cfset var qPaintings = "" />
		<cfquery name = "qPaintings" datasource="#variables.DSN#">
			SELECT
				PAINTINGID , PAINTINGNAME , IMAGEURL , ISPUBLIC
			FROM
				PAINTINGS
			WHERE
				ARTISTID = <cfqueryparam value = "#arguments.artistID#" cfsqltype = "cf_sql_numeric" />
		</cfquery>
		<cfreturn qPaintings />
	</cffunction>

</cfcomponent>