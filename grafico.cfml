<cfinclude template="inc/verificaLogin.cfml">
<cfinclude template="inc/cima.cfml">

<form method="post" action="grafico.cfml">
	<input style="width: 120px;" type="text" name="data1" value="<cfoutput>#dateFormat(now()-15,'dd/mm/yyyy')#</cfoutput>" class="datepicker form-control" mask="dd/mm/yyyy">
	<input style="width: 120px;" type="text" name="data2" value="<cfoutput>#dateFormat(now()+15,'dd/mm/yyyy')#</cfoutput>" class="datepicker form-control" mask="dd/mm/yyyy">
	<input type="submit" class="btn btn-primary">
</form>

<br /><br />1 - Receita<br />2 - Despesa<br />
<cfchart format="jpg">
	<cfchartseries type="pie" seriescolor="FFD800" query="financas" itemcolumn="tipo_transacao" valuecolumn="tipo_transacao"> 

	</cfchartseries>
</cfchart>

<cfinclude template="inc/baixo.cfml">