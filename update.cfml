<cfinclude template="inc/verificaLogin.cfml">
<cfinclude template="inc/cima.cfml">

<cfquery datasource="financas" name="update">
	
	<cfif parameterExists(#form.update_tipo_transacao#) and parameterExists(#form.update_descricao#) and parameterExists(#form.update_data#) and parameterExists(#form.update_valor#)>
		<cfset arr_data1 = ListToArray(form.update_data, "/")>
		<cfset data = "#arr_data1[3]#-#arr_data1[2]#-#arr_data1[1]#">
		<cfif #form.update_tipo_transacao# is '2'>
				<cfset update_valor = -1*#form.update_valor#>
			<cfelse>
				<cfset update_valor = #form.update_valor#>
		</cfif>
		UPDATE `financas` 
		SET 
			`valor`='#update_valor#',
			`tipo_transacao`='#form.update_tipo_transacao#',
			`Descricao`='#form.update_descricao#',
			`data`='#data#'
		WHERE (`id`='#form.id#') and (`id_user`='#session.id#')
	</cfif>	
</cfquery>
<cflocation url="index.cfml">
	<cfinclude template="inc/baixo.cfml">