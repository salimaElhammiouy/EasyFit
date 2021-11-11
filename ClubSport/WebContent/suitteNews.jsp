<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
 <script src="https://kit.fontawesome.com/209a6e480f.js" crossorigin="anonymous"></script>
<title>Tous les newsletters</title>
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

.card{
height: 100%;

}
</style>
</head>
<body>

<jsp:include page="menuAdh.jsp"></jsp:include>

<br>
<div class="container">
  <div class="row row-cols-1 row-cols-md-3">
  
  <c:forEach items="${ modeln.article }" var="n" >
    <div class="col mb-4" id="ca">

  <div class="card">
    <img src="${ n.img }" class="card-img-top" alt="...">
    <div class="card-body">
      <h5 class="card-title"><a href="moreNews.de?idn=${ n.id_n }" style="color: #A52A2A;"><c:out value="${ n.titre_n }"></c:out></a></h5>
      <p class="card-text"  style="font-weight: bold;"><c:out value="${ n.chaine }"></c:out></p>
    </div>
    <div class="card-footer">
      <small class="text-muted" style="text-align: center;"><c:out value="${ n.datee }"></c:out></small>
    </div>
  </div>
 </div>
 </c:forEach>
 </div>
  </div>
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  





























































</body>
</html>