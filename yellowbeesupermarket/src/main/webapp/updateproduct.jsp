<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
    <%@ page import="java.util.*" %>
    <%@ page import="java.util.HashMap"%>
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
    <form action="Productupdate" method="post"id="form">
        <div class="one"><label for="pcode">Product Code:</label>
        <input type="text" id="pcode" name="pcode" required/></div>
        <input type="submit" value="Fetch Details"/>
    </form>
    
    <% 
    // Check if product details are available as a request attribute
    if (request.getAttribute("product") != null) {
        HashMap<String, String> product = (HashMap<String, String>) request.getAttribute("product");
    %>
    
    <form action="Productupdate" method="post" id="form">
        <input type="hidden" name="pcode" value="<%= product.get("pcode") %>"/>
        <table>
            <tr>
                <td>Product Name:</td>
                <td><input type="text" name="pname" value="<%= product.get("pname") %>"/></td>
            </tr>
            <tr>
                <td>Type:</td>
                <td><input type="text" name="type" value="<%= product.get("type") %>"/></td>
            </tr>
            <tr>
                <td>Rate:</td>
                <td><input type="number" name="rate" value="<%= product.get("rate") %>"/></td>
            </tr>
            <tr>
                <td>Stock:</td>
                <td><input type="number" name="stock" value="<%= product.get("stock") %>"/></td>
            </tr>
            <tr>
                <td>Seller:</td>
                <td><input type="text" name="seller" value="<%= product.get("seller") %>"/></td>
            </tr>
            <tr>
                <td>Date of Stock:</td>
                <td><input type="text" name="dateofstock" value="<%= product.get("dateofstock") %>"/></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Save"/></td>
            </tr>
        </table>
    </form>
    
    <% 
    } // end if
    %>
</body>
</html>