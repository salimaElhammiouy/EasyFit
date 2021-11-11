<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<title>Historique des programmes</title>
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
  height: 97px;
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
margin-top: -6%;
}

p.titre{
	text-transform: uppercase;
	font-weight: bolder;
	margin-left:30%;
	font-size: large;
	text-decoration: underline;
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
#date{
width: 300px;
}
#paiement{
 box-sizing: border-box;
   width: 350px;
   height: 50px;
   font-size: 22px;
   background-color:  black;
border-color: black;
 text-align: center;
border-radius: 25px;
 

}
#paiement:hover{
opacity: 0.5;
}
#cnn{

width: 900px; 
 border: 2px solid #dedede;
  background-color:white;
  border-radius: 5px;
  padding: 10px;
  height: 150px;

}
</style>
</head>
<body>



<jsp:include page="menuAdh.jsp"></jsp:include>

<div class="container" id="cnn">
<p class="titre">Historique des programmes
<form action="chercherhisto.de" method="get">
  <div class="row">
    <div class="col">
    <label>Recherche dans l'historique:</label>
      <input type="hidden" value="${ sessionScope.sessionUtilisateur }" name="id">
      <div class="input-group">
      <input type="date" class="form-control"  name="date" placeholder="mois" id="date" value="${ date }">
      <input type="hidden" name="montt" value="${ montant }">
   <div class="input-group-append">
    <button class="btn btn-outline-danger" type="submit" id="button-addon2">Chercher</button>
  </div>
    </div>
    </div>
  </div>
</form>
</div>
<c:choose>
<c:when test="${etat== true}">
<div class="container" Style="border-color: white; ">
 <div class="card text-center" style="text-align: center;">
  <div class="card-header">
  Votre Programme de date :<strong> <c:out value="${date}"></c:out></strong>
  </div>
 <br>
<div class="row">


<c:forEach items="${ modelA.activs }" var="e">
    <div class="col">

<div class="card" style="width: 18rem;">
  <img src="${ e.file }" class="card-img-top" alt=" ${ e.nom_activite }" style="width:100%">
  <div class="card-body">
    <p class="card-text"><c:out value=" Catégorie :${ e.categorie }"></c:out> <br>
    <c:out value="Activité: ${ e.nom_activite }"></c:out>
    <c:out value="Nomre de séance: ${ e.nb_seance }"></c:out> 
    <p class="price"><c:out value="${ e.prix_activite }"></c:out> DH</p>
  </div>
</div>
</div>
</c:forEach>



<c:forEach items="${ modelP.programme }" var="e">
    <div class="col">

<div class="card" style="width: 18rem;">
  <img src="<c:out value="${ e.src_image }"></c:out>" class="card-img-top" alt="${ e.nom_prog }" style="width:100%">
    
  <div class="card-body">
    <p class="card-text"><c:out value="Programme :"></c:out> 
    <c:out value=" ${ e.nom_prog }"></c:out> </p>
    <p class="card-text"><c:out value="${ e.pro }"></c:out>
    <p class="price"><c:out value="${ e.prix_programme }"></c:out> DH </p>
  </div>
</div>
</div>
</c:forEach> 
</div>

</div>
<br>
<div style="text-align: center;"><button class="btn btn-danger" id="paiement" data-toggle="modal" data-target="#exampleModalCenter">
  Passer au paiement <strong><c:out value="${ montant}"></c:out> </strong>DH
</button></div>
</div>
</c:when>
<c:when test="${etat== false}">

<div style="text-align: center;" id="newslette">

 <img src="<c:out value="${ image }"></c:out>" class="card-img-top" alt="panierVide" id="paniervide" style="width:350px; height: 300px; margin-top: 2px;">
<br>


<p id="v2"><strong>Vous n'avez aucune activité dans la date saisie  !!</strong>
<br>

</div>
</c:when>
</c:choose>




















<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" >
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Paiement En ligne de vos factures</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
     
      <div class="modal-body">
      
      <div> <label id="paie">Montant Total:</label></div> <input type="text" value="${ montant } DH " >
  
     
      
       
       <form class="needs-validation"  action="validerPaiement.de"  method="get"  novalidate>

  <input type="hidden" value="${ sessionScope.sessionUtilisateur }" name="id">
  <input type="date"  hidden value="${ date }" name="dat">
  <input type="text" hidden value="${ montant }" name="mont">
  
      <label for="validationCustom01" id="paie">Nom et Prénom de propriétaire de la carte</label>
      <input type="text" class="form-control" id="validationCustom01"  required>
      <div class="invalid-feedback">
       Veuillez remplir ce champ !
      </div>
    
    
      <label for="validationCustom02" id="paie">Numéro de la carte</label>
      <input type="text" class="form-control" id="validationCustom02" size="14" maxlength="14" pattern="[0-9]{14}"  required>
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
 <small>Vous pouvez imprimer vos factures depuis votre compte personnel</small>
<br>
       
      
      
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="" >Fermer</button>
        <button type="submit" class="btn btn-danger"  >Valider</button>
      </form>
       
    </div>
  
  </div>
</div>

</div>



<script>
(function() {
	  'use strict';
	  window.addEventListener('load', function() {
	    // Fetch all the forms we want to apply custom Bootstrap validation styles to
	    var forms = document.getElementsByClassName('needs-validation');
	    // Loop over them and prevent submission
	    var validation = Array.prototype.filter.call(forms, function(form) {
	      form.addEventListener('submit', function(event) {
	        if (form.checkValidity() === false) {
	          event.preventDefault();
	          event.stopPropagation();
	        }
	        form.classList.add('was-validated');
	      }, false);
	    });
	  }, false);
	})();
	</script>


















</body>
</html>