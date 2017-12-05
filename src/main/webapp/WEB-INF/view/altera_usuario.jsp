<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Alterar usuário</title>
	<c:url var="url_base" value="/" />
	<link rel="stylesheet" href="${url_base}css/bootstrap.min.css" />
</head>
<body>
<jsp:include page="${url_base}WEB-INF/view/navbar.jsp"/>

<div class="container">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4>Alterar usuário</h4>
		</div>
		<div class="panel-body">
			<jsp:include page="form_usuario.jsp" />
		</div>
	</div>
</div>

<script src="${url_base}js/jquery-3.2.1.min.js"></script>
<script src="${url_base}js/bootstrap.min.js"></script>

</body>
</html>