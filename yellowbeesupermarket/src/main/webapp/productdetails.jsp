<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style1.css">
<title>YELLOWBEES SUPERMARKET</title>
</head>
<header class="head"><B>YELLOWBEES<sub>&reg;</sub></B><br>Supermarket</header>
<body>
<nav class=navbar>
<ul>
<li><a>CUSTOMER</a>
      <ul><li><a href="newbuyer.jsp">NEW CUSTOMER</a></li>
       <li><a href="updatebuyer.jsp">UPDATE CUSTOMER</a></li>
       <li><a href="deletebuyer.jsp">DELETE CUSTOMER</a></li>
       <li><a href="Buyerdetails">CUSTOMER DETAILS</a></li></ul></li>
<li><a>PRODUCT</a>
       <ul><li><a href="addproduct.jsp">ADD PRODUCT</a></li>
       <li><a href="Productdetails">PRODUCT DETAILS</a></li>
       <li><a href="updateproduct.jsp">UPDATE PRODUCT</a></li>
       <li><a href="deleteproduct.jsp">DELETE PRODUCT</a></li></ul></li>
<li><a href="x.jsp">BILLING</a></li>
<li><a href="logout.jsp">LOGOUT</a></li>
</ul>
</nav>

<img  class="background" src=file:///C:/Users/saine/eclipse-workspace/yellowbeesupermarket/images/yellowbees.png width=30% height=50%/>
<header class="watermark"><B>YELLOWBEES<sub>&reg;</sub></B><br>Supermarket</header>
<form action ="Product" method="post" id="">
<table id="tabledetails">
<tr>
<th><b>pcode</b></th>
<th><b>pname</b></th>
<th><b>Catagory</b></th>
<th><b>MRP</b></th>
<th><b>stock</b></th>
<th><b>seller</b></th>
<th><b>date of stock</b></th>
</tr>
<%  List<?> data= (List<?>)request.getAttribute("data");
for (Iterator<?>itrr=data.iterator(); 
		itrr.hasNext(); )
{
%>
<tr>
<td><%=itrr.next()%></td>
<td><%=itrr.next()%></td>
<td><%=itrr.next()%></td>
<td><%=itrr.next()%></td>
<td><%=itrr.next()%></td>
<td><%=itrr.next()%></td>
<td><%=itrr.next()%></td>
</tr>
<%}%>
</table>
<img  class="bgbottom" src=file:///C:/Users/saine/eclipse-workspace/yellowbeesupermarket/images/yellowbees.png width=30% height=50%/>
<header class="watermark"><B>YELLOWBEES<sub>&reg;</sub></B><br>Supermarket</header>
</form>
</body>
</html>