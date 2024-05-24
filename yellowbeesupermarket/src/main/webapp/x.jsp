<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.*" %>
    <%@ page import="yellowbeesupermarket.Product1" %>
    <%@ page import="java.sql.*" %>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>

 <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.3.2/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.3.1/jspdf.umd.min.js"></script>
<title>yellowbeesbilling</title>
<link rel="stylesheet" href="style1.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
#first{
top:18%;
padding: 5px;
    width: 60%;
    height: 5%;
    background-color: white;
    position: absolute;
}
#second{
top:25%;
padding: 5px;
    width: 35%;
    height: 80%;
    background-color: white;
    position: absolute;

}
#third{
top:25%;
right:37.2%;
padding: 5px;
float:left;
    width: 25%;
    height: 50%;
    background-color: white;
    position: absolute;

}
#fourth{
top:25%;
right:0%;
padding: 5px;
float:left;
    width: 35%;
    height: 200%;
    background-color: white;
    position: absolute;
    over-flow:auto;
}
.thirdform{
text-align:center;
	display:flex;
	flex-direction:column;
	margin-bottom:15px;
}
.thirdform input
{
border-radius:5px;
	font-size:18px;
	margin-top:5px;
	padding:4px;
	border:1px solid #FFEA00;
	text-align:center;
	color:green;
}
</style>

</head>

<body>

<section>
<div id="time"></div>
</section>
<form action="NameLookupServlet" id=first>
MOBILE NUMBER:<input type="text" id="mobileNumber" name="mobileNumber" onkeyup="lookupName()">
NAME:<input type="text" id="customerName" name="customerName" style="font-size:13px"> 
SELLER NAME:<input type="text" id="SELLERNAME" name="SELLER" onkeyup="updateOtherForm()"style="font-size:13px">
</form>
<script>function lookupName() {
	  var mobileNumber = document.getElementById('mobileNumber').value;
	  if (mobileNumber.length == 0) { 
	    document.getElementById('customerName').value = "";
	    return;
	  }
	  var xhr = new XMLHttpRequest();
	  xhr.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	      document.getElementById('customerName').value = this.responseText;
	    }
	  };
	  xhr.open("GET", "NameLookupServlet?mobileNumber=" + mobileNumber, true);
	  xhr.send();
	}
function updateOtherForm() {
    // Get value from input in first form
    var name = document.getElementById('SELLERNAME').value;
    
    // Set value in the second form's input
    document.getElementById('billedby').value = name;
}

</script>

<form action="" id="second">
    <h3>Product List</h3>
    <table id="tabledetails">
        <tr>
            <th>PCode</th>
            <th>PName</th>
            <th>Rate</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/yellowbees", "root", "");
                Statement stmt = con.createStatement();
                String query = "SELECT pcode, pname, rate FROM product";
                ResultSet rs = stmt.executeQuery(query);
                while (rs.next()) {
        %>
        <tr onclick="populateThirdForm('<%=rs.getString("pcode")%>', '<%=rs.getString("pname")%>', '<%=rs.getString("rate")%>')">
            <td><%= rs.getString("pcode") %></td>
            <td><%= rs.getString("pname") %></td>
            <td><%= rs.getString("rate") %></td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</form>
<script>function populateThirdForm(pcode, pname, rate) {
    document.getElementById('pcode').value = pcode;
    document.getElementById('pname').value = pname;
    document.getElementById('rate').value = rate;
    
}</script>

<form action="" id="third">
    <div class=thirdform><label>Product Code: <input type="text" id="pcode" readonly></label></div><br>
    <div class=thirdform><label>Product Name: <input type="text" id="pname" readonly></label></div><br>
    <div class=thirdform><label>Rate: <input type="text" id="rate" readonly></label></div><br>
    <div class=thirdform><label>Quantity: <input type="text" id="quantity" onkeyup="calculateTotal()"></label></div><br>
    <div class=thirdform><label>Total: <input type="text" id="total" readonly></label></div><br>
    <button type="button" onclick="addToFourth()">ADD</button>
    <button type="reset">CLEAR</button>
    <button type="button" onclick="downloadPDF()">Download as PDF</button>
</form>
<script>function calculateTotal() {
    var rate = parseFloat(document.getElementById("rate").value)|| 0;
    var quantity = parseFloat(document.getElementById("quantity").value)|| 0;
    var total = rate * quantity;
    document.getElementById("total").value = total.toFixed(2);
}
function addToFourth() {
    // Read values from third form
    const pcode = document.getElementById('pcode').value;
    const pname = document.getElementById('pname').value;
    const rate = parseFloat(document.getElementById('rate').value) || 0;
    const quantity = parseFloat(document.getElementById('quantity').value) || 0;
    const total = rate * quantity;
    //const total = parseFloat(document.getElementById('total').value) || 0;
    // Insert new row in the fourth form's table
    const table = document.getElementById('productrows');
    const rowNumber = table.rows.length + 1;
    let row = table.insertRow();
    row.insertCell(0).innerHTML = rowNumber;
    row.insertCell(1).innerHTML = pcode;
    row.insertCell(2).innerHTML = pname;
    row.insertCell(3).innerHTML = quantity;
    row.insertCell(4).innerHTML = rate.toFixed(2);
    row.insertCell(5).innerHTML =  total.toFixed(2);
    calculateBillAmount();
    
}

</script>
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
<form action="" id="fourth">
<p align="center"><B>YELLOWBEES<sub>&reg;</sub></B><br>Supermarket<br>
NO:2/127,NEWSTREET,PIN:630000<br>
GSTIN 56743200000000<br>
PH:04100-875857,9874563210</p>

<label for="form2Input">Billedby:</label><input type="text" id="billedby" style="border:none;font-size:20px" readonly>
<% Date now = new Date();
//Format 1
SimpleDateFormat sdf1 = new SimpleDateFormat("MMMM dd, yyyy");
String formattedDate1 = sdf1.format(now);

// Format 2
SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss a");
String formattedTime = sdf2.format(now);
%>
<p>Date: <%=formattedDate1%>
Time: <%=formattedTime%></p>
<p align="center">----------------------------------------------------------------------------------</p>
    <table id="">
        <thead>
            <tr>
                <th>S.No</th>
                <th>PCode</th>
                <th>PName</th>
                <th>Quantity</th>
                <th>Rate</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody id="productrows" >
            <!-- Rows will be added here via JavaScript -->
        </tbody>
        
        <tfoot>
    <tr>
        <td colspan="5" style="text-align:right;"><strong>BillAmount: </strong></td>
        <td id="billamount">0.00</td>
    </tr>
    <tr>
       <!--   <td colspan="6" style="text-align:center;">
            <button type="button" onclick="calculateBillAmount()">Bill Amount</button>
        </td>-->
    </tr>
</tfoot>
    </table>
    <p align="center">----------------------------------------------------------------------------------</p>
    <p align="center">**thankyou** visit again**</p>
</form>
<script>
	  function calculateBillAmount() {
		  
	       
	        let arr = document.querySelectorAll('#productrows tr td:nth-child(6)');    
	        let totalAmount = 0;
	        for(let i=0;i<arr.length;i++){
	        let enter_value=Number(arr[i].textContent)
	        if(enter_value)
	        	totalAmount +=Number(arr[i].textContent);
	        }
	        document.getElementById('billamount').textContent = totalAmount.toFixed(2); 
	  }       
</script>
<script>
   async function downloadPDF() {
     const element = document.getElementById('fourth');
     
     // Include html2canvas and jsPDF only if not globally available
     // Remove these lines if these libraries are included through <script> tags
     const html2canvas = window.html2canvas || (await import('https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.3.2/html2canvas.min.js')).default;
     const { jsPDF } = window.jspdf || await import('https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.3.1/jspdf.umd.min.js');
     
     const canvas = await html2canvas(element);
     const imgData = canvas.toDataURL('image/png');
     
     let pdf = new jsPDF('p', 'mm', 'a4');
     let imgProps = pdf.getImageProperties(imgData);
     let pdfWidth = pdf.internal.pageSize.getWidth();
     let pdfHeight = (imgProps.height * pdfWidth) / imgProps.width;
     pdf.addImage(imgData, 'PNG', 0, 0, pdfWidth, pdfHeight);
     pdf.save("download.pdf");
   }
   </script>
<script>
function updateClock() {
    var now = new Date(), // current date
        months = ['Jan', 'Feb', 'mar','april','may','jun','july','aug','sep','oct','nov','dec'];
    
        time = now.getHours() + ':' + now.getMinutes() +':' +now.getSeconds(),
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