<cfinclude template="inc/verificaLogin.cfml">
<cfinclude template="inc/cima.cfml">

	<table style="margin-top: 10px" class="table">
		<thead>
			<tr>
				<th>
					ID
				</th>
				<th>
					Data
				</th>
				<th>
					Tipo
				</th>
				<th>
					Descricao
				</th>
				<th style="width: 120px;">
					Valor
				</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr><form method="post" action="index.cfml">
				<td></td>
				<td><input style="width: 120px;" type="text" name="data1" value="<cfoutput>#dateFormat(now()-15,'dd/mm/yyyy')#</cfoutput>" class="datepicker form-control date1" mask="dd/mm/yyyy">
					<input style="width: 120px;" type="text" name="data2" value="<cfoutput>#dateFormat(now()+15,'dd/mm/yyyy')#</cfoutput>" class="datepicker form-control date2" mask="dd/mm/yyyy">
					<input type="submit" class="btn btn-primary">
				</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</form>
			</tr>
			<cfoutput query="financas">
				<tr>
					<td>
						#id#
					</td>
					<td>
						#DateFormat(data, "dd/mm/yyyy")#
					</td>
					<td>
						<cfif #tipo_transacao# IS '1'>
							Receita
							<cfelse>
								Despesa
						</cfif>
					</td>
					<td>
						#Descricao#
					</td>
					<td>
						R$ #NumberFormat(valor, ".00")#
					</td>
					<td><a href="edit.cfml?id=#id#"><i class="glyphicon glyphicon-edit"></i></a></td>
				</tr>
			</cfoutput>
			<tr>
				<td></td><td></td><td></td><td></td>
				<cfoutput query="total">
				<td><B>TOTAL: <br>R$ #total#</B></td><td></td>
				</cfoutput>
			</tr>
		</tbody>
	</table>
<cfinclude template="inc/baixo.cfml">