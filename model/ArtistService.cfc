<!---
  --- ArtistService
  --- -------------
  ---
  --- author: mindfire
  --- date:   8/31/17
  --->
<cfcomponent name="ArtistService" hint="Service for record Artist" >

	<cffunction name="init" returntype="model.ArtistService" access="public" output="false" >

		<cfreturn this />
	</cffunction>

	<!--- setters for dependencies --->
	<cffunction name="setArtistDAO" returnType="void" access="public" output="false" hint="Dependency">
		<cfargument name="artistDAO" type="model.ArtistDAO" required="true" />
		<cfset variables.artistDAO = arguments.artistDAO />
	</cffunction>

	<cffunction name="setArtistGateway" returnType="void" access="public" output="false" hint="Dependency:">
		<cfargument name="artistGateway"  type="model.ArtistGateway" required ="true" />
		<cfset variables.artistGateway = arguments.artistGateway />
	</cffunction>

	<cffunction name="setArtist" returnType="void" access="public" output="false" hint="Dependency">
		<cfargument name="artist" type="model.Artist" required="true" >
		<cfset variables.artist = arguments.artist />
	</cffunction>
	<!--- service methods --->

	<cffunction name="getAllArtists" access="public" output="false" returnType="query" hint="returns all the name and images of artists" >
		<cfreturn  variables.artistGateway.getAllArtists() />
	</cffunction>

	<cffunction name="getArtist" access="public" output="false" returnType="model.Artist" hint="retrieving the artist detail">
		<cfargument name="artistID" type="numeric" required="true" />
		<cfreturn variables.artistDAO.read(arguments.artistID) />
	</cffunction>

	<cffunction name="getLogin" access="public" output="false" returnType = "boolean" hint="check authorization for login" >
		<cfargument name="login_user" type="string" required ="true"  />
		<cfargument name="login_password" type="string" required ="true" />

		<cfreturn variables.artistGateway.getLogin(arguments.login_user,arguments.login_password) />
	</cffunction>

	<cffunction name="getLogout" access="public" output="false" returnType="void" hint="logout the artist">
		<cfif structKeyExists(session,'loggedIn')>
			<cfset structDelete(session,'loggedIn') />
		</cfif>
	</cffunction>

	<cffunction name="isEmailExists" access="public" output="false" returnType="boolean" hint="check email in database" >
		<cfargument name="artistEmail" type="string" required="true" hint="email of the artist" />
		<cfreturn variables.artistGateway.isEmailExists(arguments.artistEmail) />
	</cffunction>

	<cffunction name="isUsernameExists" access="public" output="false" returnType="boolean" hint="check username in database" >
		<cfargument name="artistUsername" type="string" required="true" hint="username of the artist" />
		<cfreturn variables.artistGateway.isUsernameExists(arguments.artistUsername) />
	</cffunction>

	<cffunction name="addArtist" access="public" output="false" returnType="void" hint="adding artist details">
		<cfargument name="artistName" type="string" required="true" hint="name of the artist" />
		<cfargument name="artistEmail" type="string" required="true" hint="name of the artist" />
		<cfargument name="artistPhone" type="string" required="true" hint="phone of the artist" />
		<cfargument name="artistCity" type="string" required="true" hint="city of the artist" />
		<cfargument name="artistCountry" type="string" required="true" hint="country of the artist" />
		<cfargument name="artistUsername" type="string" required="true" hint="username of the artist" />
		<cfargument name="artistPassword" type="string" required="true" hint="password of the artist" />
		<cfargument name="artistAbout" type="string" required="false" hint="about the artist" default="No Details available." />
		<cfargument name="artistProfileImage" type="string" required="false" hint="image of the artist" default="/assets/artist/0.jpg" />

		<cfset variables.artist.init(		Name = arguments.artistName ,
											Email = arguments.artistEmail ,
											Phone = arguments.artistPhone ,
											City = arguments.artistCity ,
											Country = arguments.artistCountry ,
											UserName = arguments.artistUsername ,
											Password = arguments.artistPassword ,
											About = arguments.artistAbout ,
											ProfileImage = arguments.artistProfileImage
										) />

		<cfset variables.artistDAO.addArtist(variables.artist) />

	</cffunction>

	<cffunction name="isUsernameOfOtherArtist" access="public" output="false" returnType="boolean" hint="check username with other artist">
		<cfargument name="artistID" type="numeric" required="true" hint="id of artist" />
		<cfargument name="artistUsername" type="string" required="true" hint="username of artist" />
		<cfreturn variables.artistGateway.isUsernameOfOtherArtist(arguments.artistID, arguments.artistUsername)  />
	</cffunction>

	<cffunction name="isEmailOfOtherArtist" access="public" output="false" returnType="boolean" hint="check email with other artist" >
		<cfargument name="artistID" type="numeric" required="true" hint="id of artist" />
		<cfargument name="artistEmail" type="string" required="true" hint="email of artist" />
		<cfreturn variables.artistGateway.isEmailOfOtherArtist(arguments.artistID,arguments.artistEmail) />
	</cffunction>

	<cffunction name="updateArtist" access="public" output="false" returnType="void" hint="updating the artist details" >
		<cfargument name="artistID" type="numeric" required="true" hint="id of artist" />
		<cfargument name="artistName" type="string" required="true" hint="name of the artist" />
		<cfargument name="artistEmail" type="string" required="true" hint="email of the artist" />
		<cfargument name="artistPhone" type="string" required="true" hint="phone of the artist" />
		<cfargument name="artistCity" type="string" required="true" hint="city of the artist" />
		<cfargument name="artistCountry" type="string" required="true" hint="country of the artist">
		<cfargument name="artistUsername" type="string" required="true" hint="username of the artist" />
		<cfargument name="artistPassword" type="string" required="true" hint="password of the artist" />
		<cfargument name="artistAbout" type="string" required="true" hint="details of the artist" />
		<cfargument name="artistProfileImage" type="string" required="false" hint="image of the artist" default="/assets/artist/0.jpg" />

		<cfset variables.artist.init( 		ArtistID = arguments.artistID,
											Name = arguments.artistName,
											Email = arguments.artistEmail ,
											Phone = arguments.artistPhone ,
											City = arguments.artistCity ,
											Country = arguments.artistCountry ,
											UserName = arguments.artistUsername ,
											Password = arguments.artistPassword ,
											About = arguments.artistAbout ,
											ProfileImage = arguments.artistProfileImage
									) />
		<cfset variables.artistDAO.updateArtist(variables.artist) />
	</cffunction>

	<cffunction name="updateProfileImage" access="public" output="false" returnType="void" hint="updating the profile image of artist">
		<cfargument name="artistID" type="numeric" required="true" hint="i'd of an artist" />
		<cfargument name="artistProfileImage" type="string" required="true" hint="profile image of artist" />

		<cfset variables.artistGateway.updateProfileImage(arguments.artistID,arguments.artistProfileImage) />
	</cffunction>
</cfcomponent>