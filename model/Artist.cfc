<!---
  --- NewCFComponent
  --- --------------
  ---
  --- author: mindfire
  --- date:   8/28/17
  --->
<cfcomponent name="Artist" hint="This is a Artist Bean">

	<cfset variables.instance.ArtistID = 0   />
	<cfset variables.instance.Name = "" />
	<cfset variables.instance.Email = "" />
	<cfset variables.instance.Phone="" />
	<cfset variables.instance.City="" />
	<cfset variables.instance.Country="" />
	<cfset variables.instance.UserName=""  />
	<cfset variables.instance.Password="" />
	<cfset variables.instance.About=""  />
	<cfset variables.instance.ProfileImage="" />

	<cffunction name="init" displayname="init" hint="bean for artist" access="public" output="false" returntype="Artist" >

		<cfargument name="ArtistID" type="numeric" required="false" default="0" hint="Artist_ID" />
		<cfargument name="Name" type="string" required="false" default="" hint="name of the artist" />
		<cfargument name="Email" type="string" required="false" default="" hint="email of the artist" />
		<cfargument name="Phone" type="string" required="false" default="" hint="contact number of the artist" />
		<cfargument name="City" type="string" required="false" default="" hint="city of the artist" />
		<cfargument name="Country" type="string" required="false" default="" hint="country of the artist" />
		<cfargument name="UserName" type="string" required="false" default="" hint="username of the artist" />
		<cfargument name="Password" type="string" required="false" default="" hint="password of the artist" />
		<cfargument name="About" type="string" required="false" default="" hint="description about the artist" />
		<cfargument name="ProfileImage" type="string" required="false" default="" hint="profile image of the artist" />

		<cfset setArtistID(arguments.ArtistID) />
		<cfset setName(arguments.Name) />
		<cfset setEmail(arguments.Email) />
		<cfset setPhone(arguments.Phone) />
		<cfset setCity(arguments.City) />
		<cfset setCountry(arguments.Country) />
		<cfset setUserName(arguments.UserName) />
		<cfset setPassword(arguments.Password) />
		<cfset setAbout(arguments.About) />
		<cfset setProfileImage(arguments.ProfileImage)>

		<cfreturn this />

	</cffunction>

	<cffunction name="getArtistID" access="public" hint="Getter for ArtistID" output="false" returnType="numeric">
		<cfreturn variables.instance.ArtistID />
	</cffunction>

	<cffunction name="setArtistID" access="private" hint="Setter for ArtistID" output="false" returnType="void">
		<cfargument name="ArtistID" hint="ARTIST_ID" required="yes" type="numeric" />
		<cfset variables.instance.ArtistID = arguments.ArtistID />
	</cffunction>

	<cffunction name="getName" access="public" hint="Getter for Name" output="false" returnType="string" >
		<cfreturn variables.instance.Name />
	</cffunction>

	<cffunction name="setName" access="private" hint="Setter for Name" output="false" returnType="void">
		<cfargument name="Name" hint="name of the artist" required="true" type="string"  />
		<cfset variables.instance.Name = arguments.Name />
	</cffunction>

	<cffunction name="getEmail" access="public" hint="Getter for email of artist" output="false" returnType="string" >
		<cfreturn variables.instance.Email />
	</cffunction>

	<cffunction name="setEmail" access="private" hint="Setter for the email of artist" output="false" returnType="void">
		<cfargument name="Email" hint="email of the artist" required="true" type="string" />
		<cfset variables.instance.Email = arguments.Email />
	</cffunction>

	<cffunction name="getPhone" access="public" hint="Getter for phone" output="false" returnType="string" >
		<cfreturn variables.instance.Phone />
	</cffunction>

	<cffunction name="setPhone" access="private" hint="Setter for Phone" output="false" returnType="void"  >
		<cfargument name="Phone" hint="phone of the artist" required="true" type="string" />
		<cfset variables.instance.Phone = arguments.Phone />
	</cffunction>

	<cffunction name="getCity" access="public" hint="Getter for City" output="false" returnType="string" >
		<cfreturn variables.instance.City />
	</cffunction>

	<cffunction name="setCity" access="private" hint="Setter for City" output="false" returnType="void">
		<cfargument name="City" hint="city of the artist" required="true" type="string">
		<cfset variables.instance.City=arguments.City  />
	</cffunction>

	<cffunction name="getCountry" access="public" hint="Getter for Country" output="false" returnType="string" >
		<cfreturn variables.instance.Country  />
	</cffunction>

	<cffunction name="setCountry" access="private" hint="Setter for Country" output="false" returnType="void">
		<cfargument name="Country" hint="country of the artist" required="true" type="string" />
		<cfset variables.instance.Country = arguments.Country />
	</cffunction>

	<cffunction name="getUserName" access="public" hint="Getter for Username" output="false" returnType="string">
		<cfreturn variables.instance.UserName />
	</cffunction>

	<cffunction name="setUserName" access="private" hint="Setter fot Username" output="false" returnType="void" >
		<cfargument name="UserName" hint="username of the artist" required="true" type="string" />
		<cfset variables.instance.UserName = arguments.UserName />
	</cffunction>

	<cffunction name="getPassword" access="public" hint="Getter for Password" output="false" returnType="string" >
		<cfreturn variables.instance.Password />
	</cffunction>

	<cffunction name="setPassword" access="private" hint="Setter for Password" output="false" returnType="void" >
		<cfargument name="Password" hint="Password fo the artist" required="true" type="string" />
		<cfset variables.instance.Password = arguments.Password />
	</cffunction>

	<cffunction name="getAbout" access="public" hint="Getter for About" output="false" returnType="string" >
		<cfreturn variables.instance.About />
	</cffunction>

	<cffunction name="setAbout" access="private" hint="Setter for About" output="false" returnType="void" >
		<cfargument name="About" hint="about artist" required="true" type="string" />
		<cfset variables.instance.About = arguments.About  />
	</cffunction>

	<cffunction name="getProfileImage" access="public" hint="Getter for ProfileImage" output="false" returnType="string" >
		<cfreturn variables.instance.ProfileImage />
	</cffunction>

	<cffunction name="setProfileImage" access="private" hint="Setter for ProfileImage" output="false" returnType="void" >
		<cfargument name="ProfileImage" hint="profile image of artist" required="true" type="string" />
		<cfset variables.instance.ProfileImage = arguments.ProfileImage />
	</cffunction>
</cfcomponent>