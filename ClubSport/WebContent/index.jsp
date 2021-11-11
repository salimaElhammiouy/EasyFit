<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
 <script src="https://kit.fontawesome.com/209a6e480f.js" crossorigin="anonymous"></script>
<title>ClubSport EasyFit</title>
<style>
body	{
      
 background-image:   url(images/back2.jpg);
 background-attachment:      fixed;
 background-repeat: no-repeat;
 background-size:      cover  ;
}

/* .nav-item{
margins: 60px 60px 26x 2px;
font-weight: bold;
font-size: 16px;
}
.nav-link{
color: #A52A2A;
font-weight: bold;
font-size: 16px;
}

.col {

color: #A52A2A;
font-style: italic;
font-weight: bold;
align: left;

}*/
.jumbotron{

opacity: 0,6;
background: 0;
margin-top: 15%;
	width: 40%;

} 
.display-4{
color: #A52A2A;
font-style: normal;
font-weight: bold;
font-size: 60px;

}
.lead{

color: rgb(255,255,255);

font-weight: bold;
font-family: Lucida Sans Typewriter ;

font-variant: small-caps;
font-size: 30px
}
.best{

color: rgb(255,255,255);
font-style: normal;
font-weight: bold;
font-size: 16px;
}


#confirm {

background-color: #FFF8DC;
color: rgb(0,0,0);

position: absolute;
  top: 300px;
 right:350px;
  
 
}





.nav-link{
	color: white;
	font-weight: bold;	
}
.nav-item{
	margins: 20px 20px 20px 20px;
}
div.cont {
  width:22%;
  margin-left:40%;
  margin-top:10%;
  background-color: rgba(255,255,255,0.6);
  opacity:0.4;

}
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

#reserve{
   margin-left:10%;
   margin-top:10%;
   background-color: #A52A2A;	


}
ul{ 
 

margin-top:-5%;
	margin-left:23%;


} 
#contact{
       background-color: rgba(255,255,255,0.6);
  opacity:0.9;
     
       box-sizing: border-box;
   width: 1000px;
   height: 550px;
   margin-top: 40px;
  margin-bottom: 100px;
  margin-right: 150px;
  margin-left: 150px;
 
}
#reserveP{
 background-color: rgba(255,255,255,0.6);
  
 box-sizing: border-box;
   width: 1000px;
   height: 1000px;
   margin-top: 40px;
  margin-bottom: 100px;
  margin-right: 150px;
  margin-left: 150px;
}
label {
font-style: oblique;
font-weight: bold;


}
.card-header{
font-style: normal;
font-weight: bold;
font-size: 20px;
}
.invalid-feedback{
color: black;

}


*/
#problem {
  width: 100%;
  height: 150px;
  padding: 12px 20px;
  box-sizing: border-box;

  resize: none;
} 

/* style header2(page reserverplace) */
.Rplace2
{
background-color: rgb(192,192,192);

}

#logo {
top: 8px;
left : 16px;


}
.invalid-feedback{
font-color: red;
font-size: 12px;
font-style: normal;
}




</style>
</head>
<body >


<img src="images/bbb-01.png" id="logo">

<ul class="nav">
 <li class="nav-item">
    <a class="nav-link" href="index.jsp"  onmouseover="style.color='#A52A2A'" onmouseout="style.color='white'" ><span><i class="fas fa-home"></i></span> Accueil</a>
  </li> 
  <li class="nav-item">
    <a class="nav-link" href="aboutUs.jsp" onmouseover="style.color='#A52A2A'" onmouseout="style.color='white'">A propos de nous</a>
  </li>
   <li class="nav-item">
    <a class="nav-link" href="contactezN.jsp" onmouseover="style.color='#A52A2A'" onmouseout="style.color='white'"><span><i class="fas fa-envelope"></i></span>  Contactez-nous</a>
  </li>
  
</ul>

<a href="login.jsp" class="btn btn-outline-danger btn-lg float-right" role="button" id="connect">Se connecter</a>




<c:choose>
<c:when test="${etat==false}">
<div class="alert alert-warning alert-dismissible fade show" role="alert" style="width: 800px; margin-left: 20%; margin-top: 5%;">
  <strong>Succès!</strong> Votre paiement a bien été enregistré , vous pouvez consulter vos factures depuis votre compte.
  <p>Cliquez<a href="login.jsp">ICI </a>  pour SE CONNECTER
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>


<div class="jumbotron" >
 
  <p class="lead">Fais toujours de ton mieux même si personne ne regarde.</p>
  
  <p class="best">BE THE BEST</p>
  <a class="btn btn-danger btn-lg" href="reserverPlace.jsp" role="button" id="reserve" >RESERVER VOTRE PLACE</a>
</div>
</c:when>
<c:when test="${i==true}">
<div class="alert alert-warning alert-dismissible fade show" role="alert" style="width: 500px; margin-left: 20%; margin-top: 5%;">
  <strong>Succés!</strong><c:out value="${ nom }"></c:out>, Votre paiement a bien été envoyé
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>

<div class="jumbotron" >
  
  <p class="lead">Fais toujours de ton mieux même si personne ne regarde.</p>
  
  <p class="best">BE THE BEST</p>
  <a class="btn btn-danger btn-lg" href="reserverPlace.jsp" role="button" id="reserve" >RESERVER VOTRE PLACE</a>
</div>
</c:when>







<c:when test="${etatt==true}">

<div class="alert alert-warning alert-dismissible fade show" role="alert" style="width: 800px; margin-left: 20%; margin-top: 5%;">
  <strong>Succès!</strong><c:out value="${alerte}"></c:out>
  <p>Cliquez<a href="login.jsp">ICI </a>  pour SE CONNECTER
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<div class="jumbotron"  >
 
  <p class="lead">Fais toujours de ton mieux même si personne ne regarde.</p>
  
  <p class="best">BE THE BEST</p>
  <a class="btn btn-danger btn-lg" href="reserverPlace.jsp" role="button" id="reserve" ><i class="	far fa-star" style='color:white'></i> RESERVER VOTRE PLACE</a>
</div>
</c:when>
<c:when test="${etatt== false}">
<div class="jumbotron"  >
 
  <p class="lead">Fais toujours de ton mieux même si personne ne regarde.</p>
  
  <p class="best">BE THE BEST</p>
  <a class="btn btn-danger btn-lg" href="reserverPlace.jsp" role="button" id="reserve" ><i class="	far fa-star" style='color:white'></i> RESERVER VOTRE PLACE</a>
</div>
</c:when>
<c:otherwise>
<div class="jumbotron"  >
 
  <p class="lead">Fais toujours de ton mieux même si personne ne regarde.</p>
  
  <p class="best">BE THE BEST</p>
  <a class="btn btn-danger btn-lg" href="reserverPlace.jsp" role="button" id="reserve" ><i class="	far fa-star" style='color:white'></i> RESERVER VOTRE PLACE</a>
</div>


</c:otherwise>
</c:choose>


















































<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>