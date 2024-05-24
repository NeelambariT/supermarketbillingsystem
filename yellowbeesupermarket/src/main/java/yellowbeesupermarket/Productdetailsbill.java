package yellowbeesupermarket;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Productdetailsbill
 */
@WebServlet("/Productdetailsbill")
public class Productdetailsbill extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
      
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Productdetailsbill() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	List<Object> dataList=new ArrayList<Object>();
    	PrintWriter out=response.getWriter(); 
         // Database connection should use proper resource management and security practices.
         try {
        	 Class.forName("com.mysql.jdbc.Driver");
        	 Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/yellowbees","root","");
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT pcode, pname, type, rate FROM product");

            
            	 while(rs.next()) {
         			dataList.add(rs.getString("pcode"));
         			dataList.add(rs.getString("pname"));
         			dataList.add(rs.getString("type"));
         			dataList.add(rs.getString("rate"));
             }

             request.setAttribute("data", dataList);
             RequestDispatcher dispatcher = request.getRequestDispatcher("productdetailsbill.jsp");
             if(dispatcher !=null) {
         		dispatcher.forward(request, response);	
         	}

             rs.close();
             stmt.close();
             conn.close();
             
         } catch(Exception e) {
 			out.println("exception is;"+e);		
 		}
         
    }
}
     
     