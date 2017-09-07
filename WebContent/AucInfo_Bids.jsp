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

.out{
	float: right;
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
    width:150px;
    color: black;
    font-size: 130%;
}

td{
	border: 1px solid black;
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
}

</style>
<title>Auc  Bids</title>
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
			<div id=outcontainer>
		<form class=out action=UserServlet  method=get>
				<input class=outbutton type="submit" value="<%= session.getAttribute("savedUsername") %>">
			</form>
			<form class=out action=LogoutServlet  method=get>
				<input class=outbutton type="submit" value="Logout">
			</form>
			<%
			String sellerIF = request.getParameter("function");	
			if(sellerIF==null)
			{
				%>
				<form class=out action=MainNavigation.jsp >
					<input class=outbutton type="submit" value="Go Back">
				</form>
				<%
			}
			else
			{
				%>
				<form class=out action=MyAuctionsManagement.jsp >
					<input class=outbutton type="submit" value="Go Back">
				</form>
				
				<%
			}
			%>
			<% int unreadMessages =(int) session.getAttribute("unreadMessageCount");
				
				if (unreadMessages != 0)
				{
					%><form class=out action=MessageServlet  method=get>
						<input type="hidden" name="function" value="Inbox">
						<input class=outbutton type="submit" value="New Messages: <%= unreadMessages  %> ">
						</form>
				<% }
		%>
				</div>
		</div>
	</div>
	<div id="main">
		<table style="width:75%">
		<c:forEach var="bid" items="${bids}">
			<tr>
				<th colspan="6"> Bid </th>
			</tr>
			
			<tr>
			    <th>Bidder:</th>
			    <td>${bid.user.username}</td>
			    <th>Amount:</th>
			    <td>${bid.amount }</td>
			    <th>Time:</th>
			    <td>${bid.time }</td>
			 </tr>
		 </c:forEach>
		 
		</table>			
	</div>
</body>
</html>