<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mon compte</title>
</head>
<body>
<style>
p.titre{
	font-size: large;
	text-transform: uppercase;
	font-weight: bolder;
	margin-left:22%;
	text-decoration: underline;
}
label.form1{
	font-weight: bold;
	font-size: medium;
}
div.conte{
	margin-left:5%;
	margin-top:8%;
	width: 32%;
}
#ddd{
	width: 32%;
	margin-left:51%;
	margin-top:-28%;
}
.card{
	padding :2%;
}

</style>
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
<form action="editEmailAdmin.da?" method="get">
<p class="titre"> Modifer mon adresse email</p><br>
  <div class="form-group">
    <label for="" class="form1" >Adresse email actuelle :</label>
    <input type="email" class="form-control" placeholder="nom@exemple.com" name="email1" required>
  </div>
  <div class="form-group">
    <label for="" class="form1" >Nouvelle adresse email :</label>
    <input type="email" class="form-control" placeholder="nom@exemple.com" name="email2" required>
    <small id="emailHelp" class="form-text text-muted">votre nouveau login</small>
  </div>
  	<input hidden name="id1" value="${sessionScope.admin.idu}" >
  	<input hidden name="verif" value="${sessionScope.admin.email}" >
    <br><button type="submit" class="nav-link btn">Enregistrer</button>
</form>
</div>
<div id="ddd" class="card">
<form action="editPasswordAdmin.da" method="get">
<p class="titre"> Modifer mon mot de passe </p><br>
  <div class="form-group">
    <label for="" class="form1" >Mot de passe actuel :</label> 
    <input type="password" class="form-control" placeholder="********" name="pass1" required>
  </div>
  <div class="form-group">
    <label for="" class="form1" >Nouveau mot de passe :</label>
    <input type="password" class="form-control" placeholder="********" size="8" maxlength="8" name="pass2" required>
    <small id="emailHelp" class="form-text text-muted">inférieur ou égal à 8 caractères</small>
  </div>
  
    <input hidden name="id2" value="${sessionScope.admin.idu}" >
  	<input hidden name="verifi" value="${sessionScope.admin.password}" >
  	
    <br><button type="submit" class="nav-link btn">Enregistrer</button>
</form>

</div> 


</body>
</html>