<cfquery datasource="financas" name="delete">
		delete from `financas` where id = '#url.id#' and (`id_user`='#session.id#')
</cfquery>

<cflocation url="index.cfml" addtoken="No">