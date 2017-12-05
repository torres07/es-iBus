<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<form:form method="post" modelAttribute="motorista" action="${url_base}/motoristas">
	<form:input path="id" type="hidden"  />
	<form:input path="somaAvaliacoes" value="0.0" type="hidden"/>
	
	<spring:bind path="nome">
	<div class="form-group ${status.error ? 'has-error' : ''}">
		<form:label path="nome">Nome</form:label>
		<form:input path="nome" type="text" cssClass="form-control" />
		<form:errors path="nome" class="control-label" />
	</div>
	</spring:bind>
	
	<spring:bind path="senha">
	<div class="form-group ${status.error ? 'has-error' : ''}">
		<form:label path="senha">Senha</form:label>
		<form:input path="senha" type="password" cssClass="form-control" />
		<form:errors path="senha" class="control-label" />
	</div>
	</spring:bind>
	
	<spring:bind path="telefone">
	<div class="form-group ${status.error ? 'has-error' : ''}">
		<form:label path="telefone">Telefone</form:label>
		<form:input path="telefone" type="text" cssClass="form-control" />
		<form:errors path="telefone" class="control-label" />
	</div>
	</spring:bind>
	
	<button type="submit" class="btn btn-primary">Salvar</button>
</form:form>