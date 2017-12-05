<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Requisitar viagem</title>
		<c:url var="url_base" value="/" />
		<link rel="stylesheet" href="${url_base}css/bootstrap.min.css" />
	</head>
<body>
<jsp:include page="${url_base}WEB-INF/view/navbar.jsp"/>

<div class="container">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 align="center">Enviar requisição</h4>
		</div>
		<div class="panel-body">
			<div class="row">
				<div class="col-md-6">
					<img src="${url_base}resources/img/leao1.jpg" class="img-circle center-block" alt="Praça do Leão - UFC/IFCE" height="220">
					<br>
					<jsp:include page="form_requisicao_centro.jsp"/>
				</div>
				<div class="col-md-6">
					<img src="${url_base}resources/img/cedro.jpg" class="img-circle center-block" alt="Praça do Leão - UFC/IFCE" height="220">
					<br>
					<jsp:include page="form_requisicao_ufcifce.jsp"/>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="${url_base}js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${url_base}js/wickedpicker.min.js"></script>
<script src="${url_base}js/bootstrap.min.js"></script>

</body>
</html>