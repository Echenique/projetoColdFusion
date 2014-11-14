<cfif not parameterExists(#form.login#) and trim(#form.login#) NEQ "" and not parameterExists(#form.senha#) or trim(#form.senha#) EQ "">
	<cflocation url="error.cfml">
	<cflocation url="cadastrar.cfml">
</cfif>

<cfquery datasource="financas" name="check">
	<cfif parameterExists(#form.login#) and trim(#form.login#) NEQ "" and parameterExists(#form.senha#) and trim(#form.senha#) NEQ "">
		select login from usuarios where login='#form.login#'
	</cfif>
</cfquery>

<cfif check.recordcount NEQ "0">
	<cflocation url="error.cfml" addtoken="Yes">
<cfelse>
	<cfquery datasource="financas" name="cadastrar">
		INSERT INTO `usuarios` (`login`, `senha`) VALUES ('#form.login#', '#form.senha#')
	</cfquery>

<cfparam name="session.user" default="#form.login#">
<cfparam name="session.password" default="#form.senha#">

<cfquery datasource="financas" name="consultaID">
	select id from usuarios where login = '#form.login#'
</cfquery>
<cfset session.id = "#consultaID#">

</cfif>
<cflocation url="../index.cfml" addtoken="No">