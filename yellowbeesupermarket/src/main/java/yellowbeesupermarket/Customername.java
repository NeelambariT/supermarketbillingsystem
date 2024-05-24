package yellowbeesupermarket;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Customername
 */
@WebServlet("/Customername")
public class Customername extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String page="customername.jsp";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Customername() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cmob = request.getParameter("cmob");
        String cusname = null;
        
        /**final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
        final String DB_URL = "jdbc:mysql://localhost/yellowbees";
        final String USER = "root";
        final String PASS = "";**/
		
        PreparedStatement stmt = null; 
		Connection con=null;
		ResultSet rs;
		response.setContentType("text/html");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost/yellowbees","root","");
		//String cmobe=request.getParameter("cmob");
			 String sql = "SELECT cusname FROM newbuyer WHERE Mobilenumber = ?";
			 stmt = con.prepareStatement(sql);
	         stmt.setString(1, cmob);
	          rs = stmt.executeQuery();
	         if(rs.next()) {
	                //Retrieve by column name
	                cusname = rs.getString("cusname");
	            }
	         rs.close();
        } catch (SQLException se) {
            se.printStackTrace();
            //Handle errors for JDBC
        } catch (Exception e) {
            e.printStackTrace();
            //Handle errors for Class.forName
        } finally {
            //finally block used to close resources
            try {
                if(stmt!=null) stmt.close();
            } catch(SQLException se2) {
                // nothing we can do
            }
            try {
                if(con!=null) con.close();
            } catch(SQLException se) {
                se.printStackTrace();
            }
        }
        
        // Set name to request and forward to JSP
        request.setAttribute("cusname", cusname);
        request.getRequestDispatcher("customername.jsp").forward(request, response);
    }
}
