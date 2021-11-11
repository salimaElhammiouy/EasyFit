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

h1 {
  font-size: 50px;
  word-break: break-all;
  font-weight: bold;
  
}
h4 , h2{

font-weight: bold;
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
h4{
font-family: Bradley Hand, cursive;
 
  
    margin: auto;  
  padding: 50px;
  text-align: center;
  

}
h5{
  
 
  text-align: center;
  font-weight: bold;
  font-size: 30px;
color: #A52A2A;

}
#desc {
margin-left: 15px ;
margin-top: 5px;
font-family:  cursive;


text-indent: 50px;
  text-align: justify;
  letter-spacing: 1px;
  font-size: 17px;
  font-weight: bold;
  color : gray;
}
#myIn{
  text-align: justify;
  letter-spacing: 1px;
  font-size: 17px;
font-style: Impact, Charcoal, sans-serif;
  color : #808080;

}
#plan{

font-family:  cursive;
text-align: justify;
  letter-spacing: 1px;
  font-size: 19px;
 text-align: center;
color: #191970;
font-weight: bold;
 
}
#duree{
font-family:  cursive;
font-weight : bold;
border-radius: 50%; 
background-color: white; 
color: #A52A2A;
height: 120px; 
width: 120px;
border: 3px;
border-color: Black;
border-style: ridge solid ;
 transform: rotateY(360deg);
 cursor: auto;
}
#panier{

font-size: 30px;
cursor: pointer;
color: #A52A2A;
}


}
#panier:hover{

color:black;

}
th{

text-align: center;
background-color:  #A52A2A;
color: white;

}

td{
width: 100px;
text-align: center;
font-style: italic;
font-weight: bold;
height: 50px

}
table{
border-radius: 30px;

}
#myInput{
width: 350px;

}
.col-6{
margin-right: 380px;
 margin-left: 15px;
}

#paie{
font-weight: bolder;
font-family:  cursive;
font-size: 15px;
}

#accept{
font-family:  cursive;


}
#paiement{
 box-sizing: border-box;
   width: 250px;
   height: 50px;
   font-size: 22px;
   background-color:  #A52A2A;
 text-align: center;
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
<div class="links"><a href="preparerCompte.jsp" id="links">Préparer mon compte <span><i class="fas fa-angle-right"></i></span></a><a href="personnaliserProg.do?id=${ sessionScope.sessionUtilisateur }" id="links">Personnaliser mon programme<span><i class="fas fa-angle-right"></i></span></a><a href="">
<c:out value="${ noma }"></c:out> </a></div></c:when>
<c:otherwise>
<jsp:include page="menuAdh.jsp"></jsp:include>
<div class="links"><a href="personnaliserProg.do?id=${ sessionScope.sessionUtilisateur }" id="links">Activités<span><i class="fas fa-angle-right"></i></span></a><a href="">
<c:out value="${ noma }"></c:out> 

</a></div></c:otherwise>
</c:choose>




<h4><c:forEach  items="${ modelA.activites }"   var='k' >
 <c:out value="${ k.nom_activite }"></c:out> 
</c:forEach></h4>
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
<div>
<p  class="text-justify" id="desc" ><c:forEach  items="${ modelA.activites }"   var='m'  >
 <c:out value="${ m.description }"></c:out> 
</c:forEach>
</div>






<div class="container" style="margin-right: 15px;">



  <div class="row">
    <div class="col">
   <button type="button" class="btn btn-danger"  id="duree">Durée<br><span><i class="fas fa-stopwatch fa-2x"></i></span></button><br>
   <h2><c:forEach  items="${ modelA.activites }"   var='f'  >
 <c:out value="${ f.duree }"></c:out> min
</c:forEach></h2>
   
  </div>
    
    
    
    <div class="col">
   <button type="button" class="btn btn-danger"  id="duree">Niveau<br><span><i class="fas fa-sort-amount-up-alt fa-2x"></i></span></button><br>
   <h2><c:forEach  items="${ modelA.activites }"   var='f' >
 <c:out value="${ f.niveau }"></c:out> 
</c:forEach></h2>
  </div>
    
   
    <div class="col">
     <button type="button" class="btn btn-danger"  id="duree">Calories<br><span><i class="fas fa-running fa-2x"></i></span><br></button><br>
         <h2><c:forEach  items="${ modelA.activites }"   var='f'  >
 <c:out value="${ f.calories }"></c:out>  kcal
</c:forEach></h2>
  </div>
    
    
</div>
</div>



<br><br><br>

<div><h5>PLANNINGS</h5></div>

<p id="plan">Consultez tous nos plannings de ce cours collectif<br>
Filtrez selon vos besoins.</p>

<br><br><br>

<div class="container">
  <div class="row">
    <div class="col">
    
    </div>
    <div class="col-6" style="">
<label for="myImput" id="myIn">Choisir Les Séance selon vos disponibilités</label>
 <input class="form-control" id="myInput" type="text" placeholder="Search.." class="sr-only" >
    </div>
    <div class="col">
 
    </div>
  </div>

</div>












<br>
<div class="container" style="margin-left: 200px; margin-right: 90px" >

<table border="1" style="width :80% ;">
  
    <tr class="titre" >
      <th>Jour</th>
      <th >Horaire</th>
      <th >Moniteur</th>
      <th >Ajouter au panier</th>
    </tr>
 
<tbody id="myTable">
  <c:forEach  items="${ modelS.seances }"   var='e'>
			
				<tr>
				
					<td>${e.jour}</td>
					<td>${e.horaire}</td>
					<td><c:out value="${ e.nom_mon } "></c:out> <c:out value="${ e.prenom_mon }"></c:out> </td>
					
				
					<td class="panier"><a onclick="return confirm('Etes-vous sur de votre choix?  ?')" href="ajouterSeance.do?id=${e.id_seance}&idd=${ sessionScope.sessionUtilisateur }&activite=${ e.id_activite }" 
					data-toggle="tooltip" data-placement="right" title="Ajouter à ma liste " ><span ><i class="fas fa-cart-plus fa-lg" id="panier"></i></span> </a></td>
				</tr>
			
		</c:forEach>
		</tbody>		

  </table>
  </div>
  <br><br><br>


<%-- <c:forEach  items="${ modelS.seances }"   var='p'  >

 <input type="hidden" name="id_activite" value="${ p.id_activite }" >
 <input type="submit" ></form>
 </c:forEach> --%>





























































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


/* function change(obj) {
	  obj.style.color = "#1ec5e5";
	  var txt;
	  confirm("Etes-vous sur de votre choix!")) 
	
	}
function myFunction() {
	  var txt;
	  if (confirm("Press a button!")) {
	    txt = "You pressed OK!";
	  } else {
	    txt = "You pressed Cancel!";
	  }
	  document.getElementById("demo").innerHTML = txt */

	  
	  
	  
</script>








<!-- <div class="container" style= "margin-top: 4em;    margin-bottom: 4em;">

           <h3 class="h4-sac">CHOSES À PRENDRE DANS VOTRE SAC</h3>

           <div class="row" style= "text-align: center;">

             <div class="col-xs-6">

               <img  class="icon-sac" src="/cityclubBO/images/chaussures.png" alt="">
               <div class="text-sac">
                 Des vêtements et des chaussures d’intérieur
               </div>
             </div>
             <div class="col-xs-6">
               <img  class="icon-sac" src="/cityclubBO/images/serviette.png" alt="">
               <div class="text-sac">
                 Une serviette pour déposer sur les équipements
               </div>
             </div>
			 </div>

			<div class="row" style= "text-align: center;">

             <div class="col-xs-6">
               <img class="icon-sac" src="/cityclubBO/images/cadenas.png" alt="">
               <div class="text-sac">
                 Un cadenas pour fermer votre casier
               </div>
             </div>
             <div class="col-xs-6">
               <img class="icon-sac" src="/cityclubBO/images/gourde.png" alt="">
               <div class="text-sac">
                 Une gourde
               </div>
             </div>

           </div>
         </div> -->




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