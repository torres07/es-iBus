<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<form:form method="post" modelAttribute="itinerario" action="${url_base}/itinerario">
	<form:input path="id" type="hidden"  />
	
	<spring:bind path="origem">
	<div class="form-group ${status.error ? 'has-error' : ''}">
		<form:label path="origem">Origem</form:label>
		<form:select path="origem">
			<form:option value="UFC/IFCE">UFC/IFCE</form:option>
			<form:option value="Centro">Centro</form:option>
		</form:select>
	</div>
	</spring:bind>
	
	<spring:bind path="destino">
	<div class="form-group ${status.error ? 'has-error' : ''}">
		<form:label path="destino">Destino</form:label>
		<form:select path="destino">
			<form:option value="UFC/IFCE">UFC/IFCE</form:option>
			<form:option value="Centro">Centro</form:option>
		</form:select>
	</div>
	</spring:bind>
	
	<spring:bind path="turno">
	<div class="form-group ${status.error ? 'has-error' : ''}">
		<form:label path="turno">Turno</form:label>
		<form:select path="turno">
			<form:option value="Manhã">Manhã</form:option>
			<form:option value="Tarde">Tarde</form:option>
			<form:option value="Noite">Noite</form:option>
		</form:select>
	</div>
	</spring:bind>
	
	<spring:bind path="inicio">
	<div class="form-group ${status.error ? 'has-error' : ''}">
		<form:label path="inicio">Começando</form:label>
		<form:input path="inicio" type="text" cssClass="form-control timepicker1" />
		<form:errors path="inicio" class="control-label" />
	</div>
	</spring:bind>
	
	<spring:bind path="fim">
	<div class="form-group ${status.error ? 'has-error' : ''}">
		<form:label path="fim">Encerrando</form:label>
		<form:input path="fim" type="text" cssClass="form-control timepicker1" />
		<form:errors path="fim" class="control-label" />
	</div>
	</spring:bind>
	
	<button type="submit" class="btn btn-primary">Salvar</button>
</form:form>