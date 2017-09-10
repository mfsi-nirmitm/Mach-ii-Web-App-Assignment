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

	<cffunction name = "getLogin" access="public" output="false" returnType="boolean" hint="checking the login credentials in database" >
		<cfargument name="login_user" type="string" required="true" hint="username for login" />
		<cfargument name="login_password" type="string" required="true" hint="password for login" />

		<cfset var isLogin = false />

		<cfquery name = "qLogin" datasource="#variables.DSN#" >
			SELECT ARTISTID , NAME
			FROM ARTISTS
			WHERE PASSWORD = <cfqueryparam value = "#arguments.login_password#" cfsqltype = "cf_sql_varchar" />
			AND	  EMAIL = <cfqueryparam value ="#arguments.login_user#" cfsqltype="cf_sql_varchar" />
			OR	  USERNAME = <cfqueryparam value = "#arguments.login_user#" cfsqltype="cf_sql_varchar" />
		</cfquery>

		<cfif qLogin.recordCount EQ 1 >
			<cfif structKeyExists(session,'loggedIn')>
				<cfset structdelete(session,'loggedIn') />
			</cfif>
			<cfset session.loggedIn['artistName'] = qLogin.NAME />
			<cfset session.loggedIn['artistID']   = qLogin.ARTISTID />
			<cfset isLogin = true />
		</cfif>

		<cfreturn isLogin />
	</cffunction>

	<cffunction name="isEmailExists" access="public" output="false" returnType="boolean" hint="email contain in database or not">
		<cfargument name="artistEmail" type="string" required="true" hint="email of the artist" />

		<cfset var hasEmail = false />
		<cfquery name="qhasEmail" datasource="#variables.DSN#">
			SELECT *
			FROM ARTISTS
			WHERE EMAIL = <cfqueryparam value="#arguments.artistEmail#" cfsqltype="cf_sql_varchar" />
		</cfquery>

		<cfif qhasEmail.recordCount EQ 1 >
			<cfset hasEmail = true />
		</cfif>

		<cfreturn hasEmail />
	</cffunction>

	<cffunction name="isUsernameExists" access="public" output="false" returnType="boolean" hint="username contain in database or not" >
		<cfargument name="artistUsername" type="string" required="true" hint="username of the artist" />
		<cfset var hasUsername= false />

		<cfquery name="qhasUsername" datasource="#variables.DSN#">
			SELECT *
			FROM ARTISTS
			WHERE USERNAME = <cfqueryparam value="#arguments.artistUsername#" cfsqltype="cf_sql_varchar" />
		</cfquery>

		<cfif qhasUsername.recordCount EQ 1 >
			<cfset hasUsername = true />
		</cfif>

		<cfreturn hasUsername />
	</cffunction>

	<cffunction name="isUsernameOfOtherArtist" access="public" output="false" returnType="boolean" hint="check username taken by other artist" >
		<cfargument name="artistID" type="numeric" required="true" hint="id of artist" />
		<cfargument name="artistUsername" type="string" required="true" hint="username of artist" />

		<cfset var hasUsername = false />

		<cfquery name="qhasOtherUsername" datasource="#variables.DSN#" >
			SELECT *
			FROM ARTISTS
			WHERE USERNAME = <cfqueryparam value="#arguments.artistUsername#" cfsqltype="cf_sql_varchar" />
			AND ARTISTID != <cfqueryparam value="#arguments.artistID#" cfsqltype="cf_sql_numeric" />
		</cfquery>

		<cfif qhasOtherUsername.recordCount GT 0 >
			<cfset hasUsername = true />
		</cfif>

		<cfreturn hasUsername />
	</cffunction>

	<cffunction name="isEmailOfOtherArtist" access="public" output="false" returnType="boolean" hint="check email taken by other artist ">
		<cfargument name="artistID" type="numeric" required="true" hint="id of artist" />
		<cfargument name="artistEmail" type="string" required="true" hint="email of artist" />

		<cfset var hasEmail = false />
		<cfdump var = '#arguments.artistID#' />
		<cfquery name="qhasOtherEmail" datasource="#variables.DSN#">
			SELECT *
			FROM ARTISTS
			WHERE EMAIL = <cfqueryparam value="#arguments.artistEmail#" cfsqltype="cf_sql_varchar" />
			AND ARTISTID != <cfqueryparam value="#arguments.artistID#" cfsqltype="cf_sql_numeric" />
		</cfquery>

		<cfif qhasOtherEmail.recordCount GT 0 >
			<cfset hasEmail = true />
		</cfif>

		<cfreturn hasEmail />
	</cffunction>

	<cffunction name="updateProfileImage" access="public" output="false" returnType="void" hint="updating profile image by artist id" >
		<cfargument name="artistID" type="numeric" required="true" hint="i'd of artist" />
		<cfargument name="artistProfileImage" type="string" required="true" hint="profile image of artist" />

		<cfquery name="qProfileImage" datasource="#variables.DSN#">
			UPDATE ARTISTS
			SET PROFILEIMAGE = <cfqueryparam value="#arguments.artistProfileImage#" cfsqltype="cf_sql_varchar" />
			WHERE ARTISTID = <cfqueryparam value="#arguments.artistID#" cfsqltype="cf_sql_numeric" />
		</cfquery>
	</cffunction>
</cfcomponent>