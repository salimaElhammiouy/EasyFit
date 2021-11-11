<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
 <script src="https://kit.fontawesome.com/209a6e480f.js" crossorigin="anonymous"></script>

<title>Easy-Cardio</title>
<style>


  /* Make the image fully responsive */
.carousel-inner img {
    width: 60%;
    height: 50%;
  }
  


#empl{
display: none;
}
#pan{

background-color :black;
  border: none;
color:white;
font-weight: bold;
font-size:15px;
cursor: pointer;
height: 20px;

}
p{
font-family:  cursive;

font-color: gris;
text-indent: 50px;
  text-align: justify;
  letter-spacing: 1px;

}
ul.pi{
font-family: Bradley Hand, cursive;

font-color: gris;
  list-style-type: square;
  margin-right: 100px;
  margin-left: 70px;
}
label, modal-title{

font-family: Bradley Hand, cursive;

font-color: gris;
}
h1{
font-family: Bradley Hand, cursive;
  text-indent: 50px;
  margin-right: 150px;
  margin-left: 10px;
}
#reglerE{
position: absolute;
right: 520px;


}

#revenir{

}
#valider {
 background-color: #A52A2A;

}
table{
border: 2px solid red;
  border-radius: 50px;

}
thead{
 background-color: #A52A2A;


}
th{

text-align: center;

}

td{
width: 100px;
text-align: center;
font-style: italic;
font-weight: bold;

}
#empl{
display: none;
}
#addPanier{
position: absolute;
right: 510px;
display: flex;

}
.links{
font-color: white ;
font-weight: bold;
background-color: #A52A2A; 


}
.links , a{
color: white ;
font-weight: bold;


}
</style>
</head>
<body>
<c:choose>
<c:when test="${etat2==true }">
<jsp:include page="menuVisiteur.jsp"></jsp:include>
<div class="links"><a href="preparerCompte.jsp" id="links">Préparer mon compte <span><i class="fas fa-angle-right"></i></span></a><a href="decouvrirProg.do?id=${ sessionScope.sessionUtilisateur }" id="links">Nos Programmes<span><i class="fas fa-angle-right"></i></span></a><a href="">
Easy-Cardio

</a></div></c:when>
<c:otherwise>
<jsp:include page="menuAdh.jsp"></jsp:include>
<div class="links"><a href="decouvrirProg.do?id=${ sessionScope.sessionUtilisateur }" id="links">Nos Programmes<span><i class="fas fa-angle-right"></i></span></a><a href="">
Easy-Cardio

</a></div>
</c:otherwise></c:choose> 

<br>

<div class="container" >
  <h1 style=" text-align: center;">Easy-Cardio</h1>
</div>
<c:choose>
<c:when test="${ !empty msg }">
<div class="alert alert-danger alert-dismissible fade show" role="alert">
  <strong>Attention!</strong><c:out value="${ msg }"></c:out>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
</c:when>
</c:choose>
<div class="container">
<div class="row">
    <div class="col">
     <img src="images/musculMan.jpg" alt="musculMan" class="img-thumbnail">
    </div>
    <div class="col">
       <img src="images/aquabik.jpg" alt="aquacardio" class="img-thumbnail">
    </div>
    <div class="col">
        <img src="images/musculWeman.jpg" alt="musculWeman" class="img-thumbnail">
    </div>
  </div>
</div>

<h1>1-Musculation</h1>

<p  class="text-justify">Sur un immense plateau de musculation et cardio-training, EasyFit met à votre disposition de nombreuses machines avec écrans LCD pour des séances plus entrainantes.

Nos coachs sont à votre disposition pour établir avec vous un programme personnalisé et renouvelable, adapté à vos objectifs.</p>

<ul class="pi">
<li ><strong>Temps:</strong>45 ou 60 minutes </li>
<li><strong>Calories brûlées: </strong> 700( en moyenne)</li>
<li><strong>Niveau:</strong>Hard</li>
</ul>
<h1>Les bienfaits du Musculation ?</h1>

<ul class="pi">


<li >Tonifie le corps </li>
<li>Affine la silhouette</li>
<li>Se muscler permet de prévenir les effets du vieillissement.</li>

</ul>


<br><br>




<h1>2-Aqua Biking</h1>

<p  class="text-justify">. L'Aquabiking combine les bienfaits du cyclisme et ceux d'un hydro-massage. Vous enchainez des séries d'exercices qui peuvent être à la fois doux ou intensifs. Ils sont coordonnés par un éducateur qui simule une course avec montées, descentes, incitant à pédaler assis ou debout, selon les phases de sprint ou de balade.
 Le corps est tonifié et raffermi !</p>
<ul class="pi">
<li ><strong>Temps:</strong>35 ou 45 minutes </li>
<li><strong>Calories brûlées: </strong>400( en moyenne)</li>
<li><strong>Niveau:</strong> Meduim
</ul>
<h1>Les bienfaits du Aquabiking ?</h1>

<ul class="pi">


<li >Raffermir la peau</li>
<li>Muscler les cuisses et les mollets</li>
<li>Améliorer la coordination.</li>

</ul>



   
     



<div class="container" style="width: 800px" id="empl">

<a  onclick="return confirm('Etes-vous sur de votre choix?  ?')" href="choisirProgramme.do?idP=${ 3 }&idc=${ sessionScope.sessionUtilisateur }" class="btn btn-outline-danger btn-lg" id="addPanier"   data-toggle="tooltip" data-placement="bottom"  title="Click ici pour rejoindre Easy-equilibre !!" >Ajouter au panier <span ><i class="fas fa-cart-plus fa-lg" id="panier"></i></span></a>
<br><br><br>
<table class="table table-sm table-bordered">
 <caption>Emploi du temps pour Easy-Cardio (Seulement <strong>500</strong> DH<strong> 2</strong> séances par semaine)</caption>
  <thead class="thead" >
    <tr>
      <th style="background-color: white; border-color: white;"></th>
      <th scope="col" style="color: white;">LUNDI</th>
      <th scope="col" style="color: white;">MARDI</th>
      <th scope="col" style="color: white;">MERCREDI</th>
      <th scope="col" style="color: white;">JEUDI</th>
      <th scope="col" style="color: white;">SAMEDI</th>
      <th scope="col" style="color: white;">DIMANCHE</th>
    </tr>
  </thead>
  <tbody>
  <tr>
      <th scope="row">9h:00</th>
      <td></td>
      <td style="background: linear-gradient(to top, #800000 0%, #ffffff 100%);">Musculation</td>

      <td></td>
       <td></td>
      <td style="background: linear-gradient(to top, #999966 0%, #ffffff 100%)">Aquabiking</td>
      <td style="background: linear-gradient(to top, #800000 0%, #ffffff 100%);">Musculation</td>
    </tr>
   
    <tr>
      <th scope="row">10h:00</th>
        <td style="background: linear-gradient(to top, #999966 0%, #ffffff 100%)">Aquabiking</td>
      <td></td>
      <td></td>
       <td></td>
      
      <td style="background: linear-gradient(to top, #999966 0%, #ffffff 100%)">Aquabiking</td>
      <td></td>
    </tr>
    <tr>
      <th scope="row">11h:00</th>
    <td style="background: linear-gradient(to top, #999966 0%, #ffffff 100%)">Aquabiking</td>
      <td style="background: linear-gradient(to top, #800000 0%, #ffffff 100%);">Musculation</td>


      <td></td>
       <td></td>
      <td></td>
      <td style="background: linear-gradient(to top, #800000 0%, #ffffff 100%);">Musculation</td>
    </tr>
     <tr>
      <th scope="row">16h:00</th>
      <td></td>
      <td></td>
      <td></td>
       <td></td>
      <td></td>
      <td ></td>
    </tr>
     <tr>
      <th scope="row">17h:00H</th>
      <td></td>
      <td ></td>
      <td style="background: linear-gradient(to top, #999966 0%, #ffffff 100%)">Aquabiking</td>
       <td></td>
      <td></td>
       <td></td>
    </tr>
    <tr>
      <th scope="row">19h:00H</th>
      <td></td>
      <td></td>
      <td style="background: linear-gradient(to top, #999966 0%, #ffffff 100%)">Aquabiking</td>
       <td></td>
      <td></td>
      <td></td>
    </tr>
    
    <tr>
      <th scope="row">20h:00</th>
      <td></td>
      <td></td>
        <td style="background: linear-gradient(to top, #800000 0%, #ffffff 100%);">Musculation</td>
              <td></td>

      <td></td>
      <td></td>
     </tr>
     <tr>
      <th scope="row">21h:00</th>
      <td></td>
      <td></td>
      <td ></td>
      <td style="background: linear-gradient(to top, #800000 0%, #ffffff 100%);">Musculation</td>

      <td></td>
      <td></td>
    </tr>
  </tbody>
  
</table>




</div>

<br><br>
<button type="button" class="btn btn-outline-secondary btn-lg" id="reglerE"  data-toggle="modal" data-target=".bd-example-modal-xl" data-toggle="tooltip" data-placement="bottom"  title="Click ici pour Afficher l'emploi !!" onclick="myFunction2()">Voir l'Emploi du séances </button>





<script>

function myFunction2() {
  var x = document.getElementById("empl");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}
$('[data-toggle="tooltip"]').tooltip();
</script>










</body>
</html>