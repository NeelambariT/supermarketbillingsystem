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
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="style1.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
#first{
top:10%;
padding: 5px;
    width: 60%;
    height: 10%;
    background-color: white;
    position: absolute;
}
#second{
top:23%;
padding: 5px;
    width: 35%;
    height: 80%;
    background-color: white;
    position: absolute;

}
#third{
top:23%;
right:37.2%;
padding: 5px;
float:left;
    width: 25%;
    height: 50%;
    background-color: white;
    position: absolute;

}
#fourth{
top:23%;
right:0%;
padding: 5px;
float:left;
    width: 35%;
    height: 80%;
    background-color: white;
    position: absolute;
}
</style>
</head>
<body>

<section>
<div id="time"></div>
</section>
<form action="NameLookupServlet" id=first>
MOBILE NUMBER:<input type="text" id="mobileNumber" name="mobileNumber" onkeyup="lookupName()">
NAME:<input type="text" id="customerName" name="customerName"> 
</form>
<form action="" id=second>
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
            <td><%= rs.getInt("rate") %></td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</form>

<form action="" id=third>

   <!--   <input type="text" id="pcode" name="pcode" readonly>
    <input type="text" id="pname" name="pname" readonly>
    <input type="number" id="rate" name="rate" readonly>
    <input type="number" id="quantity" name="quantity" placeholder="Quantity">
    <input type="text" id="total" name="total" readonly>
    <button type="button" onclick="addToFourth()">Add</button>-->
    <input type="text" name="pcode" value="<%= request.getParameter("pcode") %>">
        <input type="hidden" name="pname" value="<%= request.getParameter("pname") %>">
        Product Code: <%= request.getParameter("pcode") %><br>
        Product Name: <%= request.getParameter("pname") %><br>
        Rate: <input type="text" name="rate" value="<%= request.getParameter("rate") %>" readonly><br>
        Quantity: <input type="text" id="quantity" name="quantity" onkeyup="calculateTotal(<%= request.getParameter("rate") %>)"><br>
        Total: <input type="text" id="total" name="total" readonly><br>
        <input type="submit" value="Submit"><button type="button" onclick="addToFourth()">Add</button>
        
</form>


<form action="" id=fourth>
<!-- Table for displaying products and their details -->
<table id="tabledetails">
    <thead>
        <tr>
            <th>S.No</th>
            <th>PCode</th>
            <th>PName</th>
            <th>quantity</th>
            <th>rate</th>
            <th>Total</th>
        </tr>
    </thead>
    <tbody id="productRows">
        <!-- Product Rows will be appended here -->
         <tr>
            <td><%= request.getParameter("pcode") %></td>
            <td><%= request.getParameter("pname") %></td>
            <td><%= request.getParameter("rate") %></td>
            <td><%= request.getParameter("quantity") %></td>
            <td><%= request.getParameter("total") %></td>
        </tr>
    </tbody>
    <tfoot>
        <tr>
            <td colspan="5" style="text-align:right;"><strong>Bill Amount: </strong></td>
            <td id="billAmount">0</td>
        </tr>
    </tfoot>
</table></form>
<script>
function addToFourth() {
    const pcode = document.getElementById('pcode').value;
    const pname = document.getElementById('pname').value;
    const rate = document.getElementById('rate').value;
    const quantity = document.getElementById('quantity').value;
    const total = document.getElementById('total').value;
    const table = document.getElementById('fourthTable');
    const row = table.insertRow();
    row.insertCell(0).innerHTML = pcode;
    row.insertCell(1).innerHTML = pname;
    row.insertCell(2).innerHTML = rate;
    row.insertCell(3).innerHTML = quantity;
    row.insertCell(4).innerHTML = total;
    calculateBillAmount();
}
function calculateBillAmount() {
    let totalAmount = 0;
    const totals = document.querySelectorAll('#fourthTable tr td:nth-child(5)');
    totals.forEach(total => {
        totalAmount += parseFloat(total.innerHTML);
    });
    document.getElementById('billAmount').innerText = totalAmount.toFixed(2);
}
function populateTable() {
    let tableBody = document.getElementById('productRows');
    let totalBill = 0;
    productData.forEach((product, index) => {
        let total = product.rate * product.quantity;
        totalBill += total;
        let row = `<tr>
                    <td>${index + 1}</td>
                    <td>${product.pcode}</td>
                    <td>${product.pname}</td>
                    <td>${product.rate}</td>
                    <td>${product.quantity}</td>
                    <td>${total}</td>
                   </tr>`;
        tableBody.innerHTML += row;
    });
    // Update the total bill
    document.getElementById('billAmount').innerText = totalBill.toString();
}
// Call the function to populate the table when the page is loaded
window.onload = populateTable;
function calculateTotal(rate) {
    var quantity = parseFloat(document.getElementById("quantity").value);
    var total = rate * quantity;
    document.getElementById("total").value = total.toFixed(2);
}
function populateThirdForm(pcode, pname, rate) {
    document.getElementById('pcode').value = pcode;
    document.getElementById('pname').value = pname;
    document.getElementById('rate').value = rate;
    // Assuming you have an input for quantity in third.jsp part
    document.getElementById('quantity').addEventListener('input', function(){
        const quantity = this.value;
        const total = quantity * rate;
        document.getElementById('total').value = total;
    });
}
function lookupName() {
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