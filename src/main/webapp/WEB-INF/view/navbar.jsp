<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="url_base" value="/" />

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/">iBus</a>
    </div>
    <ul class="nav navbar-nav">
    	<c:if test="${not empty usuario_logado}">
    		<c:if test="${usuario_logado.tipo == 'Admin'}">
    		  <li><a href="${url_base}itinerario">Itinerário</a></li>
		      <li><a href="${url_base}usuarios">Usuários</a></li>
		      <li><a href="${url_base}motoristas">Motoristas</a></li>
		      <li><a href="${url_base}requisicoes">Requisições</a></li>
    		</c:if>
    		<c:if test="${usuario_logado.tipo == 'Aluno'}">
      			<li><a href="${url_base}user/itinerario">Itinerário</a></li>
    			<li><a href="${url_base}user/requisicao/add">Requisições</a></li>
      			<li><a href="${url_base}user/avaliacao/add">Avaliar</a></li>
      			<li><a href="${url_base}user/map">Mapa</a></li>      			
    		</c:if>
    		<c:if test="${usuario_logado.tipo == 'Motorista'}">
      			<li><a href="${url_base}user/itinerario">Itinerário</a></li>    			
      			<li><a href="${url_base}motorista/${usuario_logado.matricula }/avalicoes_individual">Avaliações</a></li>    			      			
      			<li><a href="${url_base}map">Mapa</a></li>      			
    		</c:if>    		
    	</c:if>
      
      
      
    </ul>
    <ul class="nav navbar-nav navbar-right">
    	<c:if test="${not empty usuario_logado}">
      		<li><a href="#"><span class="glyphicon glyphicon-user"></span> ${usuario_logado.nome}</a></li>
      		<li><a href="${url_base}logout"><span class="glyphicon glyphicon-log-out"></span> Log-out</a></li>
      	</c:if>
      	
    </ul>
    
  </div>
</nav>