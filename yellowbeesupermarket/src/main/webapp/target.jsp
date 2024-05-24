<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Enter Quantity</title>
    <script>
        function calculateTotal(rate) {
            var quantity = parseFloat(document.getElementById("quantity").value);
            var total = rate * quantity;
            document.getElementById("total").value = total.toFixed(2);
        }
    </script>
</head>
<body>
    <form action="displayFinal.jsp" method="post">
        <input type="hidden" name="pcode" value="<%= request.getParameter("pcode") %>">
        <input type="hidden" name="pname" value="<%= request.getParameter("pname") %>">
        Product Code: <%= request.getParameter("pcode") %><br>
        Product Name: <%= request.getParameter("pname") %><br>
        Rate: <input type="text" name="rate" value="<%= request.getParameter("rate") %>" readonly><br>
        Quantity: <input type="text" id="quantity" name="quantity" onkeyup="calculateTotal(<%= request.getParameter("rate") %>)"><br>
        Total: <input type="text" id="total" name="total" readonly><br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>