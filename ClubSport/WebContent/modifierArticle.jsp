<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Modifier une News</title>
</head>
<body>
<style>
div.conte{
	margin-left:25%;
	margin-top:6%;
	width: 52%;
	padding:2%;
}
p.titre{
	font-size: large;
	text-transform: uppercase;
	font-weight: bolder;
	margin-left:30%;
	text-decoration: underline;
}
button.btn{
	background-color:#A52A2A;
	margin-left:37%;
}
label.form1{
	font-weight: bold;
	font-size: medium;
}
div.contenu{
	height: 50%;
}
#ann{
	margin-left:60%;
	margin-top:-7.5%;
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
<form action="modifierArticle.da" method="get">
<p class="titre"> Modifier news</p><br>
  <div hidden class="form-group">
    <label for="" class="form1" >ID </label>
    <input type="text" class="form-control" placeholder="" name="id" value="${article.id_n}" />
    
    <input  type="text" class="form-control" placeholder="" name="id" value="${article.date_n}" />
    
  </div>
  <div class="form-group">
    <label for="" class="form1" >Titre </label>
    <input type="text" class="form-control" placeholder="" name="titre" value="${article.titre_n}" />
  </div>
  <div class="form-group">
    <label for="" class="form1" >Texte </label>    
    <div class="contenu"><textarea class="form-control" row="5"  name="contenu">${article.contenu_n}</textarea></div>
    
    
  </div>
  <br><button type="submit" class="btn btn-primary btn-lg">Enregistrer</button>
  
 <br><br>
</form>
</div>
</body>
</html>