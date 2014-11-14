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

	<form method="post" action="insert.cfml" class="form-horizontal">
<fieldset>

<!-- Form Name -->
<legend>Incluir Nova Transacao</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="data">Data</label>  
  <div class="col-md-4">
  <input style="width: 120px;" type="text" name="insert_data" value="<cfoutput>#dateFormat(now(),'dd/mm/yyyy')#</cfoutput>" class="datepicker form-control input-md" required="" mask="dd/mm/yyyy">
  </div>
</div>

<!-- Multiple Radios (inline) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="transacao">tipo_transacao</label>
  <div class="col-md-4"> 
    <label class="radio-inline" for="transacao-0">
      <input type="radio" name="insert_tipo_transacao" id="transacao-0" value="1">
      Receita
    </label> 
    <label class="radio-inline" for="transacao-1">
      <input type="radio" name="insert_tipo_transacao" id="transacao-1" value="2">
      Despesa
    </label>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="descricao">Descricao</label>  
  <div class="col-md-4">
  <input id="descricao" name="insert_descricao" type="text" placeholder="" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="valor">Valor R$</label>  
  <div class="col-md-4">
  <input id="valor" name="insert_valor" type="text" placeholder="0.00" class="form-control input-md dinheiro" required="">
    
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label" for=""></label>
  <div class="col-md-4">
    <button id="" name="" class="btn btn-primary">Adicionar</button>
  </div>
</div>
</fieldset>
</form>


<cfinclude template="inc/baixo.cfml">