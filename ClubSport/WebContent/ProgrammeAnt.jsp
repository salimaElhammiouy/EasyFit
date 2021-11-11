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
background-color: #f1f1f1;
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
p.titre{
	text-transform: uppercase;
	font-weight: bolder;
	margin-left:30%;
	font-size: x-large;
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


</style>
</head>
<body>



<jsp:include page="menuAdh.jsp"></jsp:include>

<div class="container" style="width: 800px; ">
<p class="titre">Historique de mes programmes
<form action="chercherhisto.de" method="get">
  <div class="row">
    <div class="col">
    <label>Recherche dans l'historique:</label>
      <input type="hidden" value="${ sessionScope.sessionUtilisateur }" name="id">
      <input type="date" class="form-control"  name="date" placeholder="mois" ><button type="submit" class="btn btn_outline-danger">Chercher</button>
    </div>
  </div>
</form>
</div>

<div class="container" >
 
 
<div class="row">


<c:forEach items="${ modelA.activs }" var="e">
    <div class="col">

<div class="card" style="width: 18rem;">
  <img src="${ e.file }" class="card-img-top" alt=" ${ e.nom_activite }" style="width:100%">
  <div class="card-body">
    <p class="card-text"><c:out value=" Catégorie :${ e.categorie }"></c:out> <br>
    <c:out value="Activité: ${ e.nom_activite }"></c:out> </p>
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
    <p class="price"><c:out value="${ e.prix_programme }"></c:out> DH </p>
  </div>
</div>
</div>
</c:forEach> 
</div>
</div>

 

</body>
</html>