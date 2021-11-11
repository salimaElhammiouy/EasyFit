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
   width: 250px;
   height: 50px;
   font-size: 22px;
   background-color:  #A52A2A;
 text-align: center;
 margin-bottom: 50px;
 float: right;
margin-top: 0px;
}
#paie{
font-weight: bolder;
font-family:  cursive;
font-size: 15px;
}

#accept{
font-family:  cursive;


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
<div class="links"><a href="preparerCompte.jsp" id="links">Préparer mon compte <span><i class="fas fa-angle-right"></i></span></a><a href=""id="links" ">Personnaliser mon programme</a></div></c:when>

<c:otherwise>
<jsp:include page="menuAdh.jsp"></jsp:include>
<div class="links"><a href=""id="links" ">Activités <span><i class="fas fa-angle-right"></i></span></a></div>
</c:otherwise>
</c:choose>







<div id="test" >






<h2 style="position: relative ;left : 40px; font-family: bold;">Activités</h2>
<div id="myBtnContainer">
  <button class="btn active" id="fl" onclick="filterSelection('all')"> Voir tous</button>
  <button class="btn" id="fl" onclick="filterSelection('musculation')"> Musculation</button>
  <button class="btn"  id="fl" onclick="filterSelection('BM')"> Boxe & MMA</button>
  <button class="btn"   id="fl" onclick="filterSelection('cardio')"> Cardio</button>
    <button class="btn" id="fl"  onclick="filterSelection('danse')"> Danse</button>
      <button class="btn"  id="fl" onclick="filterSelection('ZF')"> Zen Fit</button>
        <button class="btn"  id="fl" onclick="filterSelection('aqua')"> AQUAGYM</button>
         <button class="btn" id="fl" onclick="filterSelection('am')"> ARTS MARTIAUX</button>
</div>

<!-- Portfolio Gallery Grid -->
<div class="row" >
 <c:forEach  items="${ modelMus.activites }"   var='f' > 
  <div class="column musculation">
    <div class="content">
  
      <img src="<c:out value="${ f.file }"></c:out>" alt="${ f.nom_activite }" style="width:100%">
      
      
      <h4>${ f.nom_activite }</h4>
      
      <a  class="btn btn-outline-danger btn-sm " id="fl" role="button" aria-pressed="true"  href="afficherSeance.do?activite=${ f.id_act }&noma=${ f.nom_activite }&id=${ sessionScope.sessionUtilisateur }">Plus...</a> 
     
    
    </div>
  </div>
   </c:forEach>

  <c:forEach  items="${ modelBm.activites }"   var='f' > 
  <div class="column BM">
    <div class="content">
      <img src="<c:out value="${ f.file }"></c:out>" alt="${ f.nom_activite }" style="width:100%">
      <h4>${ f.nom_activite }</h4>
     <a  class="btn btn-outline-danger btn-sm "  id="fl" role="button" aria-pressed="true"  href="afficherSeance.do?activite=${ f.id_act }&noma=${ f.nom_activite }&id=${ sessionScope.sessionUtilisateur }">Plus...</a> 
      
    </div>
    </div>
</c:forEach>

    
    
    <c:forEach  items="${ modelcar.activites }"   var='f' > 
  <div class="column cardio">
    <div class="content">
    <img src="<c:out value="${ f.file }"></c:out>" alt="${ f.nom_activite }" style="width:100%">
      <h4>${ f.nom_activite }</h4>
    <a  class="btn btn-outline-danger btn-sm "  id="fl" role="button" aria-pressed="true"  href="afficherSeance.do?activite=${ f.id_act}&noma=${ f.nom_activite }&id=${ sessionScope.sessionUtilisateur }">Plus...</a> 
      
    </div>
    </div>
</c:forEach>

 
 <c:forEach  items="${ modeld.activites }"   var='f' > 
  <div class="column danse">
    <div class="content">
    <img src="<c:out value="${ f.file }"></c:out>" alt="${ f.nom_activite }" style="width:100%">
      <h4>${ f.nom_activite }</h4>
     <a  class="btn btn-outline-danger btn-sm "  id="fl"  role="button" aria-pressed="true"  href="afficherSeance.do?activite=${ f.id_act }&noma=${ f.nom_activite }&id=${ sessionScope.sessionUtilisateur }">Plus...</a> 
      
    </div>
    </div>
    </c:forEach>
  
  
 <c:forEach  items="${ modelzt.activites }"   var='f' > 
  <div class="column ZF">
    <div class="content">
      <img src="<c:out value="${ f.file }"></c:out>" alt="${ f.nom_activite }" style="width:100%">
      <h4>${ f.nom_activite }</h4>
      <a  class="btn btn-outline-danger btn-sm "  id="fl" role="button" aria-pressed="true"  href="afficherSeance.do?activite=${ f.id_act }&noma=${ f.nom_activite }&id=${ sessionScope.sessionUtilisateur }">Plus...</a> 
      
    </div>
    </div>
</c:forEach>


   
<c:forEach  items="${ modelaq.activites }"   var='f' > 
  <div class="column aqua">
    <div class="content">
      <img src="<c:out value="${ f.file }"></c:out>" alt="${ f.nom_activite }" style="width:100%">
      <h4>${ f.nom_activite }</h4>
      <a  class="btn btn-outline-danger btn-sm " id="fl"  role="button" aria-pressed="true"  href="afficherSeance.do?activite=${ f.id_act }&noma=${ f.nom_activite }&id=${ sessionScope.sessionUtilisateur }">Plus...</a> 
      
    </div>
    </div>
  </c:forEach>
 
  

    
    
    
    <c:forEach  items="${ modelam.activites }"   var='f' > 
  <div class="column am">
    <div class="content">
       <img src="<c:out value="${ f.file }"></c:out>" alt="${ f.nom_activite }" style="width:100%">
      <h4>${ f.nom_activite }</h4>
      <a  class="btn btn-outline-danger btn-sm "  id="fl" role="button" aria-pressed="true"  href="afficherSeance.do?activite=${ f.id_act }&noma=${ f.nom_activite }&id=${ sessionScope.sessionUtilisateur }">Plus...</a> 
      
    </div>
    </div>
  </c:forEach>
    
    
    
    
    
    
    
    
    
    
    
  </div>
  
</div>























<script>


filterSelection("all") // Execute the function and show all columns
function filterSelection(c) {
  var x, i;
  x = document.getElementsByClassName("column");
  if (c == "all") c = "";
  // Add the "show" class (display:block) to the filtered elements, and remove the "show" class from the elements that are not selected
  for (i = 0; i < x.length; i++) {
    w3RemoveClass(x[i], "show");
    if (x[i].className.indexOf(c) > -1) w3AddClass(x[i], "show");
  }
}

// Show filtered elements
function w3AddClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    if (arr1.indexOf(arr2[i]) == -1) {
      element.className += " " + arr2[i];
    }
  }
}

// Hide elements that are not selected
function w3RemoveClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    while (arr1.indexOf(arr2[i]) > -1) {
      arr1.splice(arr1.indexOf(arr2[i]), 1);
    }
  }
  element.className = arr1.join(" ");
}

// Add active class to the current button (highlight it)
var btnContainer = document.getElementById("myBtnContainer");
var btns = btnContainer.getElementsByClassName("btn");
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function(){
    var current = document.getElementsByClassName("active");
    current[0].className = current[0].className.replace(" active", "");
    this.className += " active";
  });
}





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


































































</body>
</html>
