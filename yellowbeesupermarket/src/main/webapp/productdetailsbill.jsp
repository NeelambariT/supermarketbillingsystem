<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.util.List"%>
<%@ page import="yellowbeesupermarket.Productdetailsbill"%>
<%@ page import="yellowbeesupermarket.Product1"%>

<!DOCTYPE html>
<html>
<head>
    <title>Product List</title>
    
</head>
<body>
    <table border="1">
        <tr>
            <th>Product Code</th>
            <th>Product Name</th>
            <th>type</th>
            <th>Rate</th>
        </tr>
      
        <%Iterator<?> itr; %>
<%  List<?> data= (List<?>)request.getAttribute("data");
for (itr=data.iterator(); 
		itr.hasNext(); )
        {
         %>
            <tr >
                <td><%=itr.next()%></td>
<td><%=itr.next()%></td>
<td><%=itr.next()%></td>
<td><%=itr.next()%></td>
            </tr>
        <% } %>
        <% %>
    </table>
</body>
</html>
