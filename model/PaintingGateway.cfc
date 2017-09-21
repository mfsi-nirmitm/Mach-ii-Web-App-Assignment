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
		<cftry>
			<cfquery name = "qPaintings" datasource="#variables.DSN#">
				SELECT
					PAINTINGID , PAINTINGNAME , IMAGEURL , ISPUBLIC
				FROM
					PAINTINGS
				WHERE
					ARTISTID = <cfqueryparam value = "#arguments.artistID#" cfsqltype = "cf_sql_numeric" />
			</cfquery>
		<cfcatch type="any">
			<cflog file="Artist" text = "#error.type#" type = "error" >
		</cfcatch>
		</cftry>
		<cfreturn qPaintings />
	</cffunction>

	<cffunction name="makePublic" access="public" output="false" returnType="void" hint="make painting public or private"  >
		<cfargument name="pictureID" type="numeric" required="true" />
		<cfargument name="action" type="numeric" required="true" />

		<cftry>
			<cfquery name="qmakePublic" datasource="#variables.DSN#" >
				UPDATE PAINTINGS
				SET ISPUBLIC = <cfqueryparam value = "#arguments.action#" cfsqltype = "cf_sql_numeric" />
				WHERE  PAINTINGID  = <cfqueryparam value = "#arguments.pictureID#" cfsqltype = "cf_sql_numeric" />
			</cfquery>
		<cfcatch type="any">
			<cflog file="Artist" text = "#error.type#" type = "error" >
		</cfcatch>
		</cftry>
	</cffunction>

</cfcomponent>