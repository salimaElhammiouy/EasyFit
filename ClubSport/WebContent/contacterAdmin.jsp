<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
 <script src="https://kit.fontawesome.com/209a6e480f.js" crossorigin="anonymous"></script>
<title>Espase adhérent</title>
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
border-radius: 5px;
  padding: 10px;

margin-top: 5%

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

#ne{
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
  margin-top: -2%;
}


#more{
border-radius: 40px;
font-weight: bold;
width: 270px;
text-align: center;
margin-left: 8%;
margin-top: -6%;
}

#conta{
       background-color:  rgba(165,42,42,0.5);
     
 
     
       box-sizing: border-box;
   width: 700px;
   height: 350px;
   margin-top: 40px;
  margin-bottom: 100px;
  margin-right: 20%;
  margin-left: 10%;
 
}
label {
font-style: oblique;
font-weight: bold;


}
.conte {
  border: 2px solid #dedede;
  background-color: #f1f1f1;
  border-radius: 5px;
  padding: 10px;
  margin: 10px 0;
}

/* Darker chat container */
.darker {
  border-color: #ccc;
  background-color: #ddd;
}

/* Clear floats */
.conte::after {
  content: "";
  clear: both;
  display: table;
}


/* Style the right image */
.conte img.right {
  float: right;
  margin-left: 20px;
  margin-right:0;
}


p.titre{
	text-transform: uppercase;
	font-weight: bolder;
	margin-left:40%;
	font-size: x-large;
	text-decoration: underline;
}










</style>
</head>
<body>

<jsp:include page="menuAdh.jsp"></jsp:include>


 <div class="row">
    <div class="col-8"><div  id="divv1">
    <c:choose>
    <c:when test="${ note==1 }">
   <div class="card" id="conta">
  <h5 class="card-header">CONTACTEZ-NOUS</h5>
  <div class="card-body">
  
<form action="contacterAdmin.de" class="needs-validation" method="get"   novalidate>
  <div class="form-group">
    <label for="name">Réception:</label>
    <input type="text" class="form-control" id="name"  name="name" disabled="disabled"  value="EAZYFIT@gmail.com" >
  </div>
  
  <div class="form-group">
    <label for="subject">Message:</label>
    
     <textarea id="subject" class="form-control" name="subject" placeholder="Write something.."  autofocus="autofocus" required></textarea>
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Remplir ce champs !! </div>
  </div>
 <input type="hidden" name="id" value="${ sessionScope.sessionUtilisateur }">
 <input type="hidden" name="email" value="${ sessionScope.emailA }">
  <input type="hidden" name="nom" value="${ sessionScope.nom }">
   <button type="submit" class="btn btn-danger btn-lg">Envoyer</button>
  <button type="reset" class="btn btn-secondary btn-lg">Annuler</button>
</form>
   
  </div>
    
    
    
    </div>
    </c:when>
    <c:when test="${ note==2 }">
    <p class="titre">Notifications</p>
    <c:forEach items="${ modelNot1.notification }"  var="n">
     <div class="conte" role="alert">
      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span></button>
  <img src="images/newSeance.png" alt="Avatar" style="border-radius: 50%; height: 10%; width: 10%; margin-bottom:  1%;">
  <p style="margin-left: 13%; margin-top: -8%; font-weight: bold;"><c:out value="${ n.texte_notif }"> </c:out> <a  onmouseover="style.color='white'" onmouseout="style.color='#A52A2A'" href="afficherSeance.do?activite=${ n.id_activite }&noma=${ n.nom_activite }&id=${ sessionScope.sessionUtilisateur }" style="color: #A52A2A;">Voir détails</a></p>
  <span class="time-right"><c:out value="${ n.time }"></c:out></span>
</div>
    </c:forEach>
    <c:forEach items="${ modelNot2.notification }" var="n">
     <div class="conte">
     <button type="button" class="close" aria-label="Close">
  <span aria-hidden="true">&times;</span>
</button>
  <img src="images/newSeance.png" alt="Avatar" style="border-radius: 50%; height: 10%; width: 10%; margin-bottom:  1%;">
  <p style="margin-left: 13%; margin-top: -7%; font-weight: bold;"><c:out value="${ n.texte_notif }"></c:out> <a  onmouseover="style.color='white'" onmouseout="style.color='#A52A2A'" href="afficherSeance.do?activite=${ n.id_activite }&noma=${ n.nom_activite }&id=${ sessionScope.sessionUtilisateur }" style="color: #A52A2A;">Voir détails</a></p>
  <span class="time-right"><c:out value="${ n.time }"></c:out></span>
</div>
    </c:forEach>
   
   <c:forEach items="${ modelR.paiement }" var="r">
    <div class="conte">
     <button type="button" class="close" aria-label="Close">
  <span aria-hidden="true">&times;</span>
</button>
 <img src="images/late.png" alt="Avatar" style="border-radius: 50%; height: 10%; width: 10%; margin-bottom:  1%;">
  <p style="margin-left: 13%; margin-top: -7%; font-weight: bold;">Vous avez un retard de paiement !! votre carte est bloquée depuis :<strong><c:out value="${ r.date_p }"></c:out></strong><br>
  Merci de cliquer 
  <a  onmouseover="style.color='white'" onmouseout="style.color='#A52A2A'" href="paiementEnLigne.de?id_ad=${ sessionScope.sessionUtilisateur }" style="color: #A52A2A;"> Ici </a> pour régler votre situation</p>
  <span class="time-right"><c:out value="${ r.mois }"></c:out></span>
</div>
   
   
   </c:forEach>
     <div class="conte">
     <button type="button" class="close" aria-label="Close">
  <span aria-hidden="true">&times;</span>
</button>
 <img src="images/newsIcon.png" alt="Avatar" style="border-radius: 50%; height: 10%; width: 10%; margin-bottom:  1%;">
  <p style="margin-left: 13%; margin-top: -7%; font-weight: bold;"><c:out value="${ article.titre_n }"></c:out>...<a  onmouseover="style.color='white'" onmouseout="style.color='#A52A2A'" href="moreNews.de?idn=${ n.id_n }" style="color: #A52A2A;">Lire la suite</a></p>
  <span class="time-right"><c:out value="${ article.datee }"></c:out></span>
</div>
    
    
    
    
    
    
    
    
    </c:when>
    
    
   </c:choose>
    
    </div>
    </div>
    
    
    
     <div class="col-4"><div class="container" id="divv2">
    <div id="neww"><p>Découvrir notre Newsletters </div>
 <c:forEach items="${ modelN.article }" var="n">   
<div id="ne">
 
  <p id="tnew">${ n.titre_n }</p>
  <a href="moreNews.de?idn=${ n.id_n }" id="voir">voir plus ...</a>
  <span class="time-right">${ n.date }</span>
</div>

</c:forEach>

<br>
<a type="button" class="btn btn-light" id="more" href="tousNews.de">Toutes Les news <span><i class="fas fa-angle-double-right"></i></span></a>











</div>
</div>
  </div>


<script>
// Disable form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Get the forms we want to add validation styles to
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