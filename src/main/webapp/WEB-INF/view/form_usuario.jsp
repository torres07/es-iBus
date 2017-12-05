<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<form:form method="post" modelAttribute="usuario" action="${url_base}/usuarios">

	<spring:bind path="matricula">
	<div class="form-group ${status.error ? 'has-error' : ''}">
		<form:label path="matricula">Matricula</form:label>
		<form:input path="matricula" type="text" cssClass="form-control" />
		<form:errors path="matricula" class="control-label" />
	</div>
	</spring:bind>
	
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
	
	<spring:bind path="tipo">
	<div class="form-group ${status.error ? 'has-error' : ''}">
		<br>
		<form:hidden path="tipo" value="Aluno"/>
	</div>
	</spring:bind>
	
	<button type="submit" class="btn btn-primary">Salvar</button>
</form:form>