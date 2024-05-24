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
 * Servlet implementation class Buyerdetails
 */
@WebServlet("/Buyerdetails")
public class Buyerdetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String page="buyerdetails.jsp";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Buyerdetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter(); 
		Connection con;
		ResultSet rs;
		response.setContentType("text/html");
		List<String> dataList=new ArrayList<String>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost/yellowbees","root","");
		String sql="select * from newbuyer";
		Statement s= con.createStatement();
		s.executeQuery(sql);
		rs=s.getResultSet();
		while(rs.next()) {
			dataList.add(rs.getString("cusname"));
			dataList.add(rs.getString("Mobilenumber"));
			dataList.add(rs.getString("mail"));
			dataList.add(rs.getString("address"));
		}
		rs.close();
		//out.println(dataList);
		s.close();
		}catch(Exception e) {
			out.println("exception is;"+e);		
		}
		request.setAttribute("data", dataList);
		RequestDispatcher dispatcher=request.getRequestDispatcher(page);
	if(dispatcher !=null) {
		dispatcher.forward(request, response);	
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
