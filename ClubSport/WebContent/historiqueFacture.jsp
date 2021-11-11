<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
 <script src="https://kit.fontawesome.com/209a6e480f.js" crossorigin="anonymous"></script>
<title>Historique facture</title>
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
#myInput, #myIn{
width: 350px;
margin-left: 10%;
}

.container {
  border: 2px solid #dedede;
  background-color:white;
  border-radius: 5px;
  padding: 10px;
  margin: 10px 0;
   height: 97px;
}
#cnn{

width: 900px; 
 border: 2px solid #dedede;
  background-color:white;
  border-radius: 5px;
  padding: 10px;

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

#down{

font-size: 20px;
cursor: pointer;
color: #A52A2A;
}
#down:hover{
color: black;
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
margin-left: 10%;

}

#paie{
font-weight: bolder;
font-family:  cursive;
font-size: 15px;
}
p.titre{
	text-transform: uppercase;
	font-weight: bolder;
	margin-left:34%;
	font-size: large;
	text-decoration: underline;
}
</style>
</head>
<body>



<jsp:include page="menuAdh.jsp"></jsp:include>


 <div class="row">
    <div class="col-8"><div  id="divv1">

<div id="cnn">
<p class="titre">Historique des Factures</p>
<label for="myImput" id="myIn">Filtrer Vos factures:</label>
 <input class="form-control" id="myInput" type="text" placeholder="Search.." class="sr-only" >

<br>




<table border="1" style="width :80% ;">
  <caption>En cas d'erreur, merci de nous contacter</caption>
    <tr class="titre" >
      <th style="text-align: center;">N° de Facture</th>
      <th style="text-align: center;" >La Date</th>
      <th style="text-align: center;">Télécharger(PDF)</th>
    </tr>
 
<tbody id="myTable">
  <c:forEach  items="${ model.paiement }"   var='e'  varStatus="status">
			
				<tr>
				
					<td>${ status.count }</td>
					<td>${e.mois}</td>
					<td class="panier"><a type="button" href="FacturePDF?id=${ sessionScope.sessionUtilisateur }&d=${ e.date_p }" data-toggle="tooltip" data-placement="right" title="Télécharger la fature  " ><span><i class="fas fa-download" id="down"></i></span></a></td>
					
				</tr>
			
		</c:forEach>
		</tbody>		

  </table>
  </div>
</div>
</div>















































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