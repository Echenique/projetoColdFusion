<cfif not parameterExists(#session.isAutenticate#)>
	<cfset session.isAutenticate = false>
</cfif>
<cfif #session.isAutenticate# EQ false>
	<cflocation url="login.cfml">
</cfif>