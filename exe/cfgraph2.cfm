<cfquery name="produtos" datasource="produtos">
select * from produtos
</cfquery>
<html>
<head>
<title>CFGraph</title>
</head>
<body>
<cfgraph query="produtos" type="bar" valueColumn="qtd" itemColumn="produto">
</cfgraph>
</body>
</html>