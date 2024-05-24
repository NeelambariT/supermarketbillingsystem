<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style1.css">
<title>pro</title>
</head>
<form action ="ProductServlet" method="get" id="">
<table id="tabledetails">
<tr>
<th><b>pcode</b></th>
<th><b>pname</b></th>
<th><b>type</b></th>
<th><b>rate</b></th>

</tr>
<%
  List<?> data= (List<?>)request.getAttribute("data");
for (Iterator<?>itrr=data.iterator(); 
		itrr.hasNext(); )
{
%>
<tr>
<td><%=itrr.next()%></td>
<td><%=itrr.next()%></td>
<td><%=itrr.next()%></td>
<td><%=itrr.next()%></td>
</tr>
<%}%>

</table>
</form>
<!-- <script>
    document.addEventListener('DOMContentLoaded', function() {
        fetch('ProductServlet') // Your servlet URL here
            .then(function(response) {
                return response.json(); // Assuming the servlet sends back JSON
            })
            .then(function(data) {
                let productListElement = document.getElementById('dataList');
                productListElement.innerHTML = ''; // Clear the current list
                // Assumes 'data' is a list of product objects with pcode, pname, type, rate properties
                data.forEach(function(item) {
                    let productInfo = `<div>
                                           <h2>${item.pname}</h2>
                                           <p>Code: ${item.pcode}</p>
                                           <p>Type: ${item.type}</p>
                                           <p>Rate: ${item.rate}</p>
                                       </div>`;
                    dataListElement.innerHTML += productInfo;
                });
            })
            .catch(function(error) {
                console.error('Error fetching data: ', error);
            });
    });
</script>-->
<script>
document.addEventListener('DOMContentLoaded', function() {
    fetch('ProductServlet')
        .then(function(response) {
            return response.json();
        })
        .then(function(data) {
            let tableDetailsElement = document.getElementById('tabledetails');
            // Assumes 'data' is a list: [pcode1, pname1, type1, rate1, pcode2, pname2, ...]
            for (let i = 0; i < data.length; i += 4) {
                let row = `<tr>
                               <td>${data[i]}</td>
                               <td>${data[i + 1]}</td>
                               <td>${data[i + 2]}</td>
                               <td>${data[i + 3]}</td>
                           </tr>`;
                tableDetailsElement.innerHTML += row;
            }
        })
        .catch(function(error) {
            console.error('Error fetching data: ', error);
        });
});
</script>
</html>