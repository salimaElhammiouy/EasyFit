<%@ page language="java" contentType="text/html; charset=windows-1256"
pageEncoding="windows-1256"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<title>Affecter moniteur</title>
</head>
<body>
<header>
<style>
tr{
	color:white;
}
tr.titre{
	text-decoration: underline;
	text-align: center;
}
table{
	margin-top:2%;
	border-style: solid ;
	border-color: white;
	background-color: black;
}
td.unit{
	text-align: center;
}
label.mot{
	font-weight: bold;
}
div.dive{
	border-style: solid;
	padding: 2%; 
}
h5{
	text-decoration: underline;
	text-align: center;
}
div.card{
	width: 60%;
	margin-left:60%;
	margin-top:-2%;
}
div.conte{
	margin-left:25%;
	margin-top:6%;
	width: 42%;
	padding:2%;
}
p.titre{
	font-size: large;
	text-transform: uppercase;
	font-weight: bolder;
	margin-left:25%;
	text-decoration: underline;
}
#ann{
	margin-left:5%;
}
#enre{
	margin-left:32%;
}
</style>
</header>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="menuAdmin.jsp"></jsp:include>

<c:choose>
<c:when test="${etat==true}">
<div class="alert alert-success alert-dismissible fade show" role="alert" id="confirm" style='margin-top:4%;width: 50%;margin-left:20%'>
  <strong style='text-aligh:center'> <c:out value="${alerte}"></c:out></strong> 
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
</c:when>
<c:when test="${etat== false}">
</c:when>
</c:choose>

<div class="conte card">
<form action="affecterSeanceMonit.da" method="get">
<p class="titre"> Affecter un moniteur</p><br>
   <div class="form-group">
    <label for="" class="mot" >La séance </label>
    <input type="text" class="form-control" name="seance" value="${s.jour} à ${ s.horaire }" />
    <input hidden type="text" class="form-control"  name="id" value="${s.id_seance}" />
  </div>

  <div class="form-group">
  <p class="titre"> Le moniteur </p><br>
  
  	    <div class="form-group">
  <label for="sel1" class="mot"">Nom et prénom  :</label>
  <select class="form-control" name="nom" required>
  <option selected   value="">Choisir...</option>
	<c:forEach items="${modele.activs}" var="p">
		<option id="">${p.nom_activite}</option>	
	</c:forEach>    
  </select>
</div>
  </div> 
  <br><button type="submit" onclick="return confirm('Etes-vous sûr ?')" class="btn btn-primary btn-lg" id="enre">Enregistrer</button>
  <button type="reset" class="btn btn-primary btn-lg" href="voirSeance.da" id="ann">Annuler</button><br><br>
</form>
</div>

</body>
</html>