<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		<div class="panel-heading"><h4><span class="glyphicon glyphicon-user"></span>  ${motorista.nome} - ${media} <span class="glyphicon glyphicon-star"></span></h4></div>
		<div class="panel-body">
		<table class="table table-hover">
    <thead>
      <tr><th>Nota</th><th>Comentário</th></tr>
    </thead>
    <c:if test="${not empty motorista.avaliacoes}">
    	<tbody>
    		<c:forEach var="c" items= "${motorista.avaliacoes}">
	    		<c:if test="${c.motorista == motorista}">
	    			<tr>
		    			<td>${c.nota} <span class="glyphicon glyphicon-star"></span></td>
		    			<td>${c.comentario}</td>
	    			</tr>
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