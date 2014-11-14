<cfinclude template="inc/cima.cfml">


<cfform class="form-horizontal" method="POST" action="inc/cadastrar.cfml">
<fieldset>

<!-- Form Name -->
<legend>Cadastrar</legend>

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
    <button id="btEntrar" name="btEntrar" class="btn btn-primary">Cadastrar</button>
  </div>
</div>

</fieldset>
</cfform>

<cfinclude template="inc/baixo.cfml">