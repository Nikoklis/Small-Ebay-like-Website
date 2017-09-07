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
    float: left !important; 
}

</style>
<title>Auc info</title>
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
				<input id=outbutton1 type="submit" value="Go Back">
			</form>
	</div>
	<div id="main">
		Auction hasn't started yet,
		go to the bottom of the page to edit the auction info or start it:	
		<table style="width:75%">
		<tr>
		    <th>Auction ID:</th>
		    <td><c:out value="${auc.item_ID }"></c:out></td>
		 </tr>
		 <tr>
		    <th>Name:</th>
		    <td><c:out value="${auc.name }"></c:out></td>
		 </tr>
		 <tr>
		    <th>Categories:</th>
		    <c:forEach var="category" items="${auc.categories }">
		    	<td ><c:out value="${category.name }"> </c:out></td>
		    </c:forEach>
		 </tr>
		 <tr>
		    <th>First_Bid:</th>
		    <td><c:out value="${auc.first_Bid }"></c:out>$</td>
		 </tr>
		 <tr>
		    <th>Buy Price:</th>
		    <td><c:out value="${auc.buy_Price }"></c:out>$</td>
		 </tr>
		 <tr>
		    <th>Location:</th>
		    <td><c:out value="${auc.location }"></c:out></td>
		 </tr>
		 <tr>
		    <th>Country:</th>
		    <td><c:out value="${auc.country }"></c:out></td>
		 </tr>
		 <tr>
		    <th>Pictures:</th>
		    <td>
		    	<c:choose>
		    			<c:when test="${!auc.pictures.isEmpty() }">
		    				<c:forEach var = "pic" items="${auc.pictures }">
		    					<img class=pic src="${pic.id.picLink}">
		    				</c:forEach>
		    			</c:when>
		    			<c:otherwise>
		    				No Pictures were given
		    			</c:otherwise>
		    	</c:choose>
		    </td>
		 </tr>
		 <tr>
		    <th>Started:</th>
		    <td>No</td>
		 </tr>
		 <tr>
		    <th>Ends:</th>
		    <td>-</td>
		 </tr>
		 <tr>
		    <th>Description:</th>
		    <td><c:out value="${auc.description }"></c:out></td>
		 </tr>
		</table>			
	</div>
	<div style="text-align:center">
		<form action="StartAuc.jsp"  method=get>
				<input type="hidden" name="AucID" value="${auc.item_ID }"> 	
				<input type="hidden" name="function" value="Start">	  	
				<input class="con" type="submit" value="Start">
			</form>
		<form action="Edit.jsp"  method=get>
				<input type="hidden" name="AucID" value="${auc.item_ID }"> 	
				<input type="hidden" name="function" value="Edit">	 	
				<input class=con type="submit" value="Edit">
			</form>
	</div>
	
</body>
</html>