<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>

body{
	margin: 0;
	padding: 0;
	background-color: #fffff;
	background-image: url("/Ebay/ExpBack.jpg");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center center;
	
}

#main{
	box-sizing: border-box;  
	padding: 20px;
	overflow-x: auto;
}
#heading{
	width: 100%;
	height: 30px;
	background-image: url("/Ebay/HeaderWp2.jpg");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: top top;
	position: relative;
	box-shadow: 0px 2px 5px black;
	display: flex;
	z-index: 5;
}
#head{
	width: 100%;
	height: 70px;
	background-color: #303036;
	position: relative;
	box-shadow: 0px 3px 5px black;
	display: flex;
	z-ibdex: 1;
}

#logo1{
	margin auto;
}

#outcontainer{
	margin: 0 auto;
	clear: both;
	text-align: right;
	overflow: hidden;
	width: 100%;
}

h1 {
	color: white;
	font-family: Aileron;
	letter-spacing: 3px;
	vertical-align: top;
	font-size: 40px;
	line-height: 0.50;
}

input[type=text] {
    width: 30%;
    padding: 12px 18px;
    margin: 3px 4px;
    box-sizing: border-box;
    border-radius: 4px;
   	border: 2px solid grey;
}

input[type=submit] {
	background-color: white;
    border: none;
    padding: 15px 25px;
    color: #063E53;
    text-decoration: none;
    margin: 1px 2px;
    cursor: pointer;
    width: 85px;
    height: 70px
}

.out{
	float: right;
}

.outbutton{
	background-color: white;
    border: none;
    padding: 15px 25px;
    color: #063E53;
    text-decoration: none;
    margin: 1px 2px;
    cursor: pointer;
    width: 100px;
    height: 70px;
    white-space: normal;
}

.outbutton:hover{
	color: white;
	background: url("/Ebay/HeaderWp2.jpg") repeat center center;
}

table {
    border: 1px solid black;
    border-collapse: collapse;
    border-spacing: 5px;
}

th{
	border: 1px solid black;
    border-collapse: collapse;
    border-spacing: 5px;
    text-align: center;
    height: 75px;
    background-color: #303036;
    color: white;
}

td{
	border: 1px solid black;
    border-collapse: collapse;
    border-spacing: 5px;
    text-align: center;
    padding: 15px;
  }

.control1{
	width: 25%;
	height: 30px;
	border: none;
	background: url("/Ebay/HeaderWp2.jpg") no-repeat center center;
	background-color: #303036;
	padding: 2px 5px;
	color: white;
	cursor: pointer;
}
.control2{
	width: 25%;
	height: 30px;
	border: none;
	background-color: #303036;
	padding: 2px 5px;
	color: white;
	cursor: pointer;
}
</style>
<title>User info</title>
</head>
<body>
	<div id="heading">
	</div>
	<div id="head">
		<img id=logo1 src="/Ebay/LogoExp3.png" width=70px>
		<h1>
			-BAY
		</h1>
		<div id=outcontainer>
			<form class=out action=LogoutServlet method =get >
				<input class=outbutton type="submit" value="Logout">
			</form>
			<form class=out action=AdminCheck  method=get>
				<input class=outbutton type="submit" value="Go Back">
			</form>
		</div>
	</div>
	<div id="main">	
		<table style="width:75%">
		<tr>
		    <th>Username</th>
		    <th>Password</th>
		    <th>AFM</th>
		    <th>Location</th>
		    <th>Address</th>
		    <th>E-mail</th>
		    <th>Phone</th>
		    <th>Status</th>
		 </tr>
		 <tr>
		 	<td> <c:out value = "${user.username } "> </c:out></td>
		 	<td> <c:out value = "${user.password }"></c:out></td>
		 	<td> <c:out value = "${user.afm } "> </c:out></td>
		 	<td> <c:out value = "${user.location }"></c:out></td>
		 	<td> <c:out value = "${user.adress } "> </c:out></td>
		 	<td> <c:out value = "${user.email }"></c:out></td>
		 	<td> <c:out value = "${user.phone } "> </c:out></td>
		 	<td> <div id="Status"> <c:out value="${user.status }"></c:out> </div></td>
		 </tr>
		</table>
		<br>			
	</div>
	<div style="text-align:center">
		<button class="control1" id="c1">Accept</button>
		<button class="control2" id="c2">Ban</button>
	</div>
	
	<script type="text/javascript">
	document.getElementById("c1").onclick=function(){
		//document.getElementById("Status").innerHTML="Accepted";
		document.location.href="/Ted2/SearchUser?userName=${user.username }&Status=Accepted";
	}
	
	
	document.getElementById("c2").onclick=function(){
		//document.getElementById("Status").innerHTML="Banned";
		document.location.href="/Ted2/SearchUser?userName=${user.username }&Status=Banned";
	}
	
	
	</script>
</body>
</html>