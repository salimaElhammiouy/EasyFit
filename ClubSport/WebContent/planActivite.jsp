<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<title>plannig activités </title>
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

font-size: 20px;
}
</style>
</head>
<body>



<jsp:include page="menuAdh.jsp"></jsp:include>


 <div class="row">
    <div class="col-8"><div  id="divv1">

<p class="titre">Mes Activités</p>


<c:choose>

<c:when test="${etat== true}">
<div class="row">
<c:forEach items="${ model.activs }" var="e">
    <div class="col">

<div class="card" style="width: 18rem;">
  <img src="${ e.file }" class="card-img-top" alt=" ${ e.nom_activite }" style="width:100% ">
  <div class="card-body">
    <p class="card-text"><c:out value=" Catégorie :${ e.categorie }"></c:out> <br>
    <c:out value="Activité: ${ e.nom_activite }"></c:out> </p>
    <c:out value="Nombre de séances: ${ e.nb_seance }"></c:out> 
    <p><br><a type="button" href="seances.prog?id=${ sessionScope.sessionUtilisateur }">Télécharger Planning    <span><i class="far fa-calendar-alt "  id="icoon"></i></span></a></p>
  </div>
</div>
</div>
</c:forEach>
</div>
</c:when>

<c:when test="${etat== false}">

<div style="text-align: center;" id="newslette">
<br>
 <img src="<c:out value="${ image }"></c:out>" class="card-img-top" alt="panierVide" id="paniervide" style="width:350px; height: 300px; margin-top: 2px;">
<br>


<p id="v2"><strong>Vous n'avez aucune activité dans votre planning !!</strong>
<br>


<p>Cliquez <a href="personnaliserProg.do?id=${ sessionScope.sessionUtilisateur }" onmouseover="style.color='#A52A2A'"><strong>ICi</strong></a> pour découvrir nos activités 
</div>



</c:when>
</c:choose>























</div></div>
    <div class="col-4"><div class="container" id="divv2">
    <div id="neww"><p>Découvrir notre Newsletters </div>
 <c:forEach items="${ modelN.article }" var="n">   
<div class="container">
 
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