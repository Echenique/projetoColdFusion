<!--- VERIFICAR POR QUE ENTRA NO IF QUANDO NAO COLOCA DATA --->

<cfquery datasource="financas" name="financas">
	<cfif parameterExists(#form.data1#) or parameterExists(#form.data2#)>
		<cfif parameterExists(#form.data1#) and trim(#form.data1#) NEQ "">
				<cfset arr_data1 = ListToArray(form.data1, "/")>
				<cfset data1 = "#arr_data1[3]#-#arr_data1[2]#-#arr_data1[1]#">
		</cfif>
		<cfif parameterExists(#form.data2#) and trim(#form.data2#) NEQ "">
				<cfset arr_data2 = ListToArray(form.data2, "/")>
				<cfset data2 = "#arr_data2[3]#-#arr_data2[2]#-#arr_data2[1]#">
		</cfif>
		<cfif parameterExists(#data1#) and trim(#data1#) NEQ "" and not parameterExists(#data2#) or trim(#data2#) EQ "">
			select * from `financas` where data >= '#data1#' and (`id_user`='#session.id#')
		</cfif>
		<cfif parameterExists(#data2#) and trim(#data2#) NEQ "" and not parameterExists(#data1#) or trim(#data1#) EQ "">
			select * from `financas` where data <= '#data2#' and (`id_user`='#session.id#')
		</cfif>
		<cfif parameterExists(#data1#) and trim(#data1#) NEQ "" and parameterExists(#data2#) and trim(#data2#) NEQ "">
			select * from `financas` where data >= '#data1#' and data <= '#data2#' and (`id_user`='#session.id#')
		</cfif>
	<cfelse>
		select * from `financas` where (`id_user`='#session.id#') order by data desc
	</cfif>
</cfquery>

<cfquery datasource="financas" name="total">
	<cfif parameterExists(#form.data1#) and trim(#form.data1#) NEQ "">
		<cfset arr_data1 = ListToArray(form.data1, "/")>
		<cfset data1 = "#arr_data1[3]#-#arr_data1[2]#-#arr_data1[1]#">
	</cfif>
	<cfif parameterExists(#form.data2#) and trim(#form.data2#) NEQ "">
		<cfset arr_data2 = ListToArray(form.data2, "/")>
		<cfset data2 = "#arr_data2[3]#-#arr_data2[2]#-#arr_data2[1]#">
	</cfif>

	<cfif parameterExists(#data1#) and not parameterExists(#data2#)>
		select sum(valor) as total from `financas` where data >= '#data1#' and (`id_user`='#session.id#')
	</cfif>
	<cfif parameterExists(#data2#) and not parameterExists(#data1#)>
		select sum(valor) as total from `financas` where data <= '#data2#' and (`id_user`='#session.id#')
	</cfif>
	<cfif parameterExists(#data1#) and parameterExists(#data2#)>
		select sum(valor) as total from `financas` where data >= '#data1#' and data <= '#data2#' and (`id_user`='#session.id#')
	<cfelse>
		select sum(valor) as total from `financas` where (`id_user`='#session.id#')
	</cfif>
</cfquery>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
  	<script src="js/jquery.js"></script>
  	<script src="js/jquery.ui.js"></script>
  	<script src="js/jquery.maskMoney.js"></script>
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="css/layout.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<script src="js/bootstrap.min.js"></script>

	<title>Controle de Financas simples</title>
</head>
<body>
	<nav class="navbar navbar-inverse" role="navigation">
  <div class="container">
    <ul class="nav navbar-nav">
		<li><i class="glyphicon glyphicon-tower"></i></li>
		<li><a href="index.cfml">Home</a></li>
		<li><a href="incluir.cfml">Nova Transacao</a></li>
		<li><a href="grafico.cfml">Grafico</a></li>
		<!--- <li><a href="teste.cfml">Area de Teste</a></li> --->
		<li><a href="inc/logout.cfml">Logout</a></li>
	</ul>
  </div>
</nav>	
	
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<cfif parameterExists(#session.user#)>
				<cfoutput>Logado como: #session.user#</cfoutput>	
			</cfif>
			