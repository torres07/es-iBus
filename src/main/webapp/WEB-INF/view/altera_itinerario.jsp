<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Alterar viagem</title>
	<c:url var="url_base" value="/" />
	<link rel="stylesheet" href="${url_base}css/bootstrap.min.css" />
	<link rel="stylesheet" href="${url_base}css/wickedpicker.min.css" />
</head>
<body>
<jsp:include page="${url_base}WEB-INF/view/navbar.jsp"/>

<div class="container">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4>Alterar viagem</h4>
		</div>
		<div class="panel-body">
			<jsp:include page="form_itinerario.jsp" />
		</div>
	</div>
</div>

<script src="${url_base}js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${url_base}js/wickedpicker.min.js"></script>
<script type="text/javascript">
	$('.timepicker1').wickedpicker();
</script>
<script src="${url_base}js/bootstrap.min.js"></script>

</body>
</html>