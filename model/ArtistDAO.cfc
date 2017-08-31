<!---
  --- ArtistDAO
  --- ---------
  ---
  --- author: mindfire
  --- date:   8/28/17
  --->
<cfcomponent name="ArtistDAO" output="false" hint="Data Access Object for Artist" >

	<cffunction name="init" access="public" output="false" returnType="ArtistDAO" hint="constructor" >

		<cfargument name="DSN" type="string" required="true" hint="datasource" />

		<cfset variables.DSN = arguments.DSN />

		<cfreturn this />

	</cffunction>

	<cffunction name="read" access="public" output="false" returnType="Artist" hint="return a populated artist bean">

		<cfargument name="Artist" type="Artist" required="true" hint="The arguments accepts a Artist bean." />

		<cfset var qArtist = "" />

		<!--- If ArtistID is blank or Zero, bypass query and return the empty bean--->
		<cfif val( arguments.Artist.getArtistID() ) gt 0>

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
				WHERE ARTISTID = <cfqueryparam value="#arguments.Artist.getArtistID()#" cfsqltype="cf_sql_numeric" />
			</cfquery>

			<!--- re-initialize the bean with data from the query --->
			<cfset arguments.Artist.init(   ArtistID = qArtist.ARTISTID,
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

		</cfif>

		<!--- return the populated bean to the Listener function --->
		<cfreturn arguments.Artist />

	</cffunction>

</cfcomponent>