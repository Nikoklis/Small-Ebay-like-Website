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
	background: url("/Ebay/HeaderWp2.jpg") repeat center center;
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
	background: url("/Ebay/HeaderWp2.jpg") repeat center center;
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

#searchsubmit{
	width: 90%;
	border-radius: 200px;
}

#locationsearch{
	width: 90%;
	height: 20px;
	padding: 0px 0px;
	margin: 0px 0px;
}

#pricesearch1{
	width: 30%;
	height: 25px;
	padding: 0px 0px;
	margin: 0px 0px;
}

#pricesearch2{
	width: 30%;
	height: 25px;
	padding: 0px 0px;
	margin: 0px 0px;
}

.label{
	
}

#searchsub{
	background-color: #063E53;
	background: url("/Ebay/HeaderWp2.jpg") repeat center center;
    border: none;
    padding: 15px 25px;
    color: white;
    text-decoration: none;
    margin: 1px 2px;
    cursor: pointer;
    width: 100px;
    font-size: 100%;
}

#categorybutton{
	background-color: white;
    border: none;
    padding: 15px 25px;
    color: #063E53;
    text-decoration: none;
    margin: 1px 2px;
    cursor: pointer;
    width: 200px;
    height: 70px;
    font-size: 13px;
    float: left;
}

#categorybutton:hover{
	color: white;
	background: url("/Ebay/HeaderWp2.jpg") repeat center center;
}

.categorydiv{
	position: absolute;
    display: inline-block;
    float: left;
}

.category-content{
	display: none;
    position: absolute;
    top: 70px;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 999;
}

.category-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
	z-index: 999;
}

.category-content a:hover {background-color: #f1f1f1}

.categorydiv:hover .category-content{
    display: block;
}

.categorydiv:hover .categorybutton {
    background-color: #3e8e41;
}
</style>
<title>Search</title>
</head>
<body>
	<div id="heading">
	</div>
	<div id="searchbar">
	<br>
		<form action="CheckForAdvancedSearch" method="post">
		
			 Search by:
			 <hr>
			 Name:<br>
			 <input id=searchsubmit type="text" name="name"><hr>
			 PRICE<hr>
			 From:<br>
			 <input id=pricesearch1 type="text" name="PriceFrom"><hr>
			 To:<br>
			 <input id=pricesearch2 type="text" name="PriceTo"><hr>
			 Location:<br>
			 <input id=locationsearch type="text" name="location"><hr>
			<input type="hidden" name ="function" value = "otherSearch">
			<input type="submit" id=searchsub value="Search">
		</form>
	<br>
	</div>
	<div id="head">
		<img id=logo1 src="/Ebay/LogoExp3.png" width=70px>
		<h1>
			-BAY
		</h1>
		<div id=outcontainer>
			<form id=out action=LogoutServlet  method=get>
				<input id=outbutton type="submit" value="Logout">
			</form>
				<div class=categorydiv>
				<button id=categorybutton >Categories</button>
				 <div class="category-content">
				 <form  action=CheckForAdvancedSearch method=post>
					<input type="hidden" name="function" value="Art">				
					<input class="catform" type="submit" value="Art">		
				</form>
				<form  action=CheckForAdvancedSearch method=post>
					<input type="hidden" name="function" value="Collectibles">				
					<input class="catform" type="submit" value="Collectibles">		
				</form>
				<form  action=CheckForAdvancedSearch method=post>
					<input type="hidden" name="function" value="Food">				
					<input class="catform" type="submit" value="Food">		
				</form>
				<form  action=CheckForAdvancedSearch method=post>
					<input type="hidden" name="function" value="Clothing">				
					<input class="catform" type="submit" value="Clothing">		
				</form>
				<form  action=CheckForAdvancedSearch method=post>
					<input type="hidden" name="function" value="Literature">				
					<input class="catform" type="submit" value="Literature">		
				</form>
				<form  action=CheckForAdvancedSearch method=post>
					<input type="hidden" name="function" value="Health">				
					<input class="catform" type="submit" value="Health">		
				</form>
				<form  action=CheckForAdvancedSearch method=post>
					<input type="hidden" name="function" value="Electronics">				
					<input class="catform" type="submit" value="Electronics">		
				</form>
	    		 <form  action=CheckForAdvancedSearch method=post>
					<input type="hidden" name="function" value="Gaming">				
					<input class="catform" type="submit" value="Gaming">		
				</form>
				<form  action=CheckForAdvancedSearch method=post>
					<input type="hidden" name="function" value="Decor">				
					<input class="catform" type="submit" value="Decor">		
				</form>
	 			 </div>
 			 </div>
		</div>
		<form action=MainNavigation.jsp  >
				<input type="hidden" name="unreadMessageCount" value="<%= session.getAttribute("unreadMessageCount") %>">
				<input id=outbutton1 type="submit" value="Go Back">
			</form>
	</div>
	
	<div id="main">
		<div class=aucdiv>
			<c:forEach var="item" items="${items}">
					<c:choose>
					<c:when test="${item.pictures.isEmpty() }">
						<div class='aucpictholder'> No pic was given</div>
						<form class='aucform' action="BidInfo" method=post>
							<input type="hidden" name="page" value="goingToBidPage"/>
							<input type="hidden" name="item_ID" value="${item.item_ID }"/>
							<input type="hidden" name="user_ID" value="<%=session.getAttribute("savedUsername") %>"/>
							<input type="submit" value="${item.name }"/>
						</form>
						<c:choose>
							<c:when test="${item.CanBeBid() == false }">
								<div style="color:red">
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
									<br>
									Location:
									<c:choose>
										<c:when test="${item.location.isEmpty() }">
											-
										</c:when>
										<c:otherwise>
											<c:out value="${item.location }"></c:out>
										</c:otherwise>
									</c:choose>
									<hr>
									<br>
								</div>
							</c:when>
							<c:otherwise>
							
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
								<br>
								Location:
								<c:choose>
									<c:when test="${item.location.isEmpty() }">
										-
									</c:when>
									<c:otherwise>
										<c:out value="${item.location }"></c:out>
									</c:otherwise>
								</c:choose>
								<hr>
								<br>
							</c:otherwise>
						</c:choose>
						
					</c:when>
					<c:otherwise>
						<img class=aucpict src="${item.pictures[0].id.picLink }">
						<form class='aucform' action="BidInfo" method=post>
							<input type="hidden" name="page" value="goingToBidPage"/>
							<input type="hidden" name="item_ID" value="${item.item_ID }"/>
							<input type="hidden" name="user_ID" value="<%=session.getAttribute("savedUsername") %>"/>
							<input type="submit" value="${item.name }"/>
						</form>
						<c:choose>
							<c:when test="${item.CanBeBid() == false}">
								<div style="red">
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
										<br>
										Location:
										<c:choose>
											<c:when test="${item.location.isEmpty() }">
												-
											</c:when>
											<c:otherwise>
												<c:out value="${item.location }"></c:out>
											</c:otherwise>
										</c:choose>
										<hr>
										<br>
								</div>	
							</c:when>
							<c:otherwise>
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
								<br>
								Location:
								<c:choose>
									<c:when test="${item.location.isEmpty() }">
										-
									</c:when>
									<c:otherwise>
										<c:out value="${item.location }"></c:out>
									</c:otherwise>
								</c:choose>
								<hr>
								<br>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			<br>
			</c:forEach> 
			</div> 
	</div>
	
</body>
</html>