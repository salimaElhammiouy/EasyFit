<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<title>Paiment En Ligne </title>
<style>

#divv1{
background-color: white;
height: 900px;
width: 900px;
margin-top: 2%;
margin-left: 1%;
}
#divv2{
background-color: #A52A2A ;
height: 600px;
width: 350px;

margin-top: 5%;

}
#neww{
border: 1px white solid ;
border-radius: 5px;
background-color: white;
font-weight: bold;
text-align: center;
font-size: 25px;
color: #A52A2A;

}
#tnew{
font-weight: bold;
font-size: 15px;

text-align: left;
}
#voir{
color: #A52A2A;

}
#nn{
height: 10px;
}

.container {
  border: 2px solid #dedede;
  background-color:white;
  border-radius: 5px;
  padding: 10px;
  margin: 10px 0;
}


/* Clear floats */
.container::after {
  content: "";
  clear: both;
  display: table;
}


/* Style time text */
.time-right {
  float: right;
  color: #aaa;
}


#more{
border-radius: 40px;
font-weight: bold;
width: 270px;
text-align: center;
margin-left: 8%;
}

.flip-box {
  background-color: transparent;
  width: 250px;
  height: 200px;
  border: 1px solid #f1f1f1;
  perspective: 1000px;
}

.flip-box-inner {
  position: relative;
  width: 100%;
  height: 100%;
  text-align: center;
  transition: transform 0.8s;
  transform-style: preserve-3d;
}

.flip-box:hover .flip-box-inner {
  transform: rotateY(180deg);
}

.flip-box-front, .flip-box-back {
  position: absolute;
  width: 100%;
  height: 100%;
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
}

.flip-box-front {
  background-color: #bbb;
  color: black;
}

.flip-box-back {
  background-color: dodgerblue;
  color: white;
  transform: rotateY(180deg);
}
p.titre{
	text-transform: uppercase;
	font-weight: bolder;
	margin-left:40%;
	font-size: x-large;
	text-decoration: underline;
}
.card-text{
font-size: 15px; ;
font-family: Bradley Hand, cursive;
}


.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}


#prog {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 500px;
  max-height: 200px;
  margin: auto;
  text-align: center;
  font-family: arial;
}

.price {
  color: grey;
  font-size: 22px;
}

.card a {
  border: none;
  outline: 0;
  padding: 12px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}

.card a:hover {
  opacity: 0.7;
}
#icoon{

font-size: 30px;
}

#paiement{
box-sizing: border-box;
   width: 350px;
   height: 50px;
   font-size: 22px;
   background-color:  #A52A2A;
   margin-left: 72%;

 text-align: center;
border-radius: 25px;}
}
#paie{
font-weight: bolder;
font-family:  cursive;
font-size: 15px;
}

#accept{
font-family:  cursive;


}






.card-text{
font-weight: ;
font-family: Bradley Hand, cursive;
}


.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}


#prog {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 500px;
  max-height: 200px;
  margin: auto;
  text-align: center;
  font-family: arial;
}

.price {
  color: grey;
  font-size: 22px;
}

.card a {
  border: none;
  outline: 0;
  padding: 12px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}

.card a:hover {
  opacity: 0.7;
}
#paniervide{
 box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}
#v , #v3{
font-size: 13px;
font-family: Bradley Hand, cursive;

}
#v2{

font-weight: bold;
}
#pp{ 
 border: 2px solid #dedede;
  background-color:white;
  border-radius: 5px;
  padding: 10px;

  }

#date{
text-align: center;
text-decoration: underline;
font-weight: o

}
</style>
</head>
<body>



<jsp:include page="menuAdh.jsp"></jsp:include>


 <div class="row">
    <div class="col-8"><div  id="divv1">

<p class="titre"></p>


<c:choose>

<c:when test="${etat== true}">

<br>
<div style="text-align: center;"><button class="btn btn-danger" id="paiement" data-toggle="modal" data-target="#exampleModalCenter">
  Passer au paiement <strong><c:out value="${ montant}"></c:out> </strong>DH
</button></div>

<div class="container" id="pp">

<div class="row">
 <p id="date">Votre paiement du mois :<c:out value="${ h }"></c:out>
<c:forEach items="${model.activs }" var="e">


 <hr>
    <div class="col">

<div class="card" style="width: 18rem;">
  <img src="${ e.file }" class="card-img-top" alt=" ${ e.nom_activite }" style="width:100%">
  <div class="card-body">
    <p class="card-text"><c:out value=" Catégorie :${ e.categorie }"></c:out> <br>
    <c:out value="Activité: ${ e.nom_activite }"></c:out> </p>
    <c:out value="Nomre de séance: ${ e.nb_seance }"></c:out> 
    <p class="price"><c:out value="${ e.prix_activite }"></c:out> DH</p>
    <p><a type="button" href="supprimerActivite.do?idact=${ e.id_act }&ida=${ 2 }">Supprimer de panier<span><svg class="bi bi-cart-dash" width="2em" height="2em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M6 7.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5z"/>
  <path fill-rule="evenodd" d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
</svg></span></a></p>
  </div>
</div>
</div>
</c:forEach>



<c:forEach items="${  model.programme }" var="e">
    <div class="col">

<div class="card" style="width: 18rem;">
  <img src="<c:out value="${ e.src_image }"></c:out>" class="card-img-top" alt="${ e.nom_prog }" style="width:100%">
    
  <div class="card-body">
    <p class="card-text"><c:out value="Programme :"></c:out> 
    <c:out value=" ${ e.nom_prog }"></c:out> </p>
    <p class="price"><c:out value="${ e.prix_programme }"></c:out> DH </p>
    <p><a type="button" href="supprimerProgramme.do?idP=${ e.id_prog }&ida=${ 2 }">Supprimer de panier<span><svg class="bi bi-cart-dash" width="2em" height="2em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M6 7.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5z"/>
  <path fill-rule="evenodd" d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
</svg></span></a></p>
  </div>
</div>
</div>
</c:forEach> 
</div></div>


</c:when>


</c:choose>

























<div class="container">






<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" >
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Paiement En ligne de vous factures</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
     
      <div class="modal-body">
      
      <div> <label id="paie">Montant Total:</label></div> <input type="text" value="${ montant } DH " >
  
     
      
       
       <form class="needs-validation"  action="validerPaiement.php"  method="post"  novalidate>

  
      <label for="validationCustom01" id="paie">Nom et Prenom de propriétaire de la carte</label>
      <input type="text" class="form-control" id="validationCustom01" required>
      <div class="invalid-feedback">
       Veuillez remplir ce champ !
      </div>
    
    
      <label for="validationCustom02" id="paie">Numéro de la carte</label>
      <input type="text" class="form-control" id="validationCustom02" required>
      <div class="invalid-feedback">
        Veuillez remplir ce champ !
      </div>
    
   <br>
  <div class="form-group">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
      <label class="form-check-label" for="invalidCheck" id="accept">
        J'ai lu et j'accepte les conditions particulières d'utilisation, notamment la mention relative à la protection des données personnelles
      </label>
      <div class="invalid-feedback">
         Veuillez accepeter avant de valider
      </div>
    </div>
  </div>
 <small>Vous pouver imprimer vous facture depuis votre compte personnel</small>
<br>
       
      
      
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="modelp">Fermer</button>
        <a type="submit" class="btn btn-danger" id="modelp" href="validerPaiement.do?id=${ sessionScope.sessionUtilisateur }">Valider</a>
      </form>
       
    </div>
  
  </div>
</div>

</div>






</div>






















</div></div>
    <div class="col-4"><div class="container" id="divv2">
    <div id="neww"><p>Découvrire notre Newsletters </div>
<div class="container" >
 
  <p id="tnew">Hello. How are you today?</p>
  <a href="" id="voir">voir plus ...</a>
  <span class="time-right">11:00</span>
</div>

<div class="container">
 
  <p id="tnew">Hello. How are you today?</p>
  <a href="" id="voir">voir plus ...</a>
  <span class="time-right">11:00</span>
</div>


<div class="container">
 
  <p id="tnew">Hello. How are you today?</p>
  <a href="" id="voir">voir plus ...</a>
  <span class="time-right">11:00</span>
</div>
<div class="container">
 
  <p id="tnew">Hello. How are you today?</p>
  <a href="" id="voir">voir plus ...</a>
  <span class="time-right">11:00</span>
</div>

<br>
<button type="button" class="btn btn-light" id="more">Tous Les news <span><i class="fas fa-angle-double-right"></i></span></button>











</div>
</div>
  </div>

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  </body>
  </html>