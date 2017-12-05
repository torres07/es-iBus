<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<form:form method="post" modelAttribute="requisicao" action="${url_base}/user/requisicao">
	<form:input path="id" type="hidden"/>
	
	<form:input path="origem" value="UFC/IFCE" type="hidden"/>

	<button type="submit" class="btn btn-primary center-block">UFC/IFCE - Centro</button>
</form:form>