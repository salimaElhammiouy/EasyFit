<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
 <script src="https://kit.fontawesome.com/209a6e480f.js" crossorigin="anonymous"></script>
<title>Espace d'Adherent</title>
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

#ne {
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



#act {
  position: relative;
  width: 100%;
  
}

.image {
  display: block;
  width: 100%;
  height: auto;
}

.overlay {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  background-color: black;
  overflow: hidden;
  width: 100%;
  height: 0;
  transition: .5s ease;
}

#act:hover .overlay {
  height: 100%;
}

.text {
  color: white;
  font-size: 20px;
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
  text-align: center;
}

#noti{
 border: 2px dotted #dedede;
  background-color:white;
  border-radius: 5px;
  padding: 3px;
width: 900px; height: 150px; 
}
.card-title{
font-weight: bold;
font-family: Lucida Sans Typewriter ;


}
.gif marquee{
    font-size: 40px;
    font-family: French Script MT;
    color: black;
    overflow: hidden;
    margin-bottom: -4px;
    margin-top: 2px;
    border: 2px dotted #dedede ;
    background-color: white;
}
#centeralign{
font-family: Lucida Sans Typewriter;
    color: black;
font-weight: bold;
text-align: center;
text-transform: uppercase;

	display: table-cell;
	vertical-align: middle;
	font-size: 30px;
	
}
#table {
	display: table;
	width: 90%;
	height: 7%;
	padding:0%;
  background-color: white;
}
#v2{

margin-right: 9%;
}
</style>
</head>
<body>



<jsp:include page="menuAdh.jsp"></jsp:include>


 <div class="row">
    <div class="col-8"><div  id="divv1">
<div class="gif">
         <marquee>Soyez Les Bienvenues Dans Votre espace adhérent </marquee>
        </div>
        
<c:choose>
<c:when test="${etat3==false}">
<br>
<div class="alert alert-warning alert-dismissible fade show" role="alert" style="width: 800px; margin-left: 5%; margin-top: %;">
  <strong>Succés!</strong> Votre paiement a bien été enregistré.
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
</c:when>

<c:when test="${email==true}">
<br>
<div class="alert alert-warning alert-dismissible fade show" role="alert" style="width: 800px; margin-left: 5%; margin-top: %;">
  <strong>Succés!</strong> <c:out value="${ message }"></c:out>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
</c:when>

<c:when test="${pass==true}">
<br>
<div class="alert alert-warning alert-dismissible fade show" role="alert" style="width: 800px; margin-left: 5%; margin-top: %;">
  <strong>Succés!</strong> <c:out value="${ message2 }"></c:out>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
</c:when>
<c:when test="${!empty msg}">
<br>
<div class="alert alert-warning alert-dismissible fade show" role="alert" style="width: 800px; margin-left: 5%; margin-top: %;">
  <strong>Succés!</strong> Votre message a bien été envoyer ,EASYFIT est toujours au services de ses fidéles clients
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
</c:when>
</c:choose>

<div class="card mb-3" id="noti">
  <div class="row no-gutters">
    <div class="col-md-3">
      <img src="images/reminder1.png" class="card-img" alt="..." style=" max-height: 120px;">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title" style="color: #A52A2A;">Profitez de l'expérience d'aujourd'hui</h5>
       <c:choose>
     
    
       <c:when test="${ se==0 }"><p class="card-text"><c:out value="${ modele }"></c:out>  <footer class="blockquote-footer">Szczepan Yamenski</footer></c:when> 
      <c:when test="${ se==1 }"><c:forEach items="${ modelS.seance }" var="s"> <p class="card-text"><ul><li>Vous avez l'activité <c:out value="${ s.nom_activite}"></c:out> aujourd'hui à <c:out value="${ s.horaire }"></c:out>,avec le coach <c:out value="${ s.nom_mon }"></c:out> <c:out value="${ s.prenom_mon }"></c:out>
       </li></ul></c:forEach></c:when>
       </c:choose>
      </div>
    </div>
  </div>
</div>


<div id="table"><h1  id="centeralign">Votre activité du mois</h1></div>
<c:choose>
<c:when test="${etat== true}">
<div class="row">
<c:forEach items="${ modelP.programme }" var="e">

<div class="col-6 col-sm-3">
<div  id="act" >
  <img src="<c:out value="${ e.src_image }"></c:out>" alt="${ e.nom_prog }" class="image">
  <div class="overlay">
    <div class="text"><a href="choisirPro.do?idP=${ e.id_prog }&ida=${ sessionScope.sessionUtilisateur }"> <c:out value=" ${ e.nom_prog }"></c:out><br></a></div>
  </div>
</div>
</div>
</c:forEach>
<c:forEach items="${  model.activs }" var="e">

<div class="col-6 col-sm-3">
<div  id="act" >
  <img src="${ e.file }" alt="${ e.nom_activite }" class="image">
  <div class="overlay">
    <div class="text"><a href="afficherSeance.do?activite=${ e.id_act }&id=${ sessionScope.sessionUtilisateur }"><c:out value="${ e.categorie }"></c:out><br><c:out value="${ e.nom_activite }"></c:out></a></div>
  </div>
</div>
</div>
</c:forEach>
</div>
</c:when>

<c:when test="${etat== false}">

<div style="text-align: center;" id="newslette">
<br>
 <img src="<c:out value="${ image }"></c:out>" class="card-img-top" alt="panierVide" id="paniervide" style="width:400px; margheight: 300px; margin-top: -5px; margin-right: 8%">
<br>


<p id="v2"><strong>Vous n'avez aucune activité  pour ce mois !!</strong>
<br>


</div>

</c:when>
</c:choose>
</div>





<script type="text/javascript">

function typeEffect(element, speed) {
	var text = element.innerHTML;
	element.innerHTML = "";
	
	var i = 0;
	var timer = setInterval(function() {
    if (i < text.length) {
      element.append(text.charAt(i));
      i++;
    } else {
      clearInterval(timer);
    }
  }, speed);
}


// application
var speed = 75;
var h1 = document.querySelector('h1');

var delay = h1.innerHTML.length * speed + speed;

// type affect to header
typeEffect(h1, speed);




</script>























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
<a type="button" class="btn btn-light" id="more" href="tousNews.de">Tous Les news <span><i class="fas fa-angle-double-right"></i></span></a>











</div>
</div>
  </div>




















































</body>
</html>