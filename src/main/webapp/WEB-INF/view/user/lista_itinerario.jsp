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
	<div class="panel panel-default">
		<div class="panel-heading">
			<h1 align="center">Itinerário</h1>
		</div>
	</div>
	
	<c:if test="${not empty msg}">
		<div class="alert alert-success alert-dismissible" role="alert">
		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<p>${msg}</p>
		</div>
	</c:if>
	
	
	
	<div class="panel panel-default">
		<div class="panel-heading">Manhã</div>
		<div class="panel-body">
			<table id="tabela_manha" class="table table-hover">
				<thead>
					<tr><th>Rota</th><th>Inicio</th><th>Fim</th></tr>
				</thead>
				<c:if test="${not empty itinerario}">
					<tbody>
						<c:forEach var="c" items="${itinerario}">
							<c:if test="${c.turno == 'Manhã'}">
								<tr><td>${c.origem} - ${c.destino}</td><td>${c.inicio}</td><td>${c.fim}</td></tr>
							</c:if>
						</c:forEach>
					</tbody>
				</c:if>
			</table>
		</div>
	</div>
	
	<div class="panel panel-default">
		<div class="panel-heading">Tarde</div>
		<div class="panel-body">
			<table id="tabela_manha" class="table table-hover">
				<thead>
					<tr><th>Rota</th><th>Inicio</th><th>Fim</th></tr>
				</thead>
				<c:if test="${not empty itinerario}">
					<tbody>
						<c:forEach var="c" items="${itinerario}">
							<c:if test="${c.turno == 'Tarde'}">
								<tr><td>${c.origem} - ${c.destino}</td><td>${c.inicio}</td><td>${c.fim}</td></tr>
							</c:if>
						</c:forEach>
					</tbody>
				</c:if>
			</table>
		</div>
	</div>
	
	<div class="panel panel-default">
		<div class="panel-heading">Noite</div>
		<div class="panel-body">
			<table id="tabela_manha" class="table table-hover">
				<thead>
					<tr><th>Rota</th><th>Inicio</th><th>Fim</th></tr>
				</thead>
				<c:if test="${not empty itinerario}">
					<tbody>
						<c:forEach var="c" items="${itinerario}">
							<c:if test="${c.turno == 'Noite'}">
								<tr><td>${c.origem} - ${c.destino}</td><td>${c.inicio}</td><td>${c.fim}</td></tr>
							</c:if>
						</c:forEach>
					</tbody>
				</c:if>
			</table>
		</div>
	</div>
</div>
<script src="${url_base}js/jquery-3.2.1.min.js"></script>
<script src="${url_base}js/bootstrap.min.js"></script>
<script>
</script>
</body>
</html>