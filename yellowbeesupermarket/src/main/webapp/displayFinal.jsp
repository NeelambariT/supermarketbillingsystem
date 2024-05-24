<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Final Display</title>
</head>
<body>
    <table border="1">
        <tr>
            <th>Product Code</th>
            <th>Product Name</th>
            <th>Rate</th>
            <th>Quantity</th>
            <th>Total</th>
        </tr>
        <tr>
            <td><%= request.getParameter("pcode") %></td>
            <td><%= request.getParameter("pname") %></td>
            <td><%= request.getParameter("rate") %></td>
            <td><%= request.getParameter("quantity") %></td>
            <td><%= request.getParameter("total") %></td>
        </tr>
    </table>
</body>
</html>