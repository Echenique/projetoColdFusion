<cfif not isDefined('form.login') OR not isDefined('form.senha')>
	<cflocation url="login.cfml">
</cfif>

<cfquery datasource="financas" name="login">
	<cfif parameterExists(#form.login#) and parameterExists(#form.senha#)>
		select * from usuarios where login='#form.login#' and senha='#form.senha#'
	</cfif>
</cfquery>

<cfif login.recordcount EQ "0">
	<cflocation url="error.cfml" addtoken="Yes">
	<cfset session.isAutenticate = false>
<cfelse>
	<cfset session.isAutenticate = true>
</cfif>

<cfparam name="session.user" default="#login.login#">
<cfparam name="session.password" default="#login.senha#">
<cfset session.id = "#login.id#">

<cflocation url="../index.cfml" addtoken="No">