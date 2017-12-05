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
					<div class="col-md-2">
						<h3 align="center">Check-in ida</h3>
						<a href="${url_base}map/${0}" class="btn btn-primary btn-block">Praça do leão</a>
						<a href="${url_base}map/${3}" class="btn btn-primary btn-block">Anexo</a>
						<a href="${url_base}map/${2}" class="btn btn-primary btn-block">Basílio Pinto</a>
						<a href="${url_base}map/${1}" class="btn btn-primary btn-block">UFC</a>
					</div>
					<div class="col-md-8">
						<div class="panel panel-default">
							<div class="panel-heading">
								 © GoogleMaps contributors
							</div>
							<div class="panel-body">
								<div id="mapa" style="height: 500px; width: 650px"></div>
							</div>
						</div>
						
					</div>
					<div class="col-md-2">
						<h3 align="center">Check-in volta</h3>
						<a href="${url_base}map/${4}" class="btn btn-success btn-block">Sinal</a>
						<a href="${url_base}map/${5}" class="btn btn-success btn-block">Igreja</a>
						<a href="${url_base}map/${6}" class="btn btn-success btn-block">Garimpeiro</a>
						<a href="${url_base}map/${7}" class="btn btn-success btn-block">Rodovíaria</a>
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