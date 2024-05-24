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


 
@WebServlet("/NameLookupServlet")
public class NameLookupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NameLookupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mobileNumber = request.getParameter("mobileNumber");
        String customerName = ""; // Initialize to empty
        // Perform database lookup to find customerName based on mobileNumber
        // Assume `yellowbees` is your connection to the database
        try {
     Class.forName("com.mysql.jdbc.Driver");
   	 Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/yellowbees","root","");
        String query = "SELECT cusname FROM newbuyer WHERE Mobilenumber = ?";
        try (PreparedStatement statement = conn.prepareStatement(query)) {
            statement.setString(1, mobileNumber);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    customerName = resultSet.getString("cusname");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(customerName);
        } catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
        	
        }
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
