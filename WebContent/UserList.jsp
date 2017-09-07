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
	width: 700px;
}
#out{
	
	clear: both;
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



#outbutton{
	background-color: white;
    border: none;
    padding: 15px 25px;
    color: #063E53;
    text-decoration: none;
    margin: 1px 2px;
    cursor: pointer;
    width: 100px;
    height: 70px
}

#outbutton:hover{
	color: white;
	background: url("/Ebay/HeaderWp2.jpg") repeat center center;
}
table {
    border: 0px solid black;
    border-collapse: collapse;
    border-spacing: 5px;
}

th{
	border-bottom: 1px solid black;
    border-collapse: collapse;
    border-spacing: 5px;
    text-align: center;
    height: 50px;
    background-color: #303036;
    color: white;
}

td{
	border-bottom: 1px solid black;
    border-collapse: collapse;
    border-spacing: 5px;
    text-align: center;
  }
tr:nth-child(even) {
    background-color: #808080;
}

tr:hover{
	background-color: #303036;
	color: white;
	}
.control1{
	width: 100%;
	height: 100%;
	float: left;
	border: none;
	background: url("/Ebay/HeaderWp2.jpg") no-repeat center center;
	background-color: #303036;
	padding: 2px 5px;
	color: white;
	cursor: pointer;
}

</style>
<title>Userlist</title>
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
			<form id=out action="LogoutServlet"  method="get">
				<input id=outbutton type="submit" value="Logout">
			</form>
		</div>
	</div>
	<div id="main">	
		<table style="width:75%">
		<tr>
		    <th>Username</th>
		    <th>Password</th>
		    <th>Location</th>
		    <th>Status</th>
		    <th></th>
		 </tr>
		<c:forEach var="user" items="${users}">
			<tr>
			 	<td> ${user.username }</td>
			 	<td> ${user.password }</td>
			 	<td> ${user.location }</td>
			 	<td> ${user.status }</td>
			 	<td>
			 	<form action="SearchUser" method="get">
					<input class="control1" type="submit" value="More ">
					<input type="hidden" name="userName" value="${user.username }">
					<input type="hidden" name="Status" >
			 	</form>
			 	</td>
			 </tr>
		</c:forEach>
		<form action="ExportItemDBServlet" method=get>
			<input type="text" name="startID" >
			<input type="text" name ="finishID">
			<input style="position:absolute;top=0;right=0;" type="submit" value="Export database">
		</form>

			
		</table>		
	</div>  
</body>
</html>