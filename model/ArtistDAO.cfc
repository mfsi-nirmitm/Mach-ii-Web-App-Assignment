<!---
  --- ArtistDAO
  --- ---------
  ---
  --- author: mindfire
  --- date:   8/28/17
  --->

<cfcomponent name="ArtistDAO" output="false" hint="Data Access Object for Artist" >

	<cfset variables.DSN = "" />
	<cffunction name="init" access="public" output="false" returnType="ArtistDAO" hint="constructor" >

		<cfreturn this />
	</cffunction>

	<!--- setters for dependencies --->
	<cffunction name="setDsn" returntype="void" access="public" output="false" hint="Dependency: datasource name">
		<cfargument name="DSN" type="string" required="true"/>
		<cfset variables.DSN = arguments.DSN />
	</cffunction>

	<cffunction name="setArtist" returnType="void" access="public" output="false" hint="Dependency: Artist">
		<cfargument name ="artist" type="model.Artist" required="true" />
		<cfset variables.artist =  arguments.artist />
	</cffunction>

	<!--- DAO methods --->
	<cffunction name="read" access="public" output="false" returnType="Artist" hint="return a populated artist bean">

		<cfargument name="artistID" type="numeric" required="true" />

		<cfset var qArtist = "" />

		<!--- If ArtistID is blank or Zero, bypass query and return the empty bean--->
		<!---<cfif val( arguments.Artist.getArtistID() ) gt 0> --->
		<cftry>
			<!--- run the query based on the ID loaded from the Listener function --->
			<cfquery name="qArtist" datasource="#variables.DSN#">
				SELECT  ARTISTID ,
						NAME ,
						EMAIL ,
						PHONE ,
						CITY ,
						COUNTRY ,
						USERNAME ,
						PASSWORD,
						ABOUT ,
						PROFILEIMAGE
				FROM ARTISTS
				WHERE ARTISTID = <cfqueryparam value="#arguments.artistID#" cfsqltype="cf_sql_numeric" />
			</cfquery>

			<!--- initialize the bean with data from the query --->
			<cfset variables.Artist.init(   ArtistID = qArtist.ARTISTID,
											Name = qArtist.NAME,
											Email = qArtist.EMAIL,
											Phone = qArtist.PHONE ,
											City = qArtist.CITY ,
											Country = qArtist.COUNTRY ,
											UserName = qArtist.USERNAME ,
											Password = qArtist.PASSWORD ,
											About = qArtist.ABOUT ,
											ProfileImage = qArtist.PROFILEIMAGE
										) />
		<cfcatch type="any" >
			<cflog file="Artist" text = "#error.type#" type = "error" >
		</cfcatch>
		</cftry>

		<!---</cfif>--->

		<!--- return the populated bean to the Listener function --->
		<cfreturn variables.Artist />

	</cffunction>

	<cffunction name="addArtist" access="public" output="false" returnType="boolean" hint="adding the details of artist" >
		<cfargument name="artistName" type="string" required="true" />
		<cfargument name="artistEmail" type="string" required="true" />
		<cfargument name="artistPhone" type="string" required="true" />
		<cfargument name="artistCity" type="string" required="true" />
		<cfargument name="artistCountry" type="string" required="true" />
		<cfargument name="artistUsername" type="string" required="true" />
		<cfargument name="artistPassword" type="string" required="true" />
		<cfargument name="artistAbout" type="string" required="true" />
		<cfargument name="artistProfileImage" type="string" required="true" />

		<cfset local.success = true />
		<cftry>
			<cfquery name="qAddArtist" datasource="#variables.DSN#" >
				INSERT INTO ARTISTS
				VALUES
				(
					<cfqueryparam value="#arguments.artistName#" cfsqltype="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.artistEmail#" cfsqltype="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.artistPhone#" cfsqltype="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.artistCity#" cfsqltype="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.artistCountry#" cfsqltype="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.artistUsername#" cfsqltype="cf_sql_varchar"> ,
					<cfqueryparam value="#arguments.artistPassword#" cfsqltype="cf_sql_varchar"> ,
					<cfqueryparam value="#arguments.artistAbout#" cfsqltype="cf_sql_varchar" /> ,
					<cfqueryparam value="#arguments.artistProfileImage#" cfsqltype="cf_sql_varchar" >
				)
			</cfquery>
			<cfcatch type="any" >
				<cfset local.success = false />
			</cfcatch>
		</cftry>

		<cfreturn local.success />
	</cffunction>

	<cffunction name="updateArtist" access="public" output="false" returnType="boolean" hint="update the details of artist" >
		<cfargument name="artistID" type="numeric" required="true" hint="id of artist" />
		<cfargument name="artistName" type="string" required="true" hint="name of the artist" />
		<cfargument name="artistEmail" type="string" required="true" hint="email of the artist" />
		<cfargument name="artistPhone" type="string" required="true" hint="phone of the artist" />
		<cfargument name="artistCity" type="string" required="true" hint="city of the artist" />
		<cfargument name="artistCountry" type="string" required="true" hint="country of the artist">
		<cfargument name="artistUsername" type="string" required="true" hint="username of the artist" />
		<cfargument name="artistPassword" type="string" required="true" hint="password of the artist" />
		<cfargument name="artistAbout" type="string" required="true" hint="details of the artist" />
		<cfargument name="artistProfileImage" type="string" required="false" hint="profileimage of the artist" />

		<cfset local.success = true />
		<cftry>

			<cfquery name="qUpdateArtist" datasource="#variables.DSN#" >
				UPDATE ARTISTS SET
				NAME     = <cfqueryparam value="#arguments.artistName#" cfsqltype="cf_sql_varchar" /> ,
				EMAIL    = <cfqueryparam value="#arguments.artistEmail#" cfsqltype="cf_sql_varchar" /> ,
				PHONE    = <cfqueryparam value="#arguments.artistEmail#" cfsqltype="cf_sql_varchar" /> ,
				CITY     = <cfqueryparam value="#arguments.artistPhone#" cfsqltype="cf_sql_varchar" /> ,
				COUNTRY  = <cfqueryparam value="#arguments.artistCountry#" cfsqltype="cf_sql_varchar" /> ,
				USERNAME = <cfqueryparam value="#arguments.artistUsername#" cfsqltype="cf_sql_varchar" /> ,
				PASSWORD = <cfqueryparam value="#arguments.artistPassword#" cfsqltype="cf_sql_varchar" /> ,
				ABOUT    = <cfqueryparam value="#arguments.artistAbout#" cfsqltype="cf_sql_varchar" />
				WHERE ARTISTID = <cfqueryparam value="#arguments.artistID#" cfsqltype="cf_sql_numeric" />
			</cfquery>

		<cfcatch type="any" >
			<cfset local.success = false />
		</cfcatch>
		</cftry>

		<cfreturn local.success />
	</cffunction>

</cfcomponent>