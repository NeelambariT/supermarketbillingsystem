<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<li><a href="passwordproduct.jsp">PRODUCT</a>
<li><a href="x.jsp">BILLING</a></li>
<li><a href="logout.jsp">LOGOUT</a></li>
</ul>
</nav>

<img  class="background" src=file:///C:/Users/saine/eclipse-workspace/yellowbeesupermarket/images/yellowbees.png width=30% height=50%/>
<header class="watermark"><B>YELLOWBEES<sub>&reg;</sub></B><br>Supermarket</header>
<form action ="Updatebuyer" method="post" id="form">
<div class=personal><h1>Update Customer details</h1></div>
<div class="one"><label for="number">Mobile number:</label>
        <input type="text" id="Mobilenumber" name="Mobilenumber" required/></div>
        <input type="submit" value="Fetch Details"/>
    </form>
<% 
    // Check if product details are available as a request attribute
    if (request.getAttribute("newbuyer") != null) {
        HashMap<String, String> newbuyer = (HashMap<String, String>) request.getAttribute("newbuyer");
    %>
<form action="Updatebuyer" method="post" id="form">
        <input type="hidden" name="Mobilenumber" value="<%= newbuyer.get("Mobilenumber") %>"/>
        <table>
            <tr>
                <td>name</td>
                <td><input type="text" name="cusname" value="<%= newbuyer.get("cusname") %>"/></td>
            </tr>
            <tr>
                <td>address</td>
                <td><input type="text" name="address" value="<%= newbuyer.get("address") %>"/></td>
            </tr>
            <tr>
                <td>mail</td>
                <td><input type="text" name="mail" value="<%= newbuyer.get("mail") %>"/></td>
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