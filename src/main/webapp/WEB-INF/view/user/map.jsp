<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="url_base" value="/" />
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Mapa</title>
	<link rel="stylesheet" href="${url_base}css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${url_base}css/estilo.css">
</head>
<body>
	<jsp:include page="${url_base}WEB-INF/view/navbar.jsp"/>

<div class="container">
	<div class="panel panel-primary">
		<div class="panel-heading"><h3 align="center">Mapa-iBus</h3></div>
		<div class="panel-body">
				<p id="indexloc" hidden="">
					<c:if test="${not empty index}">
						${index}
					</c:if>
				</p>
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								 © GoogleMaps contributors
							</div>
							<div class="panel-body">
								<div id="mapa" style="height: 500px; width: 1075"></div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
	</div>
</div>

	<script src="${url_base}js/jquery-3.2.1.min.js"></script>
	<script src="${url_base}js/bootstrap.min.js"></script>
	<script src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
	<script src="${url_base}js/infobox.js"></script>
	<script src="${url_base}js/markerclusterer.js"></script>
	<script src="${url_base}js/mapa.js"></script>
</body>
</html>