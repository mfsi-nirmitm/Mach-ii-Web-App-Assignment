<cfcomponent
	displayname="Application"
	extends="MachII.mach-ii"
	output="false">

	<!---
	PROPERTIES - APPLICATION SPECIFIC
	--->
	<cfset this.name = "AppName" />
	<cfset this.loginStorage = "session" />
	<cfset this.sessionManagement = true />
	<cfset this.setClientCookies = true />
	<cfset this.setDomainCookies = false />
	<cfset this.sessionTimeOut = CreateTimeSpan(0,1,0,0) />
	<cfset this.applicationTimeOut = CreateTimeSpan(1,0,0,0) />


	<!---
		Most of the rest of the properties, methods, etc. have "intelligent defaults"
		set in MachII.mach-ii (which Application.cfc extends). The typical Mach-II
		properties such as MACHII_CONFIG_PATH, MACHII_APP_KEY, MACHII_CONFIG_MODE, etc.
		can be overridden here, as can the Application CFC methods to which you wish
		to add custom functionality.

		If you do override any of the methods, make sure to call super or copy/paste
		the contents from MachII.mach-ii into your overridden methods. This is particularly
		important with:
		* onApplicationStart(): this must call loadFramework()
		* onRequestStart(): this must call handleRequest()
	--->
	<!---
	PROPERTIES - MACH-II SPECIFIC
	--->
	<!---Set the path to the application's mach-ii.xml file --->
	<cfset MACHII_CONFIG_PATH = expandPath("./config/mach-ii.xml") />
	<!--- Set the app key for sub-applications within a single cf-application. --->
	<cfset MACHII_APP_KEY =  getFileFromPath(ExpandPath(".")) />
	<!--- Set the configuration mode (when to reinit): -1=never, 0=dynamic, 1=always --->
	<cfset MACHII_CONFIG_MODE = 1 />
	<!--- Whether or not to validate the configuration XML before parsing. Default to false. --->
	<cfset MACHII_VALIDATE_XML = false />
	<!--- Set the path to the Mach-II's DTD file. --->
	<cfset MACHII_DTD_PATH = expandPath("/MachII/mach-ii_1_1_1.dtd") />


	<!--- onApplicationStart method called at the time of application run --->
	<cffunction name="onApplicationStart" returnType="void" output="false" hint="Only runs when the App is started.">

		<cfsetting requesttimeout="120" />

		<cfset application.startTime = now() />
		<cfset application.DSN = "artist" />
		<cfset loadFramework() />

	</cffunction>

	<cffunction name="onRequestStart" returnType="void" output="true" hint="Run at the start of a page request.">
		<cfargument name="targetPage" type="string" required="true" />

		<!--- Request Scope Variable Defaults --->
		<cfset request.self = "index.cfm">

		<!---
			***** Coldfusion Primer: Set the datasource into the request scope
		--->
		<cflock scope="application" timeout="1" type="readonly">
			<cfset request.DSN = application.DSN />
		</cflock>

		<!--- Set per session cookies if not using J2EE session management --->
		<cfif StructKeyExists(session, "cfid") AND (NOT StructKeyExists(cookie, "cfid") OR NOT StructKeyExists(cookie, "cftoken"))>
			<cfcookie name="cfid" value="#session.cfid#" />
			<cfcookie name="cftoken" value="#session.cftoken#" />
		</cfif>

		<!--- Temporarily override the default config mode
			Set the configuration mode (when to reinit): -1=never, 0=dynamic, 1=always --->
		<cfif StructKeyExists(url, "reinit")>
			<cfsetting requesttimeout="120" />
			<cfset MACHII_CONFIG_MODE = 1 />
		</cfif>

		<!--- Handle the request. Make sure we only process Mach-II requests. --->
		<cfif findNoCase('index.cfm', listLast(arguments.targetPage, '/'))>
			<cfset handleRequest() />
		</cfif>
	</cffunction>
</cfcomponent>