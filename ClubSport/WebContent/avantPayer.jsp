<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
 <script src="https://kit.fontawesome.com/209a6e480f.js" crossorigin="anonymous"></script>
<title>paiement en ligne </title>
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
	margin-left:35%;
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
#reta{

text-align: center;
border-color: white;
}
#v , #v3{
font-size: 13px;
font-family: Bradley Hand, cursive;

}

#retard{
margin-top: -7%;
}
</style>
</head>
<body>



<jsp:include page="menuAdh.jsp"></jsp:include>


 <div class="row">
    <div class="col-8"><div  id="divv1">

<c:choose>

<c:when test="${etat== true}">
<div class="container" id="reta">
<div class="row">

<div class="container" id="reta" >
<br>
 <img src="<c:out value="${ image }"></c:out>" class="card-img-top" alt="vosRetard" id="retard" style="width:400px; height: 250px;">
<br>


<p id="v2" ><strong>Vous avez un retard de paiement !! votre carte est bloquée depuis  <c:forEach items="${ model.paiement }" var="e"><c:out value="${ e.date_p }"></c:out> </c:forEach></strong>
<p id="v3">Après le paiement votre carte sera activiée pour  le mois :<strong><c:out value="${ mois }"></c:out></strong>

<%-- <form action="paiement.de" method="get">
<input type="hidden" value="${ sessionScope.sessionUtilisateur }" name= "id" id="id">
  <div class="form-group" >
    <select class="form-control" id="exampleFormControlSelect1" name="mois" style="width: 300px; margin-left: 32%;">
    
       
       <option value="${ mois }"><c:out value="${ mois }"></c:out></option>
      <option value="6">Payer six mois (avec une réduction de 10% )</option>
      <option value="12">Payer tous l'anné (avec une réduction de 20% )</option>
   
    </select>
  </div> --%>



<br><br>
<br>

<a  type="button"class="btn btn-outline-danger" data-toggle="tooltip" data-placement="bottom"  title="choisir un programme depuis votre historique" href="historiquePro.de?id=${ sessionScope.sessionUtilisateur }&datte=${ dernPai }">Programmes antérieurs </a>
<a type="button" class="btn btn-outline-danger" data-toggle="tooltip" data-placement="bottom" title="garder votre programme et ajouter autres activités" href="garderAncien.do?id=${ sessionScope.sessionUtilisateur }" >Garder mon  Programme</a>
<a type="button" class="btn btn-outline-danger"  data-toggle="tooltip" data-placement="bottom" title="commencer une nouvelle experience"href="decouvrirProg.do?id=${ sessionScope.sessionUtilisateur }" >Changer mon programme</a>

</div>


</div>
</div>
</c:when>

<c:when test="${etat== false}">

<div style="text-align: center;" id="newslette">
<br>
 <img src="<c:out value="${ image }"></c:out>" class="card-img-top" alt="panierVide" id="paniervide" style="width:350px; height: 300px; margin-top: 2px;">
<br>


<p id="v2"><strong>Félicitation ,Vous avez payer tous vos  factures  à la date de <c:out value="${ date }"></c:out></strong>
<br>


<p>Cliquez <a href="decouvrirProg.jsp" onmouseover="style.color='#A52A2A'"><strong>ICi</strong></a> pour consulter vos factures
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