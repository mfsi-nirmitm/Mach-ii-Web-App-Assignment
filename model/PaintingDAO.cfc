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

	<cffunction name="addPainting" returntype="void" access="public" output="false" hint="adding painting">
		<cfargument name="artistID" type="numeric" required="true" />
		<cfargument name="paintingName" type="string" required="true" />
		<cfargument name="imageUrl" type="string" required="true" />
		<cfargument name="isPublic" type="numeric" default="0" required="true" />

		<cftry>
			<cfquery name="qaddPainting" datasource="#variables.DSN#" >
				INSERT INTO PAINTINGS
				VALUES
				(
					<cfqueryparam value="#arguments.artistID#" cfsqltype="cf_sql_numeric" /> ,
					<cfqueryparam value="#arguments.paintingName#" cfsqltype="cf_sql_varchar" /> ,
					<cfqueryparam value="#arguments.imageUrl#" cfsqltype="cf_sql_varchar" /> ,
					<cfqueryparam value="#arguments.isPublic#" cfsqltype="cf_sql_bit" />
				)
			</cfquery>
		<cfcatch type="any">
			<cflog file="Artist" text = "#error.type#" type = "error" >
		</cfcatch>
		</cftry>

	</cffunction>

</cfcomponent>