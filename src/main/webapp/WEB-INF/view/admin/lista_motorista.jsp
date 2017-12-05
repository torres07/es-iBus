<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="url_base" value="/" />
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Itinerário</title>
	<link rel="stylesheet" href="${url_base}css/bootstrap.min.css"/>
</head>
<body>
<jsp:include page="${url_base}WEB-INF/view/navbar.jsp"/>
<div class="container">
	<h1>Motoristas</h1>
	<c:if test="${not empty msg}">
		<div class="alert alert-success alert-dismissible" role="alert">
		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<p>${msg}</p>
		</div>
	</c:if>
	<a href="/motoristas/add" class="btn btn-primary">Adicionar motorista</a>
	<table id="tabela_motoristas" class="table table-hover">
		<thead>
			<tr><th>ID</th><th>Nome</th><th>Telefone</th><th>Avaliação</th><th>Ações</th></tr>
		</thead>
		<c:if test="${not empty motoristas}">
			<tbody>
				<c:forEach var="c" items="${motoristas}">
					<tr><td>${c.id}</td><td>${c.nome}</td><td>${c.telefone}</td><td>${c.somaAvaliacoes}</td>
					<td><a href="${url_base}motoristas/${c.id}/avaliacoes" class="btn btn-info">Lista de avaliações</a>
					<a href="${url_base}motoristas/${c.id}/update" class="btn btn-primary">Altera</a>
					<a href="${url_base}motoristas/${c.id}/delete" class="btn btn-danger" onclick="return confirm('Confirma remoção?')" >Deleta</a>
					</td>
					</tr>
				</c:forEach>
			</tbody>
		</c:if>
	</table>
</div>
<script src="${url_base}js/jquery-3.2.1.min.js"></script>
<script src="${url_base}js/bootstrap.min.js"></script>
<script>
</script>
</body>
</html>