<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
 <script src="https://kit.fontawesome.com/209a6e480f.js" crossorigin="anonymous"></script>

<title>Easy-Equilibre</title>
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
right: 510px;


}
#addPanier{
position: absolute;
right: 510px;
display: flex;

}
#deja{
display : none;
}
#choisir{

}

#tableE{
border-radius: 15px;



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
#valider {
 background-color: #A52A2A;

}
div.sticky {
  position: -webkit-sticky;
  position: sticky;
  top: 0;
 
  padding: 50px;

}
#choisir{

position: absolute;
right: 600px;

margin-bottom: px;
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
#mySidenav a {
  position: absolute;
  left: -90px;
  transition: 0.3s;
  padding: 15px;
  width: 250px;
  text-decoration: none;
  font-size: 20px;
  color: white;
  border-radius: 0 5px 5px 0;
}

#mySidenav a:hover {
  left: 0;
}
#about {
  top: 200px;
  background-color: #4CAF50;
}

</style>
</head>
<body>

<c:choose>
<c:when test="${etat2==true }">
<jsp:include page="menuVisiteur.jsp"></jsp:include>
<div class="links"><a href="preparerCompte.jsp" id="links">Préparer mon compte <span><i class="fas fa-angle-right"></i></span></a><a href="decouvrirProg.do?id=${ sessionScope.sessionUtilisateur }" id="links">Nos Programmes<span><i class="fas fa-angle-right"></i></span></a><a href="">
Eazy-Equilibre

</a></div></c:when>
<c:otherwise>
<jsp:include page="menuAdh.jsp"></jsp:include>
<div class="links"><a href="decouvrirProg.do?id=${ sessionScope.sessionUtilisateur }" id="links">Nos Programmes<span><i class="fas fa-angle-right"></i></span></a><a href="">
Eazy-Equilibre

</a></div>
</c:otherwise></c:choose> 


<br>

<div class="container" >
  <h1 style=" text-align: center;">Easy-Equilibre</h1>
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
     <img src="images/box3.jpg" alt="pilate" class="img-thumbnail">
    </div>
    <div class="col">
       <img src="images/BoxeWemen.jpg" alt="pilate" class="img-thumbnail">
    </div>
    <div class="col">
        <img src="images/pilates2.jpg" alt="pilate" class="img-thumbnail">
    </div>
  </div>
</div>

<h1>1-Pilates</h1>

<p  class="text-justify">Le Pilates est une technique de gymnastique qui s’inspire du yoga, de la danse et de la gymnastique. La méthode Pilates permet de rééquilibrer les muscles du corps, en se concentrant sur les muscles centraux qui interviennent dans l’équilibre postural, 
et le maintien de la colonne vertébrale.</p>

<ul class="pi">
<li ><strong>Temps:</strong>45 ou 60 minutes </li>
<li><strong>Calories brûlées: </strong> 700( en moyenne)</li>
<li><strong>Niveau:</strong>Easy</li>
</ul>
<h1>Les bienfaits du Pilates ?</h1>

<ul class="pi">


<li >Tonifie le corps </li>
<li>Affine la silhouette</li>
<li>Réduit les tensions musculaires de la nuque et du dos</li>

</ul>


<br><br>




<h1>2-Boxe</h1>

<p  class="text-justify">S’il y a bien un sport qui peut vous aider à perdre du poids, à vous muscler et à affiner vos muscles, c’est la boxe.
 Avec le Boxe votre corps se muscle, se tonifie dans son ensemble, vous développez des réflexes au niveau des mains, des pieds, vos sens ont une meilleure acuité car vous êtes toujours aux aguets, toujours sur le qui-vive.</p>

<ul class="pi">
<li ><strong>Temps:</strong>45 ou 60 minutes </li>
<li><strong>Calories brûlées: </strong> 800( en moyenne)</li>
<li><strong>Niveau:</strong>Meduim</li>

</ul>
<h1>Les bienfaits du Boxe ?</h1>

<ul class="pi">


<li >Entretenue Votre Respiration</li>
<li>Dévelepement des réflexes</li>
<li>les muscles de cœur deviennent plus résistants.</li>

</ul>



   
     



<div class="container" style="width: 800px" id="empl">


<a   onclick="return confirm('Etes-vous sur de votre choix?  ?')" href="choisirProgramme.do?idP=${ 1 }&idc=${ sessionScope.sessionUtilisateur }" class="btn btn-outline-danger btn-lg" id="addPanier"   data-toggle="tooltip" data-placement="bottom"  title="Click ici pour rejoindre Easy-equilibre !!" >Ajouter au panier <span ><i class="fas fa-cart-plus fa-lg" id="panier"></i></span></a>
<br><br><br>
<table class="table table-sm table-bordered">
 <caption>Emploi du temps pour Easy-equilibre (Seulement <strong>400</strong> DH<strong> 2</strong> séances par semaine)</caption>
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
     <th scope="row">7h:00</th>
     <td style="background: linear-gradient(to top, #800000 0%, #ffffff 100%);">Pilates</td>
      <td></td>
      <td style="background: linear-gradient(to top, #800000 0%, #ffffff 100%);">Pilates</td>
       <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th scope="row">9h:00</th>
      <td style="background: linear-gradient(to top, #800000 0%, #ffffff 100%);">Pilates</td>
      <td style="background: linear-gradient(to top, #999966 0%, #ffffff 100%)">Boxe</td>
      <td></td>
       <td></td>
      <td></td>
      <td style="background: linear-gradient(to top, #999966 0%, #ffffff 100%);">Boxe</td>
    </tr>
    <tr>
      <th scope="row">10h:00</th>
      <td></td>
      <td style="background: linear-gradient(to top, #999966 0%, #ffffff 100%);">Boxe</td>
      <td></td>
       <td></td>
      <td></td>
      <td style="background: linear-gradient(to top, #999966 0%, #ffffff 100%);">Boxe</td>
    </tr>
     <tr>
      <th scope="row">16h:00H</th>
      <td></td>
      <td style="background: linear-gradient(to top, #999966 0%, #ffffff 100%);">Boxe</td>
      <td></td>
       <td></td>
      <td></td>
      <td></td>
    </tr>
     <tr>
      <th scope="row">17h:00H</th>
      <td></td>
      <td style="background: linear-gradient(to top, #999966 0%, #ffffff 100%);">Boxe</td>
      <td></td>
       <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th scope="row">18h:00H</th>
      <td></td>
      <td></td>
      <td></td>
       <td style="background: linear-gradient(to top, #800000 0%, #ffffff 100%);">Pilates</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th scope="row">19h:00</th>
      <td></td>
      <td></td>
      <td style="background: linear-gradient(to top, #800000 0%, #ffffff 100%);">Pilates</td>
       <td style="background: linear-gradient(to top, #800000 0%, #ffffff 100%);">Pilates</td>
      <td></td>
      <td></td>
    </tr>
  </tbody>
  
</table>





</div>
<br><br>
<button type="button" class="btn btn-outline-secondary btn-lg" id="reglerE"  data-toggle="modal" data-target=".bd-example-modal-xl" data-toggle="tooltip" data-placement="bottom"  title="Click ici pour Afficher l'emploi !!" onclick="myFunction2()">Voir l'Emploi du séances </button>












































































<script>
// Example starter JavaScript for disabling form submissions if there are invalid fields
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




















<script>
function myFunction() {
  var x = document.getElementById("empl");
  if (window.getComputedStyle(x).display === "none") {
    x.style.display = "block";
  }
}

function myFunction2() {
  var x = document.getElementById("empl");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}
$('[data-toggle="tooltip"]').tooltip();




/* function table(){
var 	L = document.getElementById("lundi");
var 	M = document.getElementById("mardi");
var     ME = document.getElementById("mercredi");	
var     J = document.getElementById("jeudi");
var     S = document.getElementById("samedi");
var    D = document.getElementById("dimanche");
var comp = 0; 
var message = document.getElementById("erreurs");
if(L != "") { comp++;}
if(M != "") { comp++;}
if(ME != "") { comp++;}
if(J != "") { comp++;}
if(S != "") { comp++;}
if(D != "") { comp++;}
try{
	
	
	if(L == "" && M == "" && ME == "" && J == "" && S == "" && D == "" ) throw "Vous devais selectioner un horaire avant de valider";
	if(comp < 2) throw "choisir au moin 2 seance"
	if(comp > 2) throw "coisir seumlement deux horaore"
}
	catch(erreur){
		 message.innerHTML = "Failed !! " + erreur;
		
		
	}
} */
function Panier(){
	var L = document.getElementById("addPanier");
	var  M= document.getElementById("deja");
 confirm('Etes-vous sur de votre choix?  ?');
 if (L.style.display === "none") {
	    L.style.display = "block";
	  } else {
	    L.style.display = "none";
	  }
	
}

</script>













<!-- 

<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop">
  Launch static backdrop modal
</button>

<div class="modal-body">
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-4">.col-md-4</div>
      <div class="col-md-4 ml-auto">.col-md-4 .ml-auto</div>
    </div>
    <div class="row">
      <div class="col-md-3 ml-auto">.col-md-3 .ml-auto</div>
      <div class="col-md-2 ml-auto">.col-md-2 .ml-auto</div>
    </div>
    <div class="row">
      <div class="col-md-6 ml-auto">.col-md-6 .ml-auto</div>
    </div>
    <div class="row">
      <div class="col-sm-9">
        Level 1: .col-sm-9
        <div class="row">
          <div class="col-8 col-sm-6">
            Level 2: .col-8 .col-sm-6
          </div>
          <div class="col-4 col-sm-6">
            Level 2: .col-4 .col-sm-6
          </div>
        </div>
      </div>
    </div>
  </div>
</div> -->









<%-- !-- Modal -->
<div class="modal fade bd-example-modal-xl" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Choisir l'Heure qui vous convient</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="container-fluid">
    <form name="emploi" method="get" action="easyEquilibre.do">
<label>Activité :</label>
  <div class="form-check form-check-inline">
<div class="form-check">
  <input class="form-check-input" type="radio" name="activite" id="pilates" value="pilates" checked>
  <label class="form-check-label" for="esasyEquilibre">
   Pilates
  </label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="activite" id="boxe" value="Boxe">
  <label class="form-check-label" for="esasyEquilibre">
    Boxe
  </label>
</div>
</div>
<br>
<small>Merci de  choisir 2 séance pour chaque activite choisie .</small>
  <div class="form-row">
    <div class="form-group col-sm-2">
    <input type="hidden" name="jourL" value="lundi">
      <label for="lundi">Lundi</label>
      <select name="lundi" class="form-control" id="lundi" >
        <option selected   value="">Choose...</option>
        <option value="8H-9H">8H-9H</option>
      <option value="9H-10H">9H-10H</option>
      <option value="10H-11H">10H-11H</option>
      <option value="11H-12H">11H-12H</option>
      <option value="12H-13H">12H-13H</option>
      </select>
    </div>

      <div class="form-group col-sm-2">
        <input type="hidden" name="jourM" value="mardi">
      <label for="mardi">Mardi</label>
      <select name="mardi" class="form-control" id="mardi">
        <option value="" selected>Choose...</option>
      <option value="8H-9H">8H-9H</option>
      <option value="9H-10H">9H-10H</option>
      <option value="10H-11H">10H-11H</option>
      <option value="11H-12H">11H-12H</option>
      <option value="12H-13H">12H-13H</option>
      </select>
    </div>
    
      <div class="form-group col-sm-2">
        <input type="hidden" name="jour" value="mercredi">
      <label for="mercredi">Mercredi</label>
      <select name="mercredi" class="form-control" id="mercredi">
       <option value="" selected>Choose...</option>
        <option value="8H-9H">8H-9H</option>
      <option value="9H-10H">9H-10H</option>
      <option value="10H-11H">10H-11H</option>
      <option value="11H-12H">11H-12H</option>
      <option value="12H-13H">12H-13H</option>
      </select>
    </div>
      <div class="form-group col-sm-2">
        <input type="hidden" name="jour" value="jeudi">
      <label for="jeudi">Jeudi</label>
      <select name="jeudi" class="form-control" id="jeudi">
        <option value=""selected>Choose...</option>
        <option value="8H-9H">8H-9H</option>
      <option value="9H-10H">9H-10H</option>
      <option value="10H-11H">10H-11H</option>
      <option value="11H-12H">11H-12H</option>
      <option value="12H-13H">12H-13H</option>
      </select>    
        </div>
    
    
    <div class="form-group col-sm-2">
      <input type="hidden" name="jour" value="samedi">
      <label for="samedi">Samedi</label>
      <select name="samedi" class="form-control" id="samedi">
        <option value="" selected>Choose...</option>
       <option value="8H-9H">8H-9H</option>
      <option value="9H-10H">9H-10H</option>
      <option value="10H-11H">10H-11H</option>
      <option value="11H-12H">11H-12H</option>
      <option value="12H-13H">12H-13H</option>
      </select>
    </div>
      <div class="form-group col-sm-2">
        <input type="hidden" name="jour" value="dimanche">
      <label for="dimanche">Dimanche</label>
      <select name="dimanche" class="form-control" id="dimanche">
       <option value="" selected>Choose...</option>
       <option value="8H-9H">8H-9H</option>
      <option value="9H-10H">9H-10H</option>
      <option value="10H-11H">10H-11H</option>
      <option value="11H-12H">11H-12H</option>
      <option value="12H-13H">12H-13H</option>
      </select>
      </div>

     
<%  
      
 String erreur=(String) request.getAttribute("erreur");
    		  out.println(""+erreur);
    		  String erreur2=(String) request.getAttribute("erreur2"); 		
    		  out.println(""+erreur2);
    		  %> 
    		    <div class="alert alert-success alert-dismissible" id="myAlert">
    <button type="button" class="close">&times;</button>
    <strong>Success!</strong> This alert box could indicate a successful or positive action.
  </div> 
     
    <div class="container"><p id="erreurs"></p></div>
     
   <div class="modal-footer" class="btn-group">
    <br><br>
    <button type="submit" class="btn btn-secondary" id="valider">Valider</button>
<button type="button" class="btn btn-secondary"  data-dismiss="modal" id="revenir">Revenir</button>
    </div>
    
  </div>
</form> 
</div>
</div>
      

  
      
    </div>
  </div>
</div>
 --%>



































































<br>
<!--  <table class="table table-bordered">
    <thead>
      <tr>
        <th>lundi</th>
        <th>Mardi</th>
        <th>Mercredi</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td></td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
    </tbody>
  </table>
<form>

<div class="form-check">
<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
<label class="form-check-label" for="exampleRadios1">
  Pilates
</label>
</div>

<div class="form-check">
<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
<label class="form-check-label" for="exampleRadios1">
  Box
</label>
</div>

<div class="form-group">
    <select class="form-control" id="lundi">
    <option selected>Choose...</option>
      <option>8H-9H</option>
      <option>9H-10H</option>
      <option>10H-11H</option>
      <option>11H-12H</option>
      <option>12H-13H</option>
    </select>
  </div>
  <div class="form-group">
    <select class="form-control" id="mardi">
    <option selected>Choose...</option>
      <option>8H-9H</option>
      <option>9H-10H</option>
      <option>10H-11H</option>
      <option>11H-12H</option>
      <option>12H-13H</option>
    </select>
  </div>
  <div class="form-group">
    <select class="form-control" id="mercredi">
    <option selected>Choose...</option>
      <option>8H-9H</option>
      <option>9H-10H</option>
      <option>10H-11H</option>
      <option>11H-12H</option>
      <option>12H-13H</option>
    </select>
  </div>
</form> -->

</body>
</html>