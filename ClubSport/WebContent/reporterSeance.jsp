<%@ page language="java" contentType="text/html; charset=windows-1256"
pageEncoding="windows-1256"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<title>Reporter</title>
</head>

<body>
<header>
<style>
tr{
	color:white;
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
	padding :4%;
}
div.conte{
	margin-left:8%;
	margin-top:7%;
	width: 42%;
}
p.titre{
	font-size: x-large;
	text-transform: uppercase;
	font-weight: bolder;
	margin-left:22%;
	text-decoration: underline;
}
#ann{
	margin-top :0.5px;
	margin-left:12%;
}
#enre{
	margin-left:15%;
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

<div class="conte">
<div class="card">
<form action="reporterSeance2.da" method="get">
   <div class="form-group">
    <label for="" class="mot" >Séance d'origine</label>
    <input type="text" class="form-control" name="nom" value="${seance.jour} à ${seance.horaire}" />
    
    <input hidden type="text" class="form-control"  name="id" value="${seance.id_seance}" />   
  </div><br>
  <div class="form-group">
  <p class="titre"> Nouvelle date  </p> 
  <label for="sel1" class="mot">Date - Horaire :</label>
   <input type="datetime-local" class="form-control" placeholder="" name="datetime" required>
</div>   
 
  <br><button type="submit" class="btn btn-primary " id="enre">Enregistrer</button>
  <a class="btn bata btn-info " id="ann" href="adminlogged.jsp">Annuler</a>
</form></div>
</div>

</body>
</html>