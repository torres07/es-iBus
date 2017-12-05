<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:url var="url_base" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Página inicial - iBus</title>
<link rel="stylesheet" href="${url_base}css/bootstrap.min.css" />
</head>
<body>
	<jsp:include page="${url_base}WEB-INF/view/navbar.jsp"></jsp:include>
	
	<div class="container">
		<div class="jumbotron">
			<div>
				<h1 align="center">iBus 1.0</h1>
			</div>
		</div>
		<div class="panel panel-default">
			<c:if test="${empty usuario_logado}">
				<div class="panel-body">
					<jsp:include page="form_login.jsp"></jsp:include>
				</div>
			</c:if>
			<c:if test="${not empty usuario_logado}">
				<div class="panel-body">
					<h3 align="center">Bem vindo, ${usuario_logado.nome}!</h3>
				</div>
			</c:if>
			<div class="panel-footer">
			<c:if test="${not empty msg}">
				<div class="alert alert-danger alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<p>${msg}</p>
				</div>
			</c:if>	
			</div>
		</div>
		
	</div>
	
	<script src="${url_base}js/jquery-3.2.1.min.js"></script>
	<script src="${url_base}js/bootstrap.min.js"></script>
</body>
</html>