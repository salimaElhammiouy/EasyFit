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

.ima{

width: 800px;
margin-left: 6%;
}
</style>
</head>
<body>


<jsp:include page="menuAdh.jsp"></jsp:include>


 <div class="row">
    <div class="col-8"><div  id="divv1">
    <br>
<div class="ima">

<img alt="Newsletters" src="${ article.img }" style="width: 100%">
</div>

<small style="margin-left: 6%;"><span><i class="fas fa-calendar-alt fa-1.5x" style="color: #A52A2A"></i></span>  ${ article.date }</small>

<h1 style="margin-left: 5%; color: #A52A2A;">${ article.titre_n } </h1>
<p style="margin-left: 5%;  text-indent: 50px;
  text-align: justify;">${ article.contenu_n }













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