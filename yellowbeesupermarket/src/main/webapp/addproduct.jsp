<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<form action ="Product" method="post" id="form">
<div class=personal><h1>Add Product Form</h1>
<div class="one"><label for="code">Pcode</label><input type="number" id="pcode" name="pc"></div>
<div class="one"><label for="name">Product Name</label><input type="text" id="pname" name="pn"></div>
<div class="one"><label for="type">Product Type</label><input type="text" id="ptype" name="pt"></div>
<div class="one"><label for="price">Price per piece/kg</label><input type="number" id="price" name="price"></div>
<div class="one"><label for="quantity">stock quantity</label><input type="number" id="qty" name="qty"></div>
<div class="one"><label for="date">Date of Stock entry</label><input type="date" id="date" name="date" placeholder="yyyy-mm-dd" pattern=[0-9]{4}-[0-9]{2}-[0-9]{2}></div>
<div class="one"><label for="seller">Seller Details.</label><input type="text" id="seller" name="sell"></div>
<button type="submit">submit</button>
<button type="reset">cancel</button>
<img  class="bgbottom" src=file:///C:/Users/saine/eclipse-workspace/yellowbeesupermarket/images/yellowbees.png width=30% height=50%/>
<header class="watermark"><B>YELLOWBEES<sub>&reg;</sub></B><br>Supermarket</header>
</div>
</form>
</body>
</html>