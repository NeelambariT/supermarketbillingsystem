<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style1.css">
<script type=text/html src="script1.js"defer></script>
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
<form action ="Newbuyer" method="post" id="form">
<div class=personal><h1>New Customer Form</h1>
<div class="one"><label for="name">Customer Name</label><input type="text" id="cname" name="cname"></div>
<div class="one"><label for="number">contact Number</label><input type="text" id="cmob" name="cmob"></div>
<div class="one"><label for="mail">e-mail id</label><input type="text" id="mail" name="cmail"><div class="error"> </div></div>
<div class="one"><label for="address">Address</label><input type="text" id="cadd" name="cadd"><div class="error"> </div></div>
<button type="submit">submit</button>
<button type="reset">cancel</button>
<img  class="bgbottom" src=file:///C:/Users/saine/eclipse-workspace/yellowbeesupermarket/images/yellowbees.png width=30% height=50%/>
<header class="watermark"><B>YELLOWBEES<sub>&reg;</sub></B><br>Supermarket</header>
</div>
</form>
</body>
<script>
document.getElementById('form').addEventListener('submit', function(event) {
    let name = document.getElementById('cname').value.trim();
    let number = document.getElementById('cmob').value.trim();
    let email = document.getElementById('cmail').value.trim();
    let address = document.getElementById('cadd').value.trim();

    if (name === '' || number === '' || email === '' || address === '') {
        alert('Please fill in all fields.');
        event.preventDefault();
    }

    let numberPattern = /^[6-9]\d{9}$/;
    if (!number.match(numberPattern)) {
        alert('Please enter a valid Indian mobile number.');
        event.preventDefault();
    }

    let emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!email.match(emailPattern)) {
        alert('Please enter a valid email address.');
        event.preventDefault();
    }
});
</script>
</html>