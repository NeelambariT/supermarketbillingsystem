<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content=text/html;>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="style1.css">
<title></title>
</head>
<body>
<form id=formname action=Customername method="post">
<div><label for="number">contact Number:</label><input type="text" id="cmob"  value="<%=request.getParameter("cmob") %>" name="cmob">
<input type="submit" value="Name"><% String cusname = (String) request.getAttribute("cusname"); %>
<% if(cusname != null && !cusname.isEmpty()) { %>
        <%= cusname %>
 
<% } else { %>
        <p></p>
    <% } %>
</div></form>

</body>
</html>