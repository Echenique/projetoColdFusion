<cfquery datasource="financas" name="buscaPorId">
<cfif parameterExists(#url.id#) and trim(#url.id#) NEQ "">
	select * from `financas` where id = #url.id# and (`id_user`='#session.id#')
</cfif>
</cfquery>


<cfset buscaPorId.valor = #NumberFormat(buscaPorId.valor, ".00")#>
<cfinclude template="inc/cima.cfml">
<cfinclude template="inc/verificaLogin.cfml">

<script type="text/javascript">
        $(document).ready(function(){
              $(".dinheiro").maskMoney({ 
              	decimal:".", 
              	thousands:""
              });
        });
    </script>

	<form method="post" action="update.cfml" class="form-horizontal">
<fieldset>

<!-- Form Name -->
<legend>Editar Transacao</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="data">Data</label>  
  <div class="col-md-4">
  	<cfset dataForm = dateFormat(#buscaPorId.data#, "dd/mm/yyyy")>
  <input style="width: 120px;" type="text" name="update_data" value="<cfoutput>#dataForm#</cfoutput>" class="datepicker form-control input-md" required="" mask="dd/mm/yyyy"><a style="float: right;" href="delete.cfml?id=<cfoutput>#url.id#</cfoutput>">Deletar Registro <i class="glyphicon glyphicon-trash"></i></a>
  </div>
</div>

<!-- Multiple Radios (inline) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="transacao">tipo_transacao</label>
  <div class="col-md-4"> 
    <label class="radio-inline" for="transacao-0">
      <input type="radio" name="update_tipo_transacao" id="transacao-0" value="1">
      Receita
    </label> 
    <label class="radio-inline" for="transacao-1">
      <input type="radio" name="update_tipo_transacao" id="transacao-1" value="2">
      Despesa
    </label>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="descricao">Descricao</label>  
  <div class="col-md-4">
  <input id="descricao" name="update_descricao" type="text" value="<cfoutput>#buscaPorId.descricao#</cfoutput>" placeholder="" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="valor">Valor R$</label>  
  <div class="col-md-4">
  <input id="valor" name="update_valor" type="text" placeholder="" value="<cfoutput>#buscaPorId.valor#</cfoutput>" class="form-control input-md dinheiro" required="">
    
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label" for=""></label>
  <div class="col-md-4">
    <button id="" name="" type="submit" class="btn btn-primary">Adicionar</button>
  </div>
</div>
<input name="id" style="visibility: hidden" value="<cfoutput>#url.id#</cfoutput>">
</fieldset>
</form>

<cfinclude template="inc/baixo.cfml">

