<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<form:form method="post" modelAttribute="avaliacao" action="${url_base}/user/avaliacao" onsubmit="setNota();">
	<form:input path="id" type="hidden"/>
	<form:input path="nota" type = "hidden" id="nota"/>

	<div class="form-group ${status.error ? 'has-error' : ''}">
		<form:select path="motorista">
			<c:if test="${not empty motoristas}">
				<c:forEach var="m" items="${motoristas }">
					<form:option value="${m.id }">${m.nome }</form:option>
				</c:forEach>
			</c:if>
		</form:select>
		
	</div>
	<div>
	    <div id="stars-existing" class="starrr" data-rating='3'></div>
	    Atualmente você está dando um total de <span id="count-existing">3</span> estrela(s)
    </div>

	<div class="form-group ${status.error ? 'has-error' : ''}">
		<form:textarea path="comentario"/>
	</div>
	
	<form:button type="submit" class="btn btn-primary"> Salvar</form:button>
</form:form>