<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modifier activité</title>
<style>
.image-preview{
width: 300px;
min-height: 100px;
 border-radius: 25px;
border: 2px solid black;
border-style: groove;
border-color: white;
margin-top: 15px;
display: flex;
} 
.image-preview__image{
width: 100%;
}
div.conte{
	margin-left:25%;
	margin-top:6%;
	width: 45%;
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
#ann{
	margin-left: 5%;
	margin-top:1px;
}
div#me{
	margin-top:-13%;
}
</style>
</head>
<body>

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
  <form action="editActivity1.da" method="get">
  <p class="titre"> Modifier activité</p><br><br>
 
<input hidden type="text" class="form-control" placeholder="" name="idd" value="${activite.id_img}">
<input hidden type="text" class="form-control" placeholder="" name="ida" value="${activite.id_act}"><br><br>

<div class="form-group" id="me">
    <label class="form1" for="nom">Nom de l'activité</label>
    <input type="text" class="form-control" placeholder="" name="nom" value="${activite.nom_activite}">
</div>
 <div class="form-group">
    <label class="form1" for="niveau">Catégorie</label>
  <select class="form-control" id="categorie" name="categorie"  required >
  <option selected  value="${activite.categorie}">${activite.categorie}</option>
    <option value="">Aquagym</option>
    <option value="">Arts martiaux</option>
    <option value="">Zenfit</option>
    <option value="">Cardio</option>
    <option value="">Boxemma</option>
    <option value="">Musculation</option>
  </select>
  </div>
    
  <div class="form-group">
    <label class="form1" for="description">Description</label>
    <textarea  class="form-control" placeholder="" name="description">${activite.description}</textarea>
  </div>
  <div class="form-group">
    <label class="form1" for="duree">Duree</label>
    <input type="text" class="form-control" placeholder="00 min" name="duree" value="${activite.duree}">
  </div>
  <div class="form-group">
    <label class="form1" for="niveau">Niveau</label>
  <select class="form-control" id="niveau" name="niveau" required  >
  <option selected  value="${activite.niveau}">${activite.niveau}</option>
    <option value="Hard">HARD</option>
    <option value="Meduim">Medium</option>
    <option value="Easy">Easy</option>
  </select>
    </div>
  <div class="form-group">
    <label class="form1" for="calori">Calories</label>
    <input type="text" class="form-control" placeholder="300 kcal" name="calori" value="${activite.calories}">
    </div>
  <div class="form-group">
    <label class="form1" for="prix">Prix</label>
    <input type="text" class="form-control" placeholder="000.00" name="prix" value="${activite.prix_activite}"> <br>
    </div>
  <div class="form-group">
    <label class="form1" for="">Disponibilité</label>
    <select class="form-control" id="" name="dispo" required  >
  <option selected  value="${activite.dispo}">${activite.dispo}</option>
    <option value="Oui">Oui</option>
    <option value="Non">Non</option>
  </select>
    </div>
  <button type="submit" class="btn btn-primary btn-lg">Enregister</button>
  <a class="btn btn-info btn-lg " id="ann" href="adminlogged.jsp">Annuler</a>
</form>
</div>

</body>
</html>