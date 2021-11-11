<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
 crossorigin="anonymous">
</head>
<body>
<style>
 button.btn{ 
 	background-color:#A52A2A; 
 	text-align: center; 
 } 
#adh{
	margin-top : -1%;
	margin-right: 2%;
}
#conn{
	margin-top:-3%;
	margin-right:1%;
}
div.image{
	margin-left:6px;
}
div.cont{
	background-color: black;
	padding:2px;
	height: 20%;
}
ul{
	margin-left:23%;
	margin-top:-4%;
}
a.bata{ 
 	background-color: #A52A2A; 
 	margin-right:1%; 
 	margin-top:-4%; 
} 
.nav-link{
	color: white;
	font-weight: bold;	
}
p#admin{
	font-weight: bold;
	font-style: italic;
	margin-left:2%;
	text-decoration: underline;
	margin-top:-1.5%;
}
#ditem{
font-weight: bold;	
width: 200px;
text-align: left;
border: none;
color: black;
}
</style>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="cont">

<div class="image">
<img src="album/logo.png">
</div>

<nav class="navbar navbar-expand-lg navbar-dark" id="navbar1">
 
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span><i class="far fa-list-alt fa-2x" style="color:white;"></i></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link"  href="adminlogged.jsp"  onmouseover="style.color='#A52A2A'" onmouseout="style.color='white'" ><span><i class="fas fa-home"></i></span> Accueil</a>
      </li>
      <li class="nav-item dropdown active " >
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink1"  onmouseover="style.color='#A52A2A'" onmouseout="style.color='white'"  role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Equipements
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink1" >
          <a  id="ditem" href="addEquipement.jsp" type="button" class="btn btn-outline-danger"  >Ajouter un équipement</a>
          <a  id="ditem" href="voirEquips.da"  type="button" class="btn btn-outline-danger">Equipements</a>
        </div>
      </li>
   <li class="nav-item dropdown active " >
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink"  onmouseover="style.color='#A52A2A'" onmouseout="style.color='white'"  role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
           Activités
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" >
          <a  id="ditem" href="addActivite.jsp" type="button" class="btn btn-outline-danger" >Ajouter une activité</a>
          <a  id="ditem" type="button" class="btn btn-outline-danger"  href="voirActivs.da" >Activités</a>
        </div>
   </li>

   <li class="nav-item dropdown active " >
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink"  onmouseover="style.color='#A52A2A'" onmouseout="style.color='white'"  role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
           Moniteurs
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" >
          <a  id="ditem" href="nomActivs.da" type="button" class="btn btn-outline-danger" >Ajouter un moniteur</a>
          <a  id="ditem" type="button" class="btn btn-outline-danger"  href="voirMoniteurs.da" >Moniteurs</a>
        </div>
   </li>
   
  <li class="nav-item dropdown active " >
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink"  onmouseover="style.color='#A52A2A'" onmouseout="style.color='white'"  role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
           Séances
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" >
          <a  id="ditem" href="nomActivsMoniteur.da" type="button" class="btn btn-outline-danger" >Ajouter une séance</a>
          <a  id="ditem" type="button" class="btn btn-outline-danger"  href="voirSeance.da" >Séances</a>
        </div>
   </li>
   
   <li class="nav-item dropdown active " >
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink"  onmouseover="style.color='#A52A2A'" onmouseout="style.color='white'"  role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
           Newsletters
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" >
          <a  id="ditem" href="addNews.jsp" type="button" class="btn btn-outline-danger" >Ajouter Newsletter</a>
          <a  id="ditem" type="button" class="btn btn-outline-danger"  href="voirNews.da" >Newsletters</a>
        </div>
   </li>   

    </ul>
  </div>
</nav> 
</div>

 <div class="btn-group float-right " role="group" id="conn">
    <a href="" class="bata btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      <i class="far fa-user"></i>  Le responsable
 	</a>	
    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
    <a href="compte1.jsp" class="btn btn-info dropdown-item " onmouseover="style.background='#A52A2A'" onmouseout="style.background='white'"  ><i class="fas fa-cog"></i>  Mon compte</a>
    <a href="logout.da" class="btn btn-info dropdown-item " onmouseover="style.background='#A52A2A'" onmouseout="style.background='white'" ><i class="fas fa-user-alt-slash"></i>  Se déconnecter</a>
    </div>
</div>   

<c:if test="${ !empty sessionScope.admin.nom }">
	<i class="fas fa-lock-open" style="margin-left:4px;"></i> <p id="admin">Bienvenue ${sessionScope.admin.prenom} ${sessionScope.admin.nom} !</p>
</c:if>

<form action="voirAdhs.da" method="post">
    <button class="nav-link bata btn float-right" id="adh" href="" type="submit"><i class="fas fa-users" style='color:white'></i>   Les adhérents</button>
</form>	

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>