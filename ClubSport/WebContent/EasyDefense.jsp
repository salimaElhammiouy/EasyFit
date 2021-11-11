<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
 <script src="https://kit.fontawesome.com/209a6e480f.js" crossorigin="anonymous"></script>

<title>Easy-Defense</title>
<style>



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
.nav-item{
	margins: 20px 20px 20px 20px;
	color:white;}
.btn-group{

   margin-top: 40px;
  margin-right: 10px;
  margin-left: 200px;
 
 }

  /* Make the image fully responsive */
.carousel-inner img {
    width: 60%;
    height: 50%;
  }
  


#empl{
display: none;
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
</style>
</head>
<body>

<c:choose>
<c:when test="${etat2==true }">
<jsp:include page="menuVisiteur.jsp"></jsp:include>
<div class="links"><a href="preparerCompte.jsp" id="links">Préparer mon compte <span><i class="fas fa-angle-right"></i></span></a><a href="decouvrirProg.do?id=${ sessionScope.sessionUtilisateur }" id="links">Nos Programmes<span><i class="fas fa-angle-right"></i></span></a><a href="">
Easy-Defense

</a></div></c:when>
<c:otherwise>
<jsp:include page="menuAdh.jsp"></jsp:include>
<div class="links"><a href="decouvrirProg.do?id=${ sessionScope.sessionUtilisateur }" id="links">Nos Programmes<span><i class="fas fa-angle-right"></i></span></a><a href="">
Easy-Defense

</a></div>
</c:otherwise></c:choose> 

<br>

<div class="container" >
  <h1 style=" text-align: center;">Easy-Defense</h1>
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
     <img src="images/tay1.jpeg" alt="musculMan" class="img-thumbnail">
    </div>
    <div class="col">
       <img src="images/tay2.jpeg" alt="aquacardio" class="img-thumbnail">
    </div>
    <div class="col">
        <img src="images/musculWeman.jpg" alt="musculWeman" class="img-thumbnail">
    </div>
  </div>
</div>

<h1>1-MUAY THAI</h1>

<p  class="text-justify">La boxe thaïlandaise abrégée Muay-Thaï c'est la boxe la plus populaire d’Asie du Sud-Est. Le MUAY-THAI
 est un art martial ancestral qui prône des valeurs morales fortes. Combat pieds points, c'est la boxe la plus
  complète puisqu'on utilise toutes les parties du corps pour frapper son opposant. Il s'agit d'un sport de combat connu pour
   être une pratique sportive violente car il possède un aspect spirituel très fort. Cette boxe est réputée comme étant l'un des sports de 
combat les plus efficaces.</p>

<ul class="pi">
<li ><strong>Temps:</strong>45 ou 60 minutes </li>
<li><strong>Calories brûlées: </strong> 700( en moyenne)</li>
<li><strong>Niveau:</strong>Hard</li>
</ul>
<h1>Les bienfaits du MUAY THAI ?</h1>

<ul class="pi">


<li >Tonifie le corps </li>
<li>Affine la silhouette</li>
<li>Se muscler permet de prévenir les effets du vieillissement.</li>

</ul>


<br><br>




<h1>2-Karate</h1>

<p  class="text-justify">Karaté , art martial dit Japonais , c'est un art de guerre fait pour se défendre ! un sport de 
combat très bénéfique pour la santé qui peut être pratiqué de le plus jeune âge. Initiation a l'auto-défense, le Karaté fait appel à 
la coordination et l'équilibre mais permet aussi un entretien physique général. Il développe le cardio, la musculation et l’endurance . 
Il permet de canaliser l'énergie, se défouler, tout en respectant les règles de jeu. 
Vous n'avez plus qu'á reussir vos passages de ceintures de Karaté.</p>
<ul class="pi">
<li ><strong>Temps:</strong>45 ou 60 minutes </li>
<li><strong>Calories brûlées: </strong> 750( en moyenne)</li>
<li><strong>Prix:</strong> Hard</li>
</ul>
<h1>Les bienfaits du Karate ?</h1>

<ul class="pi">


<li >Raffermir la peau</li>
<li>Muscler les cuisses et les mollets</li>
<li>Améliorer la coordination.</li>

</ul>


<div class="container" style="width: 800px" id="empl">


<a onclick="return confirm('Etes-vous sur de votre choix?  ?')" href="choisirProgramme.do?idP=${ 6 }&idc=${ sessionScope.sessionUtilisateur }" class="btn btn-outline-danger btn-lg" id="addPanier"   data-toggle="tooltip" data-placement="bottom"  title="Click ici pour rejoindre Easy-equilibre !!" >Ajouter au panier <span ><i class="fas fa-cart-plus fa-lg" id="panier"></i></span></a>
<br><br><br> 

<table class="table table-sm table-bordered">
 <caption>Emploi du temps pour Easy-Defense (Seulement <strong>500</strong> DH<strong> 2</strong> séances par semaine)</caption>
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
       <td style="background: linear-gradient(to top, #800000 0%, #ffffff 100%);">Karate</td>

      <td></td>
       <td></td>
      <td></td>
       <td style="background: linear-gradient(to top, #800000 0%, #ffffff 100%);">karate</td>
    </tr>
   
    <tr>
      <th scope="row">10h:00</th>
        <td></td>
      <td style="background: linear-gradient(to top, #800000 0%, #ffffff 100%);">Karate</td>
      <td></td>
       <td></td>
      
         <td ></td>
      <td></td>
    </tr>
    

     <tr>
      <th scope="row">15h:00</th>
        <td></td>
       <td></td>
      <td></td>
       <td></td>
      
      <td></td>
       <td style="background: linear-gradient(to top, #999966 0%, #ffffff 100%)">MUAY THAI</td>
    </tr>
     <tr>
      <th scope="row">16h:00</th>
      <td style="background: linear-gradient(to top, #999966 0%, #ffffff 100%)">MUAY THAI</td>
      <td></td>
      <td></td>
      <td ></td>
      <td></td>
      <td></td>
    </tr>
     <tr>
      <th scope="row">17h:00H</th>
      <td style="background: linear-gradient(to top, #999966 0%, #ffffff 100%)">MUAY THAI</td>
      <td></td>
      <td></td>
       <td style="background: linear-gradient(to top, #999966 0%, #ffffff 100%)">MUAY THAI</td>
      <td></td>
       <td></td>
    </tr>
    <tr>
      <th scope="row">19h:00H</th>
      <td></td>
      <td></td>
       <td style="background: linear-gradient(to top, #999966 0%, #ffffff 100%)">MUAY THAI</td>

           <td style="background: linear-gradient(to top, #800000 0%, #ffffff 100%);">karate</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th scope="row">20h:00H</th>
      <td></td>
      <td></td>
       <td style="background: linear-gradient(to top, #999966 0%, #ffffff 100%)">MUAY THAI</td>

         <td style="background: linear-gradient(to top, #800000 0%, #ffffff 100%);">karate</td>
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