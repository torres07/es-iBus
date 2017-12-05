<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="url_base" value="/" />
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Usuários</title>
	<link rel="stylesheet" href="${url_base}css/bootstrap.min.css"/>
</head>
<body>
<jsp:include page="${url_base}WEB-INF/view/navbar.jsp"/>
<div class="container">
	<h1>Usuários</h1>
	<c:if test="${not empty msg}">
		<div class="alert alert-success alert-dismissible" role="alert">
		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<p>${msg}</p>
		</div>
	</c:if>
	<a href="/usuarios/add" class="btn btn-primary">Adicionar usuário</a>
	<table id="tabela_usuarios" class="table table-hover">
		<thead>
			<tr><th>Matrícula</th><th>Nome</th><th>Tipo</th></tr>
		</thead>
		<c:if test="${not empty usuarios}">
			<tbody>
				<c:forEach var="c" items="${usuarios}">	
					<tr>
					<td>${c.matricula}</td><td>${c.nome}</td><td>${c.tipo}</td>
					<td><a href="${url_base}usuarios/${c.matricula}/update" class="btn btn-primary">Altera</a></td>
					<td><a href="${url_base}usuarios/${c.matricula}/delete" class="btn btn-danger" onclick="return confirm('Confirma remoção?')" >Deleta</a></td>
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