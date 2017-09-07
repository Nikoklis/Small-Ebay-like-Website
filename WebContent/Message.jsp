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
	padding: 20px;
	overflow-x: auto;
	width: 700px;
	display: inline-block;
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
    width: 200px;
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
    height: 40px;
    text-align: center;
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
    height: 70px
}

#outbutton1:hover{
	color: white;
	background: url("file:///E:/Users/MKLO/workspace/Ebay/WebContent/HeaderWp2.jpg") repeat center center;
}

table {
    border: 1px solid black;
    border-collapse: collapse;
    border-spacing: 5px;
}

th{
	border: 0px solid black;
    border-collapse: collapse;
    border-spacing: 5px;
    text-align: right;
    height: 75px;
    width:150px;
    color: black;
    font-size: 130%;
}

td{
	border: 0px solid black;
    border-collapse: collapse;
    border-spacing: 5px;
    text-align: left;
    padding: 15px;
    font-size: 150%;
  }

.pic{
	width: 50px;
	height: 50px;
}

.con{
	background-color: #063E53 !important;
    border: none !important;
    padding: 15px 25px !important;
    color: white !important;
    text-decoration: none !important;
    margin: 1px 2px !important;
    cursor: pointer !important;
    width: 250px !important;
    float: none !important; 
}

#transaction{
	text-align: center;
	width: 400px;
	position:fixed;
	top: 120px;
	right: 30px;
}
label{
	font-size: 150%;
}
</style>
<title>Message</title>
</head>
<body>
	<div id="heading">
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
				<input type="hidden" name="unreadMessageCount" value="<% request.getAttribute("unreadCount"); %>">
				<input id=outbutton1 type="submit" value="Go Back">
			</form>
	</div>
	<div id="main">
		<table style="width:100%; float:left;">
		 <tr>
		    <th>From:</th>
		    <td>${message.user2.username }</td>
		 </tr>
		 <tr>
		    <th>To:</th>
		    <td>${message.user1.username }</td>
		 </tr>
		 <tr>
		    <th>Date/Time sent:</th>
		    <td>${message.time }</td>
		 </tr>
		 <tr>
		    <th>Message:</th>
		    <td>${message.message }</td>
		 </tr>
		</table>			
	</div>
	<div id=transaction >
		<form action=NewMessage.jsp  method=get>
				<input class="con" type="submit" value="Reply">
		</form>
		<hr>
		<form action=MessageServlet  method=get>
				<input type="hidden" name = "function" value="delete">
				<input type="hidden" name = "messageToDelete" value = "${message.helper }">
				<input class="con" type="submit" value="Delete message">
		</form>
	</div>
</body>
</html>