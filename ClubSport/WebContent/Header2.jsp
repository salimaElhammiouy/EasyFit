<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<title>Insert title here</title>
<style>

.nav-link{
	color: white;
	font-weight: bold;	
}
.nav-item{
	margins: 20px 20px 20px 20px;
}

#connect{
	/*margin-left:32%;
	margin-top:2.5%;
	background-color: #A52A2A;*/
	font-color: rgb(0,0,0);	
	
  position: absolute;
  top: 40px;
  right: 20px;
  /*font-size: 18px;*/
   box-sizing: border-box;
   width: 250px;
   height: 50px;
   font-size: 22px;
  
}

ul{ 
 

margin-top:-5%;
	margin-left:23%;


} 
#logo {
top: 8px;
left : 16px;


}
body	{
      
 background-image:   url(images/back2.jpg);
 background-attachment:      fixed;
 background-repeat: no-repeat;
 background-size:      cover  ;
}


</style>
</head>
<body>


<img src="images/bbb-01.png" id="logo">

<ul class="nav">

  <li class="nav-item">
    <a class="nav-link" href="index.jsp"  onmouseover="style.color='#A52A2A'" onmouseout="style.color='white'" ><span><i class="fas fa-home"></i></span> Accueil</a>
  </li> 
  <li class="nav-item">
    <a class="nav-link" href="aboutUs.jsp" onmouseover="style.color='#A52A2A'" onmouseout="style.color='white'">A propos de nous</a>
  </li>
   <li class="nav-item">
    <a class="nav-link" href="contactezN.jsp" onmouseover="style.color='#A52A2A'" onmouseout="style.color='white'"><span><i class="fas fa-envelope"></i></span>  Contactez-nous</a>
  </li>
  
</ul>



  
 
  
  

</body>
</html>