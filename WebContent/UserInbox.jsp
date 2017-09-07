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
	background-image: url("file:///E:/Users/MKLO/workspace/Ebay/WebContent/ExpBack.jpg");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center center;
}

#main{
	box-sizing: border-box;  
	padding: 10px;
	overflow-x: auto;
	text-align: center;
	background: none;
	width: 700px;
	margin-left: auto;
	margin-right: auto;
}
#heading{
	width: 100%;
	height: 30px;
	background-image: url("file:///E:/Users/MKLO/workspace/Ebay/WebContent/HeaderWp2.jpg");
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
   	border: 1px solid grey;
}

input[type=submit] {
  background-color: transparent;
  text-decoration: none;
  border: none;
  color: blue;
  cursor: pointer;
  font-size: 170%;
  vertical-align: top;
}

input[type=submit]:hover{
	outline: none;
	text-decoration: underline;
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
    height: 70px;
    font-size: 13px;
    float: right;
}

#outbutton:hover{
	color: white;
	background: url("file:///E:/Users/MKLO/workspace/Ebay/WebContent/HeaderWp2.jpg") repeat center center;
}



#outbutton1{
	background-color: white;
    border: none;
    padding: 15px 25px;
    color: #063E53;
    text-decoration: none;
    margin: 1px 2px;
    cursor: pointer;
    width: 100px;
    height: 70px;
    font-size: 13px;
}

#outbutton1:hover{
	color: white;
	background: url("file:///E:/Users/MKLO/workspace/Ebay/WebContent/HeaderWp2.jpg") repeat center center;
}


#searchbar{
	position: absolute;
	top: 100px;
	left: 10px;
	width: 200px;
	height: 100%;
	background-color: #303036;
	z-index: 0;
	color: white;
	text-align: center;
}

.label{
	
}

.messbtn{
	background-color: #063E53 !important;
	background: none !important;
    border: none !important;
    padding: 15px 25px !important;
    color: white !important;
    text-decoration: none !important;
    margin: 1px 2px !important;
    cursor: pointer !important;
    width: 170px !important;
    font-size: 100% !important;
}

table {
    border: 1px solid black;
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
    text-align: left;
  }
tr:nth-child(even) {
    background-color: #808080;
}

tr:hover{
	background-color: #303036;
	color: white;
	}

</style>
<title>Messages Inbox</title>
</head>
<body>
	<div id="heading">
	</div>
	<div id="searchbar">
	<br>
	<form action="NewMessage.jsp" method="post">
		<input type="submit" class=messbtn value="New message">
	</form>
	<hr>
	<form action="MessageServlet" method="post">
		<input type="hidden" name="function" value="Inbox">
		<input type="submit" class=messbtn value="Inbox">
	</form>
	<hr>
	<form action="MessageServlet" method="post">
		<input type="hidden" name="function" value="Outbox">
		<input type="submit" class=messbtn value="Outbox">
	</form>
	<hr>
	</div>
	<div id="head">
		<img id=logo1 src="file:///E:/Users/MKLO/workspace/Ebay/WebContent/logoExp3.png" width=70px>
		<h1>
			-BAY
		</h1>
		<div id=outcontainer>
			<form id=out action=LogoutServlet  method=get>
				<input id=outbutton type="submit" value="Logout">
			</form>
		</div>
		<form action=MainNavigation.jsp  method=get>
			<input id=outbutton1 type="submit" value="Go Back">
		</form>
	</div>
	<div id="main">
		<table style="width:100%">
		<tr>
		    <th>From</th>
		    <th>Time</th>
		    <th>Subject</th>
		 </tr>
		 <c:forEach var="messages" items="${userMessagesInc }">
		 	<tr>
		 		<td>${messages.user2.username}</td>
		 		<td style="text-align: center;">${messages.time } </td>
		 		<td> 
		 		<form action=MessageInfo method=get>
		 			<c:choose>
		 				<c:when test="${messages.status==0 }">
		 					<input type="hidden" name ="message" value="${messages.helper }">
		 					<input type="hidden" name ="outIn" value="Inbox" >
		 					<input style="color:red" type="submit" value="${messages.subject}"> 
		 				</c:when>
		 				<c:otherwise>
		 					<input type="hidden" name ="message" value="${messages.helper }">
		 					<input type="hidden" name ="outIn" value="Inbox" >
		 					<input type="submit" value="${messages.subject}"> 
		 				</c:otherwise>
		 			</c:choose>
		 			
		 		</form> 
		 		</td>
		 		</td>
		 </tr>
		 </c:forEach>
		</table>	
	</div>
	
</body>
</html>