<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Date" import="javax.servlet.*" import="java.text.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style1.css">
<title>billing</title>
</head>
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

<form method="post" action="Customername">
<section>
<div id="time"></div>
</section>
<section id="sec-1">
<!--<div class="two"><label for="number">contact Number:</label><input type="text" id="cmob"  value="<%=request.getParameter("cmob") %>" name="cmob">
<input type="submit" value="Name">-->
<!--<div class="two">><input type="button" id="enter" onclick="http://localhost:8080/yellowbeesupermarket/Customername"></div>-->
<!--<label for="name">Name</label><input type="text" id="cname"  value='${request.cusname}' name="cname">-->

<div>
<div class=boxlink><a class="linktag" href="customername.jsp" target="box">Customerdetails</a></div><iframe name=box src="" height="50px" width="100%"></iframe>
</div>
</section>  
</form>
<form action="" id="form3" method="post">
<div class=boxlink style="width: 30%; float:right"><a class="linktag1" href="displayFinal.jsp" target="box1">Bill</a>
<iframe name=box1 src="" height="300px" width="500px"></iframe></div>
<div class=boxlink1 style="width: 30%; float:right"><a class="linktag1" href="target.jsp" target="box3">Selected product</a>
<iframe name=box3 src="" height="300px" width="500px"></iframe></div>
<br><div class="wapper" style="width: 70%; float:right"><a class="linktag1" href="Productdetailsbill" target="box2">All products</a>
<iframe name=box2 id="rightsideframe" src="" height="300px" width="500px"></iframe></div>
</form>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.0/jquery.min.js"></script>  
<script src="jquery-3.2.1.js"></script> 

       <!--  <script> 
            $(document).ready(function() { 
                $("#sub").click(function() { 
                    var fn = $("#cmob").val(); 
                    $.post("Billingcusname.java", { 
                        cmob: fn 
                    }, function(data) { 
                        $("#cname")html.(data); 
                    }); 
  
                }); 
            }); 
        </script> -->
<script>
        function updateClock() {
    var now = new Date(), // current date
        months = ['Jan', 'Feb', 'mar','april','may','jun','july','aug','sep','oct','nov','dec'];
    // you get the idea
        time = now.getHours() + ':' + now.getMinutes() +':' +now.getSeconds(), // again, you get the idea

        // a cleaner way than string concatenation
        date = [now.getDate(), 
                months[now.getMonth()],
                now.getFullYear()].join(' ');

    // set the content of the element with the ID time to the formatted string
    document.getElementById('time').innerHTML = [date, time].join('<br> Time: ');

    // call this function again in 1000ms
    setTimeout(updateClock, 1000);
}
updateClock(); // initial call
</script>
</body>
</html>