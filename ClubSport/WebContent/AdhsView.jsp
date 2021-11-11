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
<title>Adhérents</title>
</head>

<body>
<header>
<style>
tr{
	color:white;
	border-style: solid black;
}
th{
	height: 40px;
}
tr.titre{
	text-decoration: underline;
	text-align: center;
	font-size: large;
	color:#A52A2A;
}
p.titre{
	
	text-transform: uppercase;
	font-weight: bolder;
	text-decoration: underline;
	margin-top:3%;
	font-size: x-large;
}
div.conte{
	margin-left:9%;
	margin-top:9%;
	width: 80%;
}
table{
	border-style: solid ;
	border-color: white;
	background-color: black;
	margin-left:5%;
}
td.unit{
	height: 44px;
	text-align: center;
}
div#adh1{
	margin-left:50%;
	margin-top:-4%;
}
div#adh2{
	margin-left:68%;
	margin-top:-42px;
}
label.form1{
	font-weight: bold;
	font-size: large;
}
#nom{
	font-size: small;
	font-weight: bold;
	text-transform: uppercase; 
	text-decoration: underline;
	margin-left:40%;
}
#print{
	margin-top:1%;
}
</style>
</header>
<jsp:include page="menuAdmin.jsp"></jsp:include>

<div class="conte card">
<div class="card-header">
<p class="titre px-5"> Les adhérents du club </p>

<div id="adh1">
  <form action="voirAdh1.da" method="post">
    <button class="nav-link btn"  type="submit"><i class="fas fa-dumbbell" style='color:white'></i>  Par activités</button>
    </form>
</div>
<div id="adh2">
  <form action="voirAdh2.da" method="post">
    <button class="nav-link btn"  type="submit"><i class="far fa-calendar-alt" style='color:white'></i>  Par programmes</button>
    </form>
</div>    
    
</div>

<div class="card-body">
<label for="" class="form1" >Chercher </label>
<input type="text" name="motCle" id="myInput" placeholder="taper un mot " /> <i class="fas fa-search" style='color:#A52A2A'></i> <br><br>


<c:choose>
 <c:when test="${etat1==true}">  <%-- here les adherents et leurs sports  --%>
<table border="1" width="80%">
	<tr class="titre">
		<th>Nom</th> <th>Prénom</th> <th>Sexe</th> <th>GSM</th> <th>Adresse email</th><th>Sport</th> <th>Paiement</th>
	</tr>
	<tbody id="myTable">
<c:forEach items="${modele.user}" var="p">
	<tr>
	<td class="unit">${p.nom}</td>
	<td class="unit">${p.prenom}</td>
	<td class="unit">${p.sexe}</td>
	<td class="unit">${p.gsm}</td>
	<td class="unit">${p.email}</td>
	<td class="unit">${p.sport}</td>
	<td class="unit"><a class=" btn bata btn-sm btn-info"  href="voirPaie.da?id=${p.idu}"><i class="fas fa-plus">Voir</i></a></td>
	</tr>
</c:forEach>
</tbody>
</table>

</c:when>
<c:when test="${x==1}">		<%-- here les adherents et leurs programmes  --%>
<table border="1" width="80%">
	<tr class="titre">
		<th>Nom</th> <th>Prénom</th> <th>Sexe</th> <th>GSM</th> <th>Adresse email</th><th>Programme</th> <th>Paiement</th>
	</tr>
	<tbody id="myTable">
<c:forEach items="${modele.user}" var="p">
	<tr>
	<td class="unit">${p.nom}</td>
	<td class="unit">${p.prenom}</td>
	<td class="unit">${p.sexe}</td>
	<td class="unit">${p.gsm}</td>
	<td class="unit">${p.email}</td>
	<td class="unit">${p.sport}</td>
	<td class="unit"><a class=" btn bata btn-sm btn-info"  href="voirPaie.da?id=${p.idu}"><i class="fas fa-plus">Voir</i></a></td>
	</tr>
</c:forEach>
</tbody>
</table>
</c:when>

<c:when test="${x==11}">		<%-- here les adherents et leurs programmes  --%>
<p id="nom">${adherent.nom} ${adherent.prenom}</p>
<table border="1" width="80%">
	<tr class="titre">
		<th>Date</th> <th>Montant</th> <th>Facture</th> 
	</tr>
	<tbody id="myTable">
<c:forEach items="${modele.paiement}" var="p">
	<tr>
	<td class="unit">${p.date}</td>	
	<td class="unit">${p.montant}</td>
	<td class="unit"><a class=" btn bata btn-sm btn-info" id="print" href="FacturePDF?id=${p.id_p}&d=${p.date}"><i class="fas fa-print"></i>  Télécharger</a></td>
<!-- ici je passe l'id de l'adherent à la facture	 -->
</tr>
</c:forEach>
</tbody>
</table>
</c:when>

<c:otherwise>		<%-- here les adherents et leurs informations --%>

<table border="1" width="80%">
	<tr class="titre">
		<th>Nom</th> <th>Prénom</th> <th>Sexe</th> <th>GSM</th> <th>Adresse email</th> <th>Paiement</th>
	</tr>
	<tbody id="myTable">
<c:forEach items="${modele.adhs}" var="p">
	<tr>
	<td class="unit">${p.nomA}</td>
	<td class="unit">${p.prenomA}</td>
	<td class="unit">${p.sexe}</td>
	<td class="unit">${p.gsm}</td>
	<td class="unit">${p.emailA}</td>
	<td class="unit"><a class=" btn bata btn-sm btn-info"  href="voirPaie.da?id=${p.idinscrir}"><i class="fas fa-plus">Voir</i></a></td>
	</tr>
</c:forEach>
</tbody>
</table>
</c:otherwise>
</c:choose>





</div>
</div>
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