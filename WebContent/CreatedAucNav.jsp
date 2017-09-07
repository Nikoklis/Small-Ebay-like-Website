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
	padding: 10px;
	overflow-x: auto;
	text-align: center;
	background: #f0f5f5;
	width: 700px;
	outline: black solid thin;
	margin-left: auto;
	margin-right: auto;
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

.out{
	float: right;
}

.outbutton{
	background-color: white !important;
    border: none !important;
    padding: 15px 25px !important;
    color: #063E53 !important;
    text-decoration: none !important;
    margin: 1px 2px !important;
    cursor: pointer !important;
    width: 100px !important;
    height: 70px !important;
    white-space: normal !important;
    font-size: 16px !important;
}

.outbutton:hover{
	color: white;
	background: url("file:///E:/Users/MKLO/workspace/Ebay/WebContent/HeaderWp2.jpg") repeat center center;
}

.aucdiv{
	margin: auto;
	width: 70%;
	height: 140px;
}

.aucform{
	
}

.aucpict{
	outline: black solid thin;
	height:140px;
	width:120px;
	float: left;
}

.aucpictholder{
	outline: black solid thin;
	height:140px;
	width:120px;
	float: left;
}

p{
	
	font-size: 120%;
}
</style>
<title>Auc Nav</title>
</head>
<body>
	<div id="heading">
	</div>
	<div id="head">
		<img id=logo1 src="/Ebay/logoExp3.png" width=70px>
		<h1>
			-BAY
		</h1>
		<div id=outcontainer>
			<form class=out action=UserServlet method=get>
				<input class=outbutton type="submit" value="<%= session.getAttribute("savedUsername") %>">
			</form>
			<form class=out action=LogoutServlet  method=get>
				<input class=outbutton type="submit" value="Logout">
			</form>
			<form class=out action=MainNavigation.jsp  method=get>
				<input type="hidden" name="unreadMessageCount" value="<%= session.getAttribute("unreadMessageCount") %>">
				<input class=outbutton type="submit" value="Go Back">
			</form>
			<form class=out action=MessageServlet  method=get>
				<input type="hidden" name="function" value="Inbox">
				<input class=outbutton type="submit" value="New Messages <%=session.getAttribute("unreadMessageCount") %>">
			</form>
		</div>
	</div>
	<div id="main">
		<!-- <div class="aucdiv">
			<img class=aucpict src="file:///E:/Users/MKLO/workspace/Ebay/WebContent/white_chair_2.jpg">
			<form class="aucform" action=Someservlet method=post>
				<input type="hidden" value="White Chair">
				<input type="submit" value="White Chair">
			</form>
			<p>
				Current Bid: 200$
				<br>
				Buy Price: 400$
				<br>
				Country: Greece
			</p>
		</div> -->
		<hr>
		<div class="aucdiv">
			<c:forEach var="item" items="${itemsUserAuc}">
				<c:choose>
					<c:when test="${item.pictures.isEmpty() }">				
						<div class="aucpictholder">No picture was given</div>
					
						<form class="aucform" action=AucInfoChoose method=post>
							<input type="hidden" name="hiddenitemid" value="${item.item_ID }">
							<input type="submit" value="${item.name }">
						</form>
						<p>
						<br>
						Current Bid:
						<c:out value="${item.curently }"></c:out>
						<br>
						Buy_Price: 
						<c:choose>
							<c:when test="${item.buy_Price ==0.0}">
								-
							</c:when>
							<c:otherwise>
								<c:out value="${item.buy_Price }"></c:out>
							</c:otherwise>
						</c:choose>
						</p>
				
						<hr>
					</c:when>
					<c:otherwise>				
							<img class=aucpict src="${item.pictures[0].id.picLink}" alt="tennis" >
							
							<form class="aucform" action=AucInfoChoose method=post>
								<input type="hidden" name="hiddenitemid" value="${item.item_ID }">
								<input type="submit" value="${item.name }">
							</form>
							<p>
							<br>
							Current Bid:
							<c:out value="${item.curently }"></c:out>
							<br>
							Buy_Price: 
							<c:choose>
								<c:when test="${item.buy_Price ==0.0}">
									-
								</c:when>
								<c:otherwise>
									<c:out value="${item.buy_Price }"></c:out>
								</c:otherwise>
							</c:choose>
							</p>
					
							<hr>
					</c:otherwise>
				</c:choose>					
			</c:forEach>
		
		</div>
	</div>
	
</body>
</html>