package yellowbeesupermarket;

import java.io.IOException;
import java.sql.*;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@SuppressWarnings("serial")
@WebServlet("/Productupdate")

public class Productupdate extends HttpServlet {

    // Database configuration
    final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    final String DB_URL = "jdbc:mysql://localhost/yellowbees";
    final String USER = "root";
    final String PASS = "";
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Getting the product code from the request
        String pcode = request.getParameter("pcode");
        String pname = request.getParameter("pname");
        
        // Determine if we're fetching or updating
        boolean isFetch = (pname == null);

        // Establish connection
        Connection conn = null;
        PreparedStatement stmt = null;
        String sql;
        
        try {
            // Register JDBC driver and open a connection
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            
            if (isFetch) {
                // SQL to get product details
                sql = "SELECT * FROM product WHERE pcode = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, pcode);

                ResultSet rs = stmt.executeQuery();

                // Extract data from result set
                if (rs.next()) {
                    HashMap<String, String> product = new HashMap<>();
                    product.put("pcode", rs.getString("pcode"));
                    product.put("pname", rs.getString("pname"));
                    product.put("type", rs.getString("type"));
                    product.put("rate", rs.getString("rate"));
                    product.put("stock", rs.getString("stock"));
                    product.put("seller", rs.getString("seller"));
                    product.put("dateofstock", rs.getString("dateofstock"));
                    
                    // Add product details to request attribute
                    request.setAttribute("product", product);
                    request.getRequestDispatcher("/updateproduct.jsp").forward(request, response);
                }
                rs.close();
            } else {
                // SQL to update product details
                sql = "UPDATE product SET pname=?, type=?, rate=?, stock=?, seller=?, dateofstock=? WHERE pcode=?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, request.getParameter("pname"));
                stmt.setString(2, request.getParameter("type"));
                stmt.setFloat(3, Float.parseFloat(request.getParameter("rate")));
                stmt.setInt(4, Integer.parseInt(request.getParameter("stock")));
                stmt.setString(5, request.getParameter("seller"));
                stmt.setString(6, request.getParameter("dateofstock"));
                stmt.setString(7, pcode);

                stmt.executeUpdate();
                
                // Redirect or display success message
                response.sendRedirect("http://localhost:8080/yellowbeesupermarket/success.jsp"); // or you can display a success message
            }
        } catch (SQLException se) {
            // Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            // Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            // Finally block used to close resources
            try {
                if (stmt != null) stmt.close();
            } catch (SQLException se2) {
            }
            try {
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
}