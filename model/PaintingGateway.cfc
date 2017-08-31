<!---
  --- PaintingGateway
  --- -------------
  ---
  --- author: mindfire
  --- date:   8/28/17
  --->
<cfcomponent name="PaintingGateway" hint="define gateway function for painting">

	<cffunction name="init" access="public" output="false" returntype="PaintingGateway" hint="constructor">

		<cfargument name="DSN" type="string" required="true" hint="datasource" />

		<cfset variables.DSN = arguments.DSN />

		<cfreturn this />

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