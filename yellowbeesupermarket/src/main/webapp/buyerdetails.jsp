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
<li><a href="passwordproduct.jsp">PRODUCT</a>
<li><a href="x.jsp">BILLING</a></li>
<li><a href="logout.jsp">LOGOUT</a></li>
</ul>
</nav>

<img  class="background" src=file:///C:/Users/saine/eclipse-workspace/yellowbeesupermarket/images/yellowbees.png width=30% height=50%/>
<header class="watermark"><B>YELLOWBEES<sub>&reg;</sub></B><br>Supermarket</header>
<form action ="Newbuyer" method="post" id="">
<table id="tabledetails">
<tr>
<th><b>Name</b></th>
<th><b>Contact</b></th>
<th><b>Mail</b></th>
<th><b>Address</b></th>
</tr>
<%Iterator<?> itr; %>
<%  List<?> data= (List<?>)request.getAttribute("data");
for (itr=data.iterator(); 
		itr.hasNext(); )
{
%>
<tr>
<td><%=itr.next()%></td>
<td><%=itr.next()%></td>
<td><%=itr.next()%></td>
<td><%=itr.next()%></td>
</tr>
<%}%>
</table>
<img  class="bgbottom" src=file:///C:/Users/saine/eclipse-workspace/yellowbeesupermarket/images/yellowbees.png width=30% height=50%/>
<header class="watermark"><B>YELLOWBEES<sub>&reg;</sub></B><br>Supermarket</header>
</form>

</body>
</html>