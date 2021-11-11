<!DOCTYPE html>
<html>
<head>

<meta http-equiv='content-type' content='text/html'>
<title>Accueil</title>
<link  href="css/bootstrap.min.css" rel="stylesheet">

</head>
<body>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="menu.jsp" %>
<c:choose>
<c:when test="${etat==true}">
<div class="alert alert-success" id="confirm" style='width: 50%;margin-left:20%'>
    <strong> <c:out value="${alerte}"></c:out></strong> 
</div>
</c:when>
<c:when test="${etat== false}">
</c:when>
</c:choose>
<div class="awal">
<p>Fais toujours de ton mieux même si personne ne regarde.</p>
<div class="px-5 push-right">
<a href="reserverPlace.jsp" class="btn btn-info" id="rese" role="button"><i class="	far fa-star" style='color:white'></i>  Réservez votre place</a>

</div>

</div>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>