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
 * Servlet implementation class Billingcusname
 */
@WebServlet("/Billingcusname")
public class Billingcusname extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String page="billing.jsp";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Billingcusname() {
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
		@SuppressWarnings("unused")
		String cname;
		response.setContentType("text/html");
		List<String> dataList=new ArrayList<String>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost/yellowbees","root","");
		String mob=request.getParameter("cmob");
		Statement st= con.createStatement();
		rs=st.getResultSet();
		rs=st.executeQuery("select * from newbuyer where Mobilenumber='"+mob+"'");
		if(rs.next()) {
	     cname=rs.getString("cusname");}
		rs.close();
		//out.println(dataList);
		st.close();
		}catch(Exception e) {
			out.println("exception is"+e);		
		}
		request.setAttribute("cname", dataList);
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
