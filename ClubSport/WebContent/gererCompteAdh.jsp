<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
 <script src="https://kit.fontawesome.com/209a6e480f.js" crossorigin="anonymous"></script>
<title>Gérer mon compte</title>
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
#conte{
	
	width: 80%;
}
#ddd{
	width: 90%;

	
	
}
.card{
	padding :2%;
}

</style>
</head>
<body>
<jsp:include page="menuAdh.jsp"></jsp:include>
<br>
<br> <%-- <c:choose><c:when test="${email==true}">
<div class="alert alert-warning alert-dismissible fade show" role="alert" style="width: 800px; ">
  <strong>Succés!</strong> <c:out value="${ message }"></c:out>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
</c:when>

<c:when test="${pass==true}">
<div class="alert alert-warning alert-dismissible fade show" role="alert" style="width: 800px;">
  <strong>Succés!</strong> <c:out value="${ message2 }"></c:out>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
</c:when>
</c:choose> --%><br>
<div class="container">

  <div class="row">
  <div class="col">
<div class="card" id="conte">

<form action="editEmailAdmin.de" method="get">
<p class="titre"> Modifer mon adresse email</p><br>
<p style="color: red;"><c:out value="${ message }"></c:out></p>
  <div class="form-group">
    <label for="" class="form1" >Adresse email actuelle :</label>
    <input type="email" class="form-control" placeholder="nom@exemple.com" name="email1" required>
  </div>
  <div class="form-group">
    <label for="" class="form1" >Nouvelle adresse email :</label>
    <input type="email" class="form-control" placeholder="nom@exemple.com" name="email2" required>
    <small id="emailHelp" class="form-text text-muted">Veuillez saisir un email existent</small>
  </div>
  	<input type="hidden" name="id1" value="${sessionScope.sessionUtilisateur}" >
  	
    <br><button type="submit" class="btn btn-outline-danger">Enregistrer</button>
</form>
</div>
</div>
<div class="col">
<div id="ddd" class="card">

<form action="editPasswordAdmin.de" method="get">
<p class="titre"> Modifer mon mot de passe </p><br>
<p style="color: red;"><c:out value="${ message2 }"></c:out></p>
  <div class="form-group">
    <label for="" class="form1" >Mot de passe actuel :</label> 
    <input type="password" class="form-control" placeholder="********" name="pass1" required>
  </div>
  <div class="form-group">
    <label for="" class="form1" >Nouveau mot de passe :</label>
    <input type="password" class="form-control" placeholder="********" size="8" maxlength="8" name="pass2" required>
    <small id="emailHelp" class="form-text text-muted">inférieur ou égal à 8 caractères</small>
  </div>
  
    <input type="hidden" name="id2" value="${sessionScope.sessionUtilisateur}" >
  
  	
    <br><button type="submit" class="btn btn-outline-danger" >Enregistrer</button>
</form>

</div> 
</div>
</div>
</div>







</body>
</html>