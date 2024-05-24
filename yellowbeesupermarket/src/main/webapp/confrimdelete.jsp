<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*" import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style1.css">
<body>
<img  class="background" src=file:///C:/Users/saine/eclipse-workspace/yellowbeesupermarket/images/yellowbees.png width=30% height=50%/>
<header class="watermark"><B>YELLOWBEES<sub>&reg;</sub></B><br>Supermarket</header>
<%-- 
<jsp:include page='deletebuyer.jsp'>
    <jsp:param name="cmob" value=""/>
</jsp:include>--%>
<form action ="Deletebuyer" method="post" id="form">
<table id="tabledetails">
<tr>
<th><b>Name</b></th>
<th><b>Contact</b></th>
<th><b>Mail</b></th>
<th><b>Address</b></th>
</tr>
<%Iterator<?> itr; %>
<%  List<?> data= (List<?>)request.getAttribute("data");
for (itr=data.iterator(); itr.hasNext(); )
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
<p><h3>Are you sure to delete?</h3><p>
<button type="submit">DELETE</button>
<button type="reset" onclick="location.href='http://localhost:8080/yellowbeesupermarket/deletebuyer.jsp'">CANCEL</button>
<img  class="bgbottom" src=file:///C:/Users/saine/eclipse-workspace/yellowbeesupermarket/images/yellowbees.png width=30% height=50%/>
<header class="watermark"><B>YELLOWBEES<sub>&reg;</sub></B><br>Supermarket</header>
</form>
</body>
</html>