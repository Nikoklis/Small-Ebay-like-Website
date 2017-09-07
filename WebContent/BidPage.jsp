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

#demoMap{
	height: 250px;
	border: 1px solid black;
    
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
<title>Auction Normal</title>
</head>
<body>

	<%
		String visitor = (String) session.getAttribute("visitor");
	%>
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
		<table style="width:100%; float:left;">
		<tr>
		    <th>Auction ID:</th>
		    <td><c:out value = "${item.item_ID} "> </c:out></td>
		 </tr>
		 <tr>
		    <th>Name:</th>
		    <td><c:out value = "${item.name} "> </c:out></td>
		 </tr>
		 <tr>
		   <th>Categories:</th>
		    <c:forEach var="category" items="${item.categories }">
		    	<td ><c:out value="${category.name }"> </c:out></td>
		    </c:forEach>
		 </tr>
		 <tr style="background-color: #b3cccc">
		    <th>Top Bid:</th>
		    <td><c:out value = "${item.curently} "> </c:out></td>
		 </tr>
		 <tr style="background-color: #b3cccc"> 
		    <th>Top Bidder:</th>
		    <td>
		   	 <c:forEach var="item1" items="${item.bids }">
		    	<c:if test="${item1.amount == item.curently }" >
		    		<c:out value ="${item1.user.username }"/>
		    	</c:if>
		    
		   	 </c:forEach>
		    </td>
		 </tr>
		 <tr>
		    <th>Buy Price:</th>
		    <td><c:choose>
							<c:when test="${item.buy_Price ==0.0}">
								-
							</c:when>
							<c:otherwise>
								<c:out value="${item.buy_Price }"></c:out>
							</c:otherwise>
						</c:choose></td>
		 </tr>
		 <tr>
		    <th>Location:</th>
		    <td><c:choose>
		    	<c:when test="${item.location.isEmpty() }">
		    		-
		    		</c:when>
		    		<c:otherwise>
		    			<c:out value = "${item.location}"> </c:out>
		    		</c:otherwise>
		   	 </c:choose></td>
		 </tr>
		 <tr>
		    <th>Country:</th>
		    <td><c:choose>
		    	<c:when test="${item.country.isEmpty() }">
		    		-
		    		</c:when>
		    		<c:otherwise>
		    			<c:out value = "${item.country}"> </c:out>
		    		</c:otherwise>
		   	 </c:choose></td>
		 </tr>
		 <tr>
		    <th>Pictures:</th>
		    <td>
		    	
		    		<c:choose>
		    			<c:when test="${!item.pictures.isEmpty() }">
		    				<c:forEach var = "pic" items="${item.pictures }">
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
		    <td><c:out value = "${item.started} "> </c:out></td>
		 </tr>
		 <tr>
		    <th>Ends:</th>
		    <td><c:out value = "${item.ends} "> </c:out></td>
		 </tr>
		 <tr>
		    <th>Description:</th>
		    <td><c:out value = "${item.description} "> </c:out></td>
		 </tr>
		</table>			
	</div>
	<%
		if (visitor == null)
		{
			%>
			<c:choose>
				<c:when test= "${item.CanBeBid() == false  }">
					
				</c:when>
				<c:otherwise>
					<div id=transaction >
					<form action="Bids"  method=get>
							<input type="hidden" name="item_ID" value="${item.item_ID }"/>
							<input type="hidden" name="user_ID" value="<%=session.getAttribute("savedUsername") %>"/>
							<label>Bid amount: </label>
							<input type="text" name="bidamount"><br> 	 	
							<input class="con" type="submit" value="Bid">
					</form>
				
					<c:choose>
						<c:when test="${item.buy_Price!=0.0 }">
							<label> or</label>
							<form action=BuyNow  method=get>
								<input type="hidden" name="itemID" value="${item.item_ID }">
								<input class="con" type="submit" value="Buy now!">
							</form>
							<br>
						</c:when>
						<c:otherwise>
						
						</c:otherwise>
					</c:choose>
						<c:choose>
							<c:when test="${item.latitude == 0 && item.longtitude ==0  }">				
									No coordinates were given for this item

							</c:when>
							<c:otherwise>	
								<div id="demoMap" >
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</c:otherwise>
			</c:choose>
			
		<%
		}
		else
		{
			%>
				<c:choose>
					<c:when test="${item.latitude == 0 && item.longtitude ==0  }">
						<div id=transaction>
							No coordinates were given for this item
						</div>
							
					</c:when>
					<c:otherwise>
						<div id=transaction>
						<div id="demoMap" >
								
						</div>
						</div>
					</c:otherwise>
				</c:choose>
					
			<%
		}	
			%>
		
		
		
		
		
		
		

	<script src="http://openlayers.org/api/OpenLayers.js"></script>
	<script>
	    map = new OpenLayers.Map("demoMap");
	    
	    var mapnik         = new OpenLayers.Layer.OSM();
        var fromProjection = new OpenLayers.Projection("EPSG:4326");   // Transform from WGS 1984
        var toProjection   = new OpenLayers.Projection("EPSG:900913"); // to Spherical Mercator Projection
        var position       = new OpenLayers.LonLat(<c:out value="${item.longtitude}"/>,<c:out value="${item.latitude}"/>).transform( fromProjection, toProjection);
        var zoom           = 10; 

        map.addLayer(mapnik);
        
        var markers = new OpenLayers.Layer.Markers( "Markers" );
        map.addLayer(markers);
        markers.addMarker(new OpenLayers.Marker(position));
        
        map.setCenter(position, zoom );
	    
	</script> 
	
	
</body>
</html>