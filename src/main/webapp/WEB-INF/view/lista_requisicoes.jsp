<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="url_base" value="/" />
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Requisições</title>
	<link rel="stylesheet" href="${url_base}css/bootstrap.min.css"/>
</head>
<body>
<jsp:include page="${url_base}WEB-INF/view/navbar.jsp"/>
<div class="container">
	<h1>Requisições</h1>
	
	<table id="tabela_requisicoes" class="table table-hover">
		<thead>
			<tr><th>Número</th><th>Rota</th><th>Horário</th></tr>
			
			<c:if test="${not empty requisicoes}">
			<tbody>
				<c:forEach var="c" items="${requisicoes}">
					<tr>
						<td>${c.id}</td><td>${c.origem} - ${c.destino}</td><td>${c.horario}</td>
					</tr>
				</c:forEach>
			</tbody>
		</c:if>
			
		</thead>
	</table>
</div>
<script src="${url_base}js/jquery-3.2.1.min.js"></script>
<script src="${url_base}js/bootstrap.min.js"></script>
<script>
</script>
</body>
</html>