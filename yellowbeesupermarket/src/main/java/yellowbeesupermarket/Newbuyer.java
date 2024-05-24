package yellowbeesupermarket;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Newbuyer
 */
@WebServlet("/Newbuyer")
public class Newbuyer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Newbuyer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");
		PrintWriter out=response.getWriter(); 
		Connection con;
		String cs=request.getParameter("cname");
		String mob=request.getParameter("cmob");
		String add=request.getParameter("cadd");
		String email=request.getParameter("cmail");
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost/yellowbees","root","");
			String sql=("insert into newbuyer(cusname,Mobilenumber,address,mail) values"
					+ "('"+cs+"','"+mob+"','"+add+"','"+email+"')");
						PreparedStatement st= con.prepareStatement(sql);
						st.executeUpdate(sql);
						out.println("successfully registered");
						response.sendRedirect("http://localhost:8080/yellowbeesupermarket/success.jsp");
						st.close();
						con.close();
					}
					catch(Exception ex)
					{
						out.println(ex);
						out.close();
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
