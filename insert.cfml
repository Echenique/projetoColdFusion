<cfinclude template="inc/verificaLogin.cfml">
<cfinclude template="inc/cima.cfml">

<cfquery datasource="financas" name="insert">
	
	<cfif parameterExists(#form.insert_tipo_transacao#) and parameterExists(#form.insert_descricao#) and parameterExists(#form.insert_data#) and parameterExists(#form.insert_valor#)>
		<cfset arr_data1 = ListToArray(form.insert_data, "/")>
		<cfset data = "#arr_data1[3]#-#arr_data1[2]#-#arr_data1[1]#">
		<cfif #form.insert_tipo_transacao# is '2'>
				<cfset insert_valor = -1*#form.insert_valor#>
			<cfelse>
				<cfset insert_valor = #form.insert_valor#>
		</cfif>
		insert into `financas` (`id_user`,`tipo_transacao`, `Descricao`, `data`, `valor`)
		values ('#session.id#','#form.insert_tipo_transacao#', '#form.insert_descricao#', "#data#", '#insert_valor#')
	</cfif>	
</cfquery>
<cflocation url="index.cfml">
	<cfinclude template="inc/baixo.cfml">