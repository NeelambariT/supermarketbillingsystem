package yellowbeesupermarket;

import java.io.IOException;
import java.sql.*;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 * Servlet implementation class Updatebuyer
 */
@WebServlet("/Updatebuyer")
public class Updatebuyer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    final String DB_URL = "jdbc:mysql://localhost/yellowbees";
    final String USER = "root";
    final String PASS = "";
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    }
       
    /**
     * @see HttpServlet#HttpServlet()
     */
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Getting the product code from the request
        String Mobilenumber = request.getParameter("Mobilenumber");
        String cusname = request.getParameter("cusname");
        
        // Determine if we're fetching or updating
        boolean isFetch = (cusname == null);

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
                sql = "SELECT * FROM newbuyer WHERE Mobilenumber = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, Mobilenumber);

                ResultSet rs = stmt.executeQuery();

                // Extract data from result set
                if (rs.next()) {
                    HashMap<String, String> newbuyer = new HashMap<>();
                    newbuyer.put("cusname", rs.getString("cusname"));
                    newbuyer.put("Mobilenumber", rs.getString("Mobilenumber"));
                    newbuyer.put("address", rs.getString("address"));
                    newbuyer.put("mail", rs.getString("mail"));
                    
                    
                    //Add product details to request attribute
                    request.setAttribute("newbuyer", newbuyer);
                    request.getRequestDispatcher("/updatebuyer.jsp").forward(request, response);
                }
                rs.close();
            } else {
               
                sql = "UPDATE newbuyer SET cusname=?, address=?, mail=? WHERE Mobilenumber=?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, request.getParameter("cusname"));
                stmt.setString(2, request.getParameter("address"));
                stmt.setString(3, request.getParameter("mail"));
                stmt.setString(4, Mobilenumber);
                
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