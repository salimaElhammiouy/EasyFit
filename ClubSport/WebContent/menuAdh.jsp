<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
 <script src="https://kit.fontawesome.com/209a6e480f.js" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<title>Espace d'Adherent</title>
<style>


#connect{
	/*margin-left:32%;
	margin-top:2.5%;
	background-color: #A52A2A;*/
	font-color: rgb(0,0,0);	
	
  position: absolute;
  top: 40px;
  right: 20px;
  /*font-size: 18px;*/
   box-sizing: border-box;
   width: 250px;
   height: 50px;
   font-size: 22px;
  
}
#logo {
top: 8px;
left : 16px;


}
#navbar1{


   
   background-color: black;
box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.25);
height: 120px;
/* border-radius: 25px; */
}
ul{
margin-top: 4%;
margin-left: -1%;

}
.form-inline{
margin-top:2%;
position: absolute;
  top: 35px;
  right: 20px;

}

#flech{ 
color:white;
left: 20px;

}

/* #insta{

  position: absolute;
  top: 40px;
  right: 30px;
}
#twit{
  top:  50px;
  right: 35px;

} */

#icon:hover {

background-color: black;
color:#A52A2A;
}
.nav-link{
	color: white;
	font-weight: bold;	

    
}
#ditem{
font-weight: bold;	
width: 200px;
text-align: left;
border: none;
color: black;
}
.nav-item{
	
	color:white;
	  width: 70%;}
.btn-group{

   margin-top: 30px;
 
  margin-left: 2%;
  width: 20 px;
  height: 90px;
 
 
 }

  /* Make the image fully responsive */
.carousel-inner img {
    width: 60%;
    height: 50%;
  }
  
 #pan{

background-color :black;
  border: none;
color:white;
font-weight: bold;
font-size:15px;
cursor: pointer;
margin-top: 2%

} 
 #contenu_compte{
 width: 190px;
 
 }
  
  body{
  
  background-color: white;
  }
  
  
  #icon{
background-color :black;
  border: none;
color:white;
padding: 12px 16px;
font-size:16px;
cursor: pointer;

  
 
 
}
  
div.contenu_compte{
   background-color: #ffffff;
box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.25);
height: 90px;
width: 190px;
display: none;
text-align: center;
margin-left: 73% ;
}
#gererc{
border:none;

}
  
  
#pann{

background-color :black;
  border: none;
color:white;
font-weight: bold;
font-size:16px;
cursor: pointer;
margin-top: 5%

}
  
  
  
  
  
  
  
  
  #links{
color: white ;
font-weight: bold;

}
#link{
color: white ;
font-weight: bold;
margin-top: 0px;
background-color: #A52A2A;


}
  
#not{

position: absolute;
  top: -4px;
  right: 53%;
  padding: 5px 10px;
  border-radius: 50%;
  background-color: #A52A2A;
  color: white;

}  
  
  
  
  
  
</style>
</head>
<body>




<nav class="navbar navbar-expand-lg navbar-dark" id="navbar1">
  <a class="navbar-brand" href="#"> <img src="images/bbb-01.png" id="logo"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span><i class="far fa-list-alt fa-2x" style="color:white;"></i></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link"  href="adherentlogged.de?id=${ sessionScope.sessionUtilisateur }" style=" width: 100px;" onmouseover="style.color='#A52A2A'" onmouseout="style.color='white'" ><i class="fas fa-home"></i>  Accueil</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link"href="personnaliserProg.do?id=${ sessionScope.sessionUtilisateur }" onmouseover="style.color='#A52A2A'" onmouseout="style.color='white'">Activités</a>
      </li>
     
      <li class="nav-item active ">
         <a class="nav-link" href="decouvrirProg.do?id=${ sessionScope.sessionUtilisateur }"  onmouseover="style.color='#A52A2A'" onmouseout="style.color='white'">Programmes</a>
      </li>
       <li class="nav-item active">
        <a class="nav-link"href="showEquipements.jsp" onmouseover="style.color='#A52A2A'" onmouseout="style.color='white'">Équipements</a>
      </li>
     
      <li class="nav-item active ">
         <a class="nav-link" href="voirCoach.jsp"  onmouseover="style.color='#A52A2A'" onmouseout="style.color='white'">Coachs</a>
      </li>
      <li class="nav-item dropdown active " >
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink1"  onmouseover="style.color='#A52A2A'" onmouseout="style.color='white'"  role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Planning
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink1" >
          <a  id="ditem" href="planningPro.de?id_ad=${ sessionScope.sessionUtilisateur }" type="button" class="btn btn-outline-danger"  >Mes programmes</a>
          <a  id="ditem"href="planningAct.de?id_ad=${ sessionScope.sessionUtilisateur }"  type="button" class="btn btn-outline-danger">Mes activités</a>
        </div>
      </li>
   <li class="nav-item dropdown active " >
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink"  onmouseover="style.color='#A52A2A'" onmouseout="style.color='white'"  role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Facturation
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" >
          <a  id="ditem" href="paiementEnLigne.de?id_ad=${ sessionScope.sessionUtilisateur }" type="button" class="btn btn-outline-danger"  >Paiement En Ligne</a>
          <a  id="ditem" type="button" class="btn btn-outline-danger"  href="historiqueFac.de?id=${ sessionScope.sessionUtilisateur }" >Historique des factures</a>
        </div>
      </li>

    </ul>
    
   <div class="btn-group " >
   <button  type="button" class="btn dropdown-toggle " id="icon" data-toggle="dropdown"><span><i class="far fa-user fa-2x "></i></span><span class="badge badge-light" data-toggle="tooltip" data-placement="bottom" title="Notifications" id="not" ><c:out value="${ sessionScope.comp }"></c:out></span> <strong>B</strong>ienvenue<br> <b><c:out value="${ sessionScope.nom }"></c:out></b></button>
    <div class="dropdown-menu">
     <a class="dropdown-item" href="gererCompteAdh.jsp" type="button" id="gererc"class="btn btn-outline-danger" style="width: 190px;  text-align: left;"><span><i class="fas fa-user-cog"></i></span>Gérer Mon Compte</a>
     <a class="dropdown-item" href="contacter.de?note=${ 2 }&h=${ sessionScope.has }&id=${ sessionScope.sessionUtilisateur }&re=${ sessionScope.re }" type="button" id="gererc"class="btn btn-outline-danger" style="width: 190px; text-align: left;"><span><svg class="bi bi-bell-fill" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zm.995-14.901a1 1 0 1 0-1.99 0A5.002 5.002 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901z"/>
</svg></span>Notifications</a>
   
    <a class="dropdown-item" href="deconnection.de"type="button" id="gererc"class="btn btn-outline-danger"  style="width: 190px; text-align: left;"><span><i class="fas fa-user-times"></i></span>Se déconnecter</a>
     <a class="dropdown-item" href="desabonner.de?id=${ sessionScope.sessionUtilisateur }" type="button" onclick="return confirm('Voulez vous vraiment supprimer votre compte ?')"  id="gererc"class="btn btn-outline-danger"  style="width: 190px; text-align: left;"><span><i class="fas fa-user-slash"></i></span>Se désabonner</a>
     </div>
 
  <a class="btn btn-lg" id="pan"   style=" width: 120px; text-align: right;" href="paiement.do?id=${ sessionScope.sessionUtilisateur }" data-toggle="tooltip" data-placement="bottom" title="votre panier d'activités" onmouseover="style.color='#A52A2A'" onmouseout="style.color='white'" style="width: 30%;"><svg class="bi bi-cart4" width="2.5em" height="2.5em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
</svg> Mon Panier</a>
  <a class="btn btn-lg" id="pann" href="contacter.de?note=${ 1 }&id=${ sessionScope.sessionUtilisateur }&re=${ sessionScope.re }" data-toggle="tooltip" data-placement="bottom" title="Contactez nous"    onmouseover="style.color='#A52A2A'" onmouseout="style.color='white'"><span ><i class="far fa-envelope fa-2x"></i></span></a>

  </div>
  </div>
</nav> 
  






















































</body>
</html>