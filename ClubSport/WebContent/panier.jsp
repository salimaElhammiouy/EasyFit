<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
 <script src="https://kit.fontawesome.com/209a6e480f.js" crossorigin="anonymous"></script>

<title>Pérsonnaliser votre programme</title>
<style>

 * {
  box-sizing: border-box;
}

#test {
  background-color: #f1f1f1;
  padding: 60px;
  font-family: Arial;
}

/* Center website */
.main {
  max-width: 1000px;
  margin: auto;
}
h3, h1{

font-weight: bold;
font-family: Bradley Hand, cursive;
}
h4 , h2{

font-weight: bold;
}

.row {
  margin: 8px -16px;
}

/* Add padding BETWEEN each column (if you want) */
.row,
.row > .column {
  padding: 8px;
}
.row{
position: relative ;left : 40px;"

}
#myBtnContainer{

position: relative ;left : 40px;"
}

/* Create three equal columns that floats next to each other */
.column {
  float: left;
  width: 23.33%;
  display: none; /* Hide columns by default */
}

/* Clear floats after rows */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Content */
.content {
  background-color: white;
  padding: 10px;
}

/* The "show" class is added to the filtered elements */
.show {
  display: block;
}

/* Style the buttons */
#fl {
  border: none;
  outline: none;
  padding: 12px 16px;
  background-color: white;
  cursor: pointer;
  font-weight: bold;
}

/* Add a grey background color on mouse-over */
#fl:hover {
  background-color: #A52A2A;
  color:white;
}

/* Add a dark background color to the active button */
#fl.active {
  background-color: #A52A2A;
   color: white;
}
.links{
font-color: white ;
font-weight: bold;
background-color: #A52A2A; 


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
#paiement{
 box-sizing: border-box;
   width: 350px;
   height: 50px;
   font-size: 22px;
   background-color:  #A52A2A;
   margin-left: 72%;

 text-align: center;
border-radius: 25px;
 

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

#v , #v3{
font-size: 15px;
font-family: Bradley Hand, cursive;

}
#v2{

font-weight: bold;
}
</style>
</head>
<body>


<c:choose>
<c:when test="${etat2==true }">
<jsp:include page="menuVisiteur.jsp"></jsp:include>

</c:when>
<c:otherwise>
<jsp:include page="menuAdh.jsp"></jsp:include>

</c:otherwise>
</c:choose>





<c:choose>

<c:when test="${etat== true}">
<br>
<div style="text-align: center;"><button class="btn btn-danger" id="paiement" data-toggle="modal" data-target="#exampleModalCenter">
  Passer au paiement <strong><c:out value="${ montant}"></c:out> </strong>DH
</button></div>



<div class="container">
 
<div class="row">
<c:forEach items="${ modelA.activites }" var="e">
    <div class="col-md">

<div class="card" style="width: 18rem;">
  <img src="${ e.file }" class="card-img-top" alt=" ${ e.nom_activite }" style="width:100%">
  <div class="card-body">
    <p class="card-text"><c:out value=" Catégorie :${ e.categorie }"></c:out> <br>
    <c:out value="Activité: ${ e.nom_activite }"></c:out> </p>
    <c:out value="Nombre de séances: ${ e.nb_seance }"></c:out> 
    <p class="price"><c:out value="${ e.prix_activite }"></c:out> DH</p>
    <p><a type="button" onclick="return confirm('Etes-vous sur de votre choix?  ?')" href="supprimerActivite.do?idact=${ e.id_act }&ida=${ sessionScope.sessionUtilisateur }">Supprimer du panier<span><svg class="bi bi-cart-dash" width="2em" height="2em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M6 7.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5z"/>
  <path fill-rule="evenodd" d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
</svg></span></a></p>
  </div>
</div>
</div>
</c:forEach>



<c:forEach items="${ modelP.programme }" var="e">
    <div class="col-md">

<div class="card" style="width: 18rem;">
  <img src="<c:out value="${ e.src_image }"></c:out>" class="card-img-top" alt="${ e.nom_prog }" style="width:100%">
    
  <div class="card-body">
    <p class="card-text"><c:out value="Programme :"></c:out> 
    <c:out value=" ${ e.nom_prog }"></c:out> </p>
    <p class="card-text"><c:out value="${ e.pro }"></c:out>
    <p class="price"><c:out value="${ e.prix_programme }"></c:out> DH </p>
    <p><a type="button" onclick="return confirm('Etes-vous sur de votre choix?  ?')" href="supprimerProgramme.do?idP=${ e.id_prog }&ida=${ sessionScope.sessionUtilisateur }">Supprimer du panier<span><svg class="bi bi-cart-dash" width="2em" height="2em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M6 7.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5z"/>
  <path fill-rule="evenodd" d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
</svg></span></a></p>
  </div>
</div>
</div>
</c:forEach> 
</div>

</div>
</c:when>


<c:when test="${etat== false}">
<br>
<div class="container" style="height: 420px; width: 800px; background-color: white; text-align: center;">
<br>
 <img src="<c:out value="${ imagePanierVide }"></c:out>" class="card-img-top" alt="panierVide" id="paniervide" style="width:300px; height: 250px; margin-top: 2px;">
<br>
<p id="v"><c:out value="${ vide }"></c:out>

<p id="v2"><strong><c:out value="${ vide2 }"></c:out></strong>
<br>
<p id="v3"><c:out value="${ vide3 }"></c:out>

<p>Cliquez <a href="preparerCompte.jsp" onmouseover="style.color='#A52A2A'"><strong>ICi</strong></a> pour découvrir nos activités
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
  
     
      
       
       <form class="needs-validation"  action="validerPaiement.do"  method="get"  novalidate>

  <input type="hidden" value="${ sessionScope.sessionUtilisateur }" name="id">
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