<%@ page language="java" contentType="text/html; charset=windows-1256"
pageEncoding="windows-1256"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
 <script src="https://kit.fontawesome.com/209a6e480f.js" crossorigin="anonymous"></script>
<title>Liste</title>
</head>
<body>
<style>
div.conte1{
	margin-top:4%;
	margin-left:9%;
}
div.conte{
	margin-left:9%;
	margin-top:5%;
	width: 90%;
}
div#activ{
	margin-left:-15%;
	width: 120%;	
}
table.activ{
	margin-left:-5%;
}
button.btn{
	background-color:#A52A2A;
}
button.tt{
	margin-left:3%;
	margin: 1%;
}
p.titre{
	text-transform: uppercase;
	font-weight: bolder;
	margin-left:25%;
	font-size: x-large;
	text-decoration: underline;
	margin-left:40%;
}
tr{
	color:white;
}
tr.titre{
	color:#A52A2A;
	text-decoration: underline;
	text-align: center;
	font-size: large;
}
table{
	margin-top:2%;
	border-style: solid ;
	border-color: white;
	background-color: black;
}
td.unit{
	height: 44px;
	text-align: center;
}
label.mot{
	font-weight: bold;
}
div.card-body{
	margin-left:5%;
}
div.card{
	width:90%;
}
#print{
	margin-top:1px;
}
div.dive{
	border-style: solid;
	padding: 3%; 
	margin-bottom: 1%;
	margin-left:5%;
	margin-right:5%;
}
h5#tit{
	text-decoration: underline;
	text-align: center;
	font-weight: bolder;
	font-size: x-large;
	font-family: cursive;
	text-transform: uppercase;
}
#btn1{
	margin-top:2px;
	margin-left: 86%;
}
#btn2{
	margin-top:2px;
}
p.date{
	font-weight: bold;
	color:blue;
}
div.dive1{
	border-style: solid;
	padding: 3%; 
	margin-bottom: 1%;
}
input#myInput{
	margin-left:5%;
	width: 40%;
}
label.form1{
	font-weight: bold;
	font-size: large;
}

</style>
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


<c:choose>
 <c:when test="${a==01}"> 
 <p class="titre"> Les équipements</p>	
<div class="container conte1">
<div class=" card">
<div class="card-header"><h5>Filtrer les équipements</h5></div>
<div class="card-body">
<form action="chercherEquip.da" method="get">
<label class="mot">Mot Clé</label>
<input type="text" name="motCle" value="${modele.motCle}" />
<button type="submit" class="btn btn-primary btn-md"><i class="	fas fa-search" style='color:white'></i> Chercher</button> <br>
</form>
<table border="1" width="90%">
	<tr class="titre">
		 <th>Nom</th> <th>Marque</th> <th>Date</th> <th>Suppression</th>
	</tr>
<c:forEach items="${modele.equips}" var="p">
	<tr>
	<td class="unit">${p.nom_e}</td>
	<td class="unit">${p.marque}</td>
	<td class="unit">${p.date_installe}</td>
	<td class="unit"><a class=" btn bata btn-sm btn-info" id="print" onclick="return confirm('Etes-vous sûr ?')" href="suppEquipement.da?id=${p.id_e}"><i class="fas fa-trash-alt" style='font-size:24px;color:white'></i></a></td>
	</tr></c:forEach></table></div></div></div></c:when>
 
 <c:when test="${a==02}">
 <div class="conte1" >	
<p class="titre"> Les activités</p>	
<div  class="container">
<div id="activ" class="card" >
<div class="card-header"><h5>Filtrer les activités</h5></div>
<div class="card-body">
<label class="form1" >Chercher </label>
<input type="text" id="myInput" placeholder="taper un mot " /> <i class="fas fa-search" style='color:#A52A2A'></i> 
<table class="activ" border="1" width="105%" id="myTable">
	<tr class="titre">
		 <th>Nom</th> <th>Catégorie</th> <th>Description</th> <th>Durée</th> <th>Niveau</th> <th>Calories</th> <th>Prix/séance</th> <th>Disponible</th> <th>Modification</th> <th>Suppression</th>
	</tr>
<c:forEach items="${modele.activs}" var="p">
	<tr>
	<td class="unit" id="td1">${p.nom_activite }<a class="btn-sm btn bata btn-info float-right" id="fafa" role="button" href="editImage1.da?id=${p.id_act}"><i class="fas fa-image"></i></a></td>
	<td class="unit">${p.categorie}</td>
	<td class="unit">${p.description}</td>
	<td class="unit">${p.duree}</td>
	<td class="unit">${p.niveau}</td>
	<td class="unit">${p.calories}</td>
	<td class="unit">${p.prix_activite}</td>
	<td class="unit">${p.dispo}</td>
	<td hidden class="unit">${p.id_img}</td>
	<td class="unit"><a class="btn bata btn-info " href="editActivity.da?id=${p.id_act}"><i class="fa fa-edit" style='font-size:24px;color:white'></i></a></td>
	<td class="unit"><a class="btn bata btn-info " onclick="return confirm('Etes-vous sûr ?')" href="deleteActivity.da?id=${p.id_act}&noma=${p.nom_activite}"><i class="fas fa-trash-alt" style='font-size:24px;color:white'></i></a></td>
	</tr></c:forEach></table></div> </div></div></div></c:when>
 
<c:when test="${a==03}">
<div class="conte2">	
	<p class="titre"> Les moniteurs</p>	
<div class="container">
<div class="card">
<div class="card-header"><h5>Filtrer les moniteurs</h5></div>
<div class="card-body">
<label for="" class="form1" >Chercher </label>
<input type="text" name="motCle" id="myInput" placeholder="taper un mot " />  <i class="   fas fa-search" style='color:#A52A2A'></i>
<table border="1" width="100%" id="myTable">
	<tr class="titre">
		 <th>Nom</th> <th>Prénom</th> <th>Adresse email</th> <th>Sport</th>  <th>Suppression</th> 
	</tr>
	
<c:forEach items="${modele.user}" var="p">
	<tr>
	<td class="unit">${p.nom}</td>
	<td class="unit">${p.prenom}</td>
	<td class="unit">${p.email}</td>
	<td class="unit">${p.sport}</td>
	<td class="unit"><a class="btn bata btn-info btn-sm" id="print"  onclick="return confirm('Etes-vous sûr ?')" href="deleteMoniteur.da?id=${p.idu}&nom=${p.nom}&prenom=${p.prenom}"><i class="fas fa-trash-alt" style='font-size:24px;color:white'></i></a></td>
	</tr></c:forEach></table></div></div></div></div></c:when>

<c:when test="${a==04}">
<div class="conte">
<p class="titre "> Les séances </p>
<div class="card">
<div class="card-header"><h5>Filtrer les séances</h5></div>
<div class="card-body">
<label for="" class="form1" >Chercher </label>
<input type="text" id="myInput" placeholder="Taper un mot " />  <i class="fas fa-search" style='color:#A52A2A'></i><br><br>
<table border="1" width="100%" id="myTable">
	<tr class="titre">
		 <th>Jour</th> <th>Horaire</th> <th> Moniteur</th> <th>Sport</th> <th>Modifier</th> <th>Suppression</th> <th>Repporter</th>
	</tr>
<c:forEach items="${modele.seance}" var="p">
	<tr>
	<td class="unit">${p.jour}</td>
	<td class="unit">${p.horaire}</td>
	<td class="unit">${p.nom_mon} ${p.prenom_mon}</td>
	<td class="unit">${p.nom_activite}</td>
	<td class="unit"><a class="btn bata btn-info btn-sm " href="affecterSeance.da?id=${p.id_seance}&noma=${p.nom_activite}"><i class="fa fa-edit" style='font-size:24px;color:white'></i></a></td>
	<td class="unit"><a class="btn bata btn-info btn-sm " onclick="return confirm('Etes-vous sûr ?')" href="deleteSeance.da?id=${p.id_seance}&noma=${p.nom_activite }"><i class="fas fa-trash-alt" style='font-size:24px;color:white'></i></a></td>
	<td class="unit"><a class="btn bata btn-info btn-sm " href="ReporterSeance1.da?id=${p.id_seance}"><i class="fas fa-sync" style='font-size:24px;color:white'></i></a></td>		
	</tr></c:forEach></table></div></div></div></c:when>

<c:when test="${a==05}">
<div class="conte2">	
	<p class="titre">Newsletters</p><br>
<div class="container">
<div class=" card" >
<div class="card-header"><h5>Filtrer les Newsletters</h5></div>
<div class="card-body">
<form action="chercherArticle.da" method="get">
<label class="mot">Mot Clé (titre)</label>
<input type="text" name="motCle" value="${modele.motCle}" />  
<button type="submit" class="btn btn-primary btn-md"><i class="fas fa-search" style='color:white'></i> Chercher</button> <br> <br>
</form>
<c:forEach items="${modele.article}" var="p">
	<div class="dive1">
	<h5 id="tit">${p.titre_n}</h5>	
	<p class="date">${p.date_n}</p><p hidden class="date">${p.id_n}</p>
	<p>${p.contenu_n}</p>
	<a class="btn bata btn-info " id="btn1" href="editerArt.da?id=${p.id_n}"><i class="fa fa-edit" style='font-size:24px;color:white'></i></a>
	<a  class="btn bata btn-info float-right" id="btn2" onclick="return confirm('Etes-vous sûr de supprimer cette news ?')" href="deleteNews.da?id=${p.id_n}"><i class="fas fa-trash-alt" style='font-size:24px;color:white'></i></a>
	</div></c:forEach></div></div></div></div></c:when>
	
	<c:when test="${a==06}">
	<div class="container">
<div class="card">
<div class="card-header">
<h4>Boite de messages</h4>
</div>
<label class="mot" style="margin-left:5%;margin-top:1%">Chercher   <i class="fas fa-search" style='color:#A52A2A'></i> </label>  
<input type="text" name="motCle" id="myInput" placeholder="taper un mot" /> <br>

<c:forEach items="${modele.subject}" var="p">

	<div class="dive" id="myDIV">
	<h5>${p.nom}</h5>
	<h6>${p.email}</h6>	<h6 hidden >${p.idSujet}</h6>
	<p class="date float-right">${p.date_s}</p>
	<p>${p.sujet}</p>
	</div>
</c:forEach></div></div></c:when>

</c:choose>
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myDIV *").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
</body>
</html>