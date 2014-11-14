<cfset session.id = "0">

<cflock timeout="15" name="session.sessionID" type="EXCLUSIVE">
<cfif isDefined('session.user')>
<cfset StructDelete(session,"user")>
</cfif>
<cfif isDefined('session.password')>
<cfset StructDelete(session,"password")>
</cfif>
<cfif isDefined('session.system')>
<cfset StructDelete(session,"system")>
</cfif>
<cfif isDefined('session.permissao')>
<cfset StructDelete(session,"permissao")>
</cfif>
</cflock>

<cfinclude template="inc/cima.cfml">

<cfform class="form-horizontal" method="POST" action="inc/validate.cfml">
<fieldset>

<!-- Form Name -->
<legend>Entrar</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="login">Login</label>  
  <div class="col-md-4">
  <cfinput name="login" type="text" placeholder="user" class="form-control input-md" required="yes">
    
  </div>
</div>

<!-- Password input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="senha">Senha</label>
  <div class="col-md-4">
    <cfinput name="senha" type="password" placeholder="*********" class="form-control input-md" required="yes">
    
  </div>
</div>

<!-- Button --> 
<div class="form-group">
	<label class="col-md-4 control-label" for="btEntrar"></label>
	<div class="col-md-4">
		<button id="btEntrar" name="btEntrar" class="btn btn-primary">Entrar</button>
		<a style="float: right;" href="novo-usuario.cfml">Cadastre-se</a>
	</div>
</div>

</fieldset>
</cfform>



<cfinclude template="inc/baixo.cfml">